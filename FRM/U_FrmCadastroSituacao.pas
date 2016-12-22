unit U_FrmCadastroSituacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosSituacao, U_BibliotecaFuncoes, U_TSituacao;

type
  TFrmCadastroSituacao = class(TFrmCadastroPadrao)
    Label2: TLabel;
    edtCodigo: TEdit;
    Label3: TLabel;
    edtDescricao: TEdit;
    dlgColor: TColorDialog;
    btnEscolheCor: TBitBtn;
    pnlCor: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbgrdConsultaTitleClick(Column: TColumn);
    procedure edtPesquisaChange(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure dbgrdConsultaDblClick(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEscolheCorClick(Sender: TObject);
    procedure dbgrdConsultaDrawColumnCell(Sender: TObject;
      const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    TipoOperacao: TTipoOperacao;
    procedure limpar;
    function validaCampos: boolean;
  public
    { Public declarations }
    procedure SetTipoOperacao(oTipoOperacao:TTipoOperacao);
  end;

var
  FrmCadastroSituacao: TFrmCadastroSituacao;

implementation

{$R *.dfm}

procedure TFrmCadastroSituacao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text := FormatFloat('00', DtmDadosSituacao.cdsPesquisacodigo.AsInteger);
    edtDescricao.Text := DtmDadosSituacao.cdsPesquisadescricao.AsString;
    pnlCor.Color := StringToColor(DtmDadosSituacao.cdsPesquisacolor.AsString);
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroSituacao.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroSituacao.btnEscolheCorClick(Sender: TObject);
begin
  inherited;
  if dlgColor.Execute() then
  begin
    pnlCor.Color := dlgColor.Color;
    //Edit1.Text := ColorToString(ColorDialog1.Color)
  end;
end;

procedure TFrmCadastroSituacao.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosSituacao.excluir(DtmDadosSituacao.cdsPesquisacodigo.AsInteger);
    DtmDadosSituacao.listar;
  end;
end;

procedure TFrmCadastroSituacao.btnSalvarClick(Sender: TObject);
var
  vSituacao: TSituacao;
begin
  inherited;
  if not validaCampos then
    Exit;

  vSituacao := TSituacao.Create;
  try
    if TipoOperacao = toAlterar then
      vSituacao.codigo := StrToInt(edtCodigo.Text);
    vSituacao.descricao := edtDescricao.Text;
    vSituacao.color := ColorToString(pnlCor.Color);
    DtmDadosSituacao.salvar(vSituacao);
    DtmDadosSituacao.listar;

    limpar;
  finally
    FreeAndNil(vSituacao);
  end;

end;

procedure TFrmCadastroSituacao.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroSituacao.dbgrdConsultaDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if DataCol = 2 then
  begin
    dbgrdConsulta.Canvas.Brush.Color := StringToColor(DtmDadosSituacao.cdsPesquisacolor.AsString);
    dbgrdConsulta.DefaultDrawDataCell(Rect, dbgrdConsulta.columns[datacol].field, State);
  end;
end;

procedure TFrmCadastroSituacao.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosSituacao.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosSituacao.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;
  edtPesquisa.Clear;


  lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroSituacao.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroSituacao.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosSituacao.cdsPesquisa.Locate(DtmDadosSituacao.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosSituacao.cdsPesquisa.First;
end;

procedure TFrmCadastroSituacao.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if DtmDadosSituacao.cdsPesquisa.IndexFieldNames = 'CODIGO' then
    KeyPressCampoValor(Key);
end;

procedure TFrmCadastroSituacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if TipoOperacao <> toCadastroRapido then
  begin
    Action := caFree;
    FrmCadastroSituacao := nil;
  end;
end;

procedure TFrmCadastroSituacao.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosSituacao := TDtmDadosSituacao.Create(nil);
  TipoOperacao := toInserir;
end;

procedure TFrmCadastroSituacao.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosSituacao);
end;

procedure TFrmCadastroSituacao.limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroSituacao.SetTipoOperacao(oTipoOperacao: TTipoOperacao);
begin
  TipoOperacao := oTipoOperacao;
end;

procedure TFrmCadastroSituacao.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TFrmCadastroSituacao.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtDescricao.Text) = '' then
    exibeMensagem('Informe a descrição!',tmAviso)
  else
    Result := True;
end;

end.
