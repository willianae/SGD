unit U_FrmRelConvocacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmRelPadrao, RLReport, Data.DB,
  RLFilters, RLPDFFilter;

type
  TFrmRelConvocacao = class(TFrmRelPadrao)
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    rlblAnoIpva: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBResult1: TRLDBResult;
    RLBand6: TRLBand;
    RLLblTituloSeguradora: TRLLabel;
    RLLabelCidadeUFEmp: TRLLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelConvocacao: TFrmRelConvocacao;

implementation

{$R *.dfm}

uses U_DtmDadosConvocacao;

end.
