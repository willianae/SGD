unit U_FrmRelRecebimentoCSV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmRelPadrao, Data.DB, RLFilters,
  RLPDFFilter, RLReport, U_DtmDadosRelRecebimentoCSV;

type
  TFrmRelRecebimentoCSV = class(TFrmRelPadrao)
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabelValor: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabelTotal: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLLabel6: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel1: TRLLabel;
    RLBand6: TRLBand;
    RLLabel8: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLDraw13: TRLDraw;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FValorServico: Double;
    ValorTotal:Double;
    procedure SetValorServico(const Value: Double);
    { Private declarations }
  public
    { Public declarations }
    property ValorServico: Double read FValorServico write SetValorServico;
    procedure imprimir;
  end;

var
  FrmRelRecebimentoCSV: TFrmRelRecebimentoCSV;

implementation

{$R *.dfm}

procedure TFrmRelRecebimentoCSV.FormCreate(Sender: TObject);
begin
  inherited;
  ValorTotal := 0;
  DtmDadosRelRecebimentoCSV := TDtmDadosRelRecebimentoCSV.Create(nil);
end;

procedure TFrmRelRecebimentoCSV.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosRelRecebimentoCSV);
end;

procedure TFrmRelRecebimentoCSV.imprimir;
begin
  DtmDadosRelRecebimentoCSV.listar;
  RLLabelValor.Caption := FormatFloat('###,###,##0.00',ValorServico);
  RLReport1.PreviewModal;
end;

procedure TFrmRelRecebimentoCSV.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  RLLabelTotal.Caption := FormatFloat('###,###,##0.00',ValorTotal);
end;

procedure TFrmRelRecebimentoCSV.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  ValorTotal := ValorTotal + ValorServico;
end;

procedure TFrmRelRecebimentoCSV.SetValorServico(const Value: Double);
begin
  FValorServico := Value;
end;

end.
