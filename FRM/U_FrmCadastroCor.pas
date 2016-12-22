unit U_FrmCadastroCor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosCor, U_BibliotecaFuncoes, U_TCor;

type
  TFrmCadastroCor = class(TFrmCadastroPadrao)
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
  FrmCadastroCor: TFrmCadastroCor;

implementation

{$R *.dfm}

procedure TFrmCadastroCor.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text := FormatFloat('00', DtmDadosCor.cdsPesquisacodigo.AsInteger);
    edtDescricao.Text := DtmDadosCor.cdsPesquisadescricao.AsString;
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroCor.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroCor.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosCor.excluir(DtmDadosCor.cdsPesquisacodigo.AsInteger);
    DtmDadosCor.listar;
  end;
end;

procedure TFrmCadastroCor.btnSalvarClick(Sender: TObject);
var
  vCor: TCor;
begin
  inherited;
  if not validaCampos then
    Exit;

  vCor := TCor.Create;
  try
    if TipoOperacao = toAlterar then
      vCor.codigo := StrToInt(edtCodigo.Text);
    vCor.descricao := edtDescricao.Text;
    DtmDadosCor.salvar(vCor);
    DtmDadosCor.listar;

    limpar;
  finally
    FreeAndNil(vCor);
  end;

end;

procedure TFrmCadastroCor.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroCor.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosCor.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosCor.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;
  edtPesquisa.Clear;

  lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroCor.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroCor.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosCor.cdsPesquisa.Locate(DtmDadosCor.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosCor.cdsPesquisa.First;
end;

procedure TFrmCadastroCor.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if DtmDadosCor.cdsPesquisa.IndexFieldNames = 'CODIGO' then
    KeyPressCampoValor(Key);
end;

procedure TFrmCadastroCor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if TipoOperacao <> toCadastroRapido then
  begin
    Action := caFree;
    FrmCadastroCor := nil;
  end;
end;

procedure TFrmCadastroCor.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosCor := TDtmDadosCor.Create(nil);
  TipoOperacao := toInserir;
end;

procedure TFrmCadastroCor.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosCor);
end;

procedure TFrmCadastroCor.limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroCor.SetTipoOperacao(oTipoOperacao: TTipoOperacao);
begin
  TipoOperacao := oTipoOperacao;
end;

procedure TFrmCadastroCor.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TFrmCadastroCor.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtDescricao.Text) = '' then
    exibeMensagem('Informe a descrição!',tmAviso)
  else
    Result := True;
end;

end.
