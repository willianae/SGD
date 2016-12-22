unit U_FrmCadastroTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosTipo, U_BibliotecaFuncoes, U_TTipo;

type
  TFrmCadastroTipo = class(TFrmCadastroPadrao)
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
  FrmCadastroTipo: TFrmCadastroTipo;

implementation

{$R *.dfm}

procedure TFrmCadastroTipo.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text := FormatFloat('00', DtmDadosTipo.cdsPesquisacodigo.AsInteger);
    edtDescricao.Text := DtmDadosTipo.cdsPesquisadescricao.AsString;
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroTipo.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroTipo.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosTipo.excluir(DtmDadosTipo.cdsPesquisacodigo.AsInteger);
    DtmDadosTipo.listar;
  end;
end;

procedure TFrmCadastroTipo.btnSalvarClick(Sender: TObject);
var
  vTipo: TTipo;
begin
  inherited;
  if not validaCampos then
    Exit;

  vTipo := TTipo.Create;
  try
    if TipoOperacao = toAlterar then
      vTipo.codigo := StrToInt(edtCodigo.Text);
    vTipo.descricao := edtDescricao.Text;
    DtmDadosTipo.salvar(vTipo);
    DtmDadosTipo.listar;

    limpar;
  finally
    FreeAndNil(vTipo);
  end;

end;

procedure TFrmCadastroTipo.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroTipo.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosTipo.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosTipo.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;
  edtPesquisa.Clear;

  lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroTipo.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroTipo.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosTipo.cdsPesquisa.Locate(DtmDadosTipo.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosTipo.cdsPesquisa.First;
end;

procedure TFrmCadastroTipo.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if DtmDadosTipo.cdsPesquisa.IndexFieldNames = 'CODIGO' then
    KeyPressCampoValor(Key);
end;

procedure TFrmCadastroTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if TipoOperacao <> toCadastroRapido then
  begin
    Action := caFree;
    FrmCadastroTipo := nil;
  end;
end;

procedure TFrmCadastroTipo.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosTipo := TDtmDadosTipo.Create(nil);
  TipoOperacao := toInserir;
end;

procedure TFrmCadastroTipo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosTipo);
end;

procedure TFrmCadastroTipo.limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroTipo.SetTipoOperacao(oTipoOperacao: TTipoOperacao);
begin
  TipoOperacao := oTipoOperacao;
end;

procedure TFrmCadastroTipo.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TFrmCadastroTipo.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtDescricao.Text) = '' then
    exibeMensagem('Informe a descrição!',tmAviso)
  else
    Result := True;
end;

end.
