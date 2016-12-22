unit U_FrmCadastroMarcaModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosMarcaModelo, U_BibliotecaFuncoes, U_TMarcaModelo;

type
  TFrmCadastroMarcaModelo = class(TFrmCadastroPadrao)
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
  FrmCadastroMarcaModelo: TFrmCadastroMarcaModelo;

implementation

{$R *.dfm}

procedure TFrmCadastroMarcaModelo.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text := FormatFloat('00', DtmDadosMarcaModelo.cdsPesquisacodigo.AsInteger);
    edtDescricao.Text := DtmDadosMarcaModelo.cdsPesquisadescricao.AsString;
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroMarcaModelo.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroMarcaModelo.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosMarcaModelo.excluir(DtmDadosMarcaModelo.cdsPesquisacodigo.AsInteger);
    DtmDadosMarcaModelo.listar;
  end;
end;

procedure TFrmCadastroMarcaModelo.btnSalvarClick(Sender: TObject);
var
  vMarcaModelo: TMarcaModelo;
begin
  inherited;
  if not validaCampos then
    Exit;

  vMarcaModelo := TMarcaModelo.Create;
  try
    if TipoOperacao = toAlterar then
      vMarcaModelo.codigo := StrToInt(edtCodigo.Text);
    vMarcaModelo.descricao := edtDescricao.Text;
    DtmDadosMarcaModelo.salvar(vMarcaModelo);
    DtmDadosMarcaModelo.listar;

    limpar;
  finally
    FreeAndNil(vMarcaModelo);
  end;

end;

procedure TFrmCadastroMarcaModelo.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroMarcaModelo.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosMarcaModelo.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosMarcaModelo.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;
  edtPesquisa.Clear;

  lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroMarcaModelo.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroMarcaModelo.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosMarcaModelo.cdsPesquisa.Locate(DtmDadosMarcaModelo.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosMarcaModelo.cdsPesquisa.First;
end;

procedure TFrmCadastroMarcaModelo.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if DtmDadosMarcaModelo.cdsPesquisa.IndexFieldNames = 'CODIGO' then
    KeyPressCampoValor(Key);
end;

procedure TFrmCadastroMarcaModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if TipoOperacao <> toCadastroRapido then
  begin
    Action := caFree;
    FrmCadastroMarcaModelo := nil;
  end;
end;

procedure TFrmCadastroMarcaModelo.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosMarcaModelo := TDtmDadosMarcaModelo.Create(nil);
  TipoOperacao := toInserir;
end;

procedure TFrmCadastroMarcaModelo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosMarcaModelo);
end;

procedure TFrmCadastroMarcaModelo.limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroMarcaModelo.SetTipoOperacao(oTipoOperacao: TTipoOperacao);
begin
  TipoOperacao := oTipoOperacao;
end;

procedure TFrmCadastroMarcaModelo.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TFrmCadastroMarcaModelo.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtDescricao.Text) = '' then
    exibeMensagem('Informe a descrição!',tmAviso)
  else
    Result := True;
end;

end.
