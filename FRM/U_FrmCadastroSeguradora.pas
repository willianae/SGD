unit U_FrmCadastroSeguradora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosSeguradora, U_BibliotecaFuncoes, U_TSeguradora;

type
  TFrmCadastroSeguradora = class(TFrmCadastroPadrao)
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
  FrmCadastroSeguradora: TFrmCadastroSeguradora;

implementation

{$R *.dfm}

procedure TFrmCadastroSeguradora.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text := FormatFloat('00', DtmDadosSeguradora.cdsPesquisacodigo.AsInteger);
    edtDescricao.Text := DtmDadosSeguradora.cdsPesquisadescricao.AsString;
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroSeguradora.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroSeguradora.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosSeguradora.excluir(DtmDadosSeguradora.cdsPesquisacodigo.AsInteger);
    DtmDadosSeguradora.listar;
  end;
end;

procedure TFrmCadastroSeguradora.btnSalvarClick(Sender: TObject);
var
  vSeguradora: TSeguradora;
begin
  inherited;
  if not validaCampos then
    Exit;

  vSeguradora := TSeguradora.Create;
  try
    if TipoOperacao = toAlterar then
      vSeguradora.codigo := StrToInt(edtCodigo.Text);
    vSeguradora.descricao := edtDescricao.Text;
    DtmDadosSeguradora.salvar(vSeguradora);
    DtmDadosSeguradora.listar;

    limpar;
  finally
    FreeAndNil(vSeguradora);
  end;

end;

procedure TFrmCadastroSeguradora.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroSeguradora.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosSeguradora.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosSeguradora.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;
  edtPesquisa.Clear;

  lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroSeguradora.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroSeguradora.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosSeguradora.cdsPesquisa.Locate(DtmDadosSeguradora.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosSeguradora.cdsPesquisa.First;
end;

procedure TFrmCadastroSeguradora.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if DtmDadosSeguradora.cdsPesquisa.IndexFieldNames = 'CODIGO' then
    KeyPressCampoValor(Key);
end;

procedure TFrmCadastroSeguradora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if TipoOperacao <> toCadastroRapido then
  begin
    Action := caFree;
    FrmCadastroSeguradora := nil;
  end;
end;

procedure TFrmCadastroSeguradora.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosSeguradora := TDtmDadosSeguradora.Create(nil);
  TipoOperacao := toInserir;
end;

procedure TFrmCadastroSeguradora.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosSeguradora);
end;

procedure TFrmCadastroSeguradora.limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroSeguradora.SetTipoOperacao(oTipoOperacao: TTipoOperacao);
begin
  TipoOperacao := oTipoOperacao;
end;

procedure TFrmCadastroSeguradora.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TFrmCadastroSeguradora.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtDescricao.Text) = '' then
    exibeMensagem('Informe a descrição!',tmAviso)
  else
    Result := True;
end;

end.
