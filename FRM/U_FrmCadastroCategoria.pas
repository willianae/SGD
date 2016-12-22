unit U_FrmCadastroCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosCategoria, U_BibliotecaFuncoes, U_TCategoria;

type
  TFrmCadastroCategoria = class(TFrmCadastroPadrao)
    Label2: TLabel;
    edtCodigo: TEdit;
    Label3: TLabel;
    edtDescricao: TEdit;
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
  FrmCadastroCategoria: TFrmCadastroCategoria;

implementation

{$R *.dfm}

procedure TFrmCadastroCategoria.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text := FormatFloat('00', DtmDadosCategoria.cdsPesquisacodigo.AsInteger);
    edtDescricao.Text := DtmDadosCategoria.cdsPesquisadescricao.AsString;
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroCategoria.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroCategoria.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosCategoria.excluir(DtmDadosCategoria.cdsPesquisacodigo.AsInteger);
    DtmDadosCategoria.listar;
  end;
end;

procedure TFrmCadastroCategoria.btnSalvarClick(Sender: TObject);
var
  vCategoria: TCategoria;
begin
  inherited;
  if not validaCampos then
    Exit;

  vCategoria := TCategoria.Create;
  try
    if TipoOperacao = toAlterar then
      vCategoria.codigo := StrToInt(edtCodigo.Text);
    vCategoria.descricao := edtDescricao.Text;
    DtmDadosCategoria.salvar(vCategoria);
    DtmDadosCategoria.listar;

    limpar;
  finally
    FreeAndNil(vCategoria);
  end;

end;

procedure TFrmCadastroCategoria.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroCategoria.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosCategoria.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosCategoria.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;
  edtPesquisa.Clear;

  lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroCategoria.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroCategoria.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosCategoria.cdsPesquisa.Locate(DtmDadosCategoria.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosCategoria.cdsPesquisa.First;
end;

procedure TFrmCadastroCategoria.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if DtmDadosCategoria.cdsPesquisa.IndexFieldNames = 'CODIGO' then
    KeyPressCampoValor(Key);
end;

procedure TFrmCadastroCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if TipoOperacao <> toCadastroRapido then
  begin
    Action := caFree;
    FrmCadastroCategoria := nil;
  end;
end;

procedure TFrmCadastroCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosCategoria := TDtmDadosCategoria.Create(nil);
  TipoOperacao := toInserir;
end;

procedure TFrmCadastroCategoria.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosCategoria);
end;

procedure TFrmCadastroCategoria.limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroCategoria.SetTipoOperacao(oTipoOperacao: TTipoOperacao);
begin
  TipoOperacao := oTipoOperacao;
end;

procedure TFrmCadastroCategoria.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TFrmCadastroCategoria.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtDescricao.Text) = '' then
    exibeMensagem('Informe a descrição!',tmAviso)
  else
    Result := True;
end;

end.
