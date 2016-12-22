unit U_FrmCadastroCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosCombustivel, U_BibliotecaFuncoes, U_TCombustivel;

type
  TFrmCadastroCombustivel = class(TFrmCadastroPadrao)
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
  FrmCadastroCombustivel: TFrmCadastroCombustivel;

implementation

{$R *.dfm}

procedure TFrmCadastroCombustivel.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text := FormatFloat('00', DtmDadosCombustivel.cdsPesquisacodigo.AsInteger);
    edtDescricao.Text := DtmDadosCombustivel.cdsPesquisadescricao.AsString;
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroCombustivel.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroCombustivel.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosCombustivel.excluir(DtmDadosCombustivel.cdsPesquisacodigo.AsInteger);
    DtmDadosCombustivel.listar;
  end;
end;

procedure TFrmCadastroCombustivel.btnSalvarClick(Sender: TObject);
var
  vCombustivel: TCombustivel;
begin
  inherited;
  if not validaCampos then
    Exit;

  vCombustivel := TCombustivel.Create;
  try
    if TipoOperacao = toAlterar then
      vCombustivel.codigo := StrToInt(edtCodigo.Text);
    vCombustivel.descricao := edtDescricao.Text;
    DtmDadosCombustivel.salvar(vCombustivel);
    DtmDadosCombustivel.listar;

    limpar;
  finally
    FreeAndNil(vCombustivel);
  end;

end;

procedure TFrmCadastroCombustivel.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroCombustivel.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosCombustivel.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosCombustivel.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;
  edtPesquisa.Clear;


  lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroCombustivel.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroCombustivel.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosCombustivel.cdsPesquisa.Locate(DtmDadosCombustivel.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosCombustivel.cdsPesquisa.First;
end;

procedure TFrmCadastroCombustivel.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if DtmDadosCombustivel.cdsPesquisa.IndexFieldNames = 'CODIGO' then
    KeyPressCampoValor(Key);
end;

procedure TFrmCadastroCombustivel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if TipoOperacao <> toCadastroRapido then
  begin
    Action := caFree;
    FrmCadastroCombustivel := nil;
  end;
end;

procedure TFrmCadastroCombustivel.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosCombustivel := TDtmDadosCombustivel.Create(nil);
  TipoOperacao := toInserir;
end;

procedure TFrmCadastroCombustivel.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosCombustivel);
end;

procedure TFrmCadastroCombustivel.limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroCombustivel.SetTipoOperacao(oTipoOperacao: TTipoOperacao);
begin
  TipoOperacao := oTipoOperacao;
end;

procedure TFrmCadastroCombustivel.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TFrmCadastroCombustivel.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtDescricao.Text) = '' then
    exibeMensagem('Informe a descrição!',tmAviso)
  else
    Result := True;
end;

end.
