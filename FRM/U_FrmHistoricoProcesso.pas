unit U_FrmHistoricoProcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  U_DtmDadosHistoricoProcesso, U_BibliotecaFuncoes, Vcl.Mask;

type
  TFrmHistoricoProcesso = class(TFrmCadastroPadrao)
    btnPesquisar: TBitBtn;
    medtPlaca: TMaskEdit;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbgrdConsultaTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrdConsultaDrawColumnCell(Sender: TObject;
      const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    FPlaca: String;
    procedure SetPlaca(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Placa:String read FPlaca write SetPlaca;
  end;

var
  FrmHistoricoProcesso: TFrmHistoricoProcesso;

implementation

{$R *.dfm}

procedure TFrmHistoricoProcesso.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  if (medtPlaca.Text) = '   -    ' then
    exibeMensagem('Informe a placa!',tmAviso, medtPlaca, True)
  else
  begin
    DtmDadosHistoricoProcesso.listar(medtPlaca.Text);
    if DtmDadosHistoricoProcesso.cdsPesquisa.IsEmpty then
      exibeMensagem('Não há registros para essa placa!',tmInformacao) ;
  end;

end;

procedure TFrmHistoricoProcesso.dbgrdConsultaDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not odd(dbgrdConsulta.DataSource.DataSet.RecNo) then
    if not (gdSelected in State) then
    begin
      dbgrdConsulta.Canvas.Brush.Color := clMoneyGreen;
      dbgrdConsulta.Canvas.FillRect(Rect);
      dbgrdConsulta.DefaultDrawDataCell(rect,Column.Field,state);
    end;
end;

procedure TFrmHistoricoProcesso.dbgrdConsultaTitleClick(Column: TColumn);
begin
 // inherited;

end;

procedure TFrmHistoricoProcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Placa := EmptyStr;
  Action := caFree;
  FrmHistoricoProcesso := nil;
end;

procedure TFrmHistoricoProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosHistoricoProcesso := TDtmDadosHistoricoProcesso.Create(nil);
end;

procedure TFrmHistoricoProcesso.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosHistoricoProcesso);
end;

procedure TFrmHistoricoProcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F4 then Self.Close;
  
end;

procedure TFrmHistoricoProcesso.FormShow(Sender: TObject);
begin
  inherited;
  medtPlaca.SetFocus;
  if FPlaca <> '' then
  begin
    medtPlaca.Text := FPlaca;
    btnPesquisar.Click;
    dbgrdConsulta.SetFocus;
  end;

end;

procedure TFrmHistoricoProcesso.SetPlaca(const Value: String);
begin
  FPlaca := Value;
end;

end.
