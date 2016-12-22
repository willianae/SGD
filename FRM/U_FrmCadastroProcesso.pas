unit U_FrmCadastroProcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosProcesso, U_BibliotecaFuncoes, U_TProcesso;

type
  TFrmCadastroProcesso = class(TFrmCadastroPadrao)
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
  FrmCadastroProcesso: TFrmCadastroProcesso;

implementation

{$R *.dfm}

procedure TFrmCadastroProcesso.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text := FormatFloat('00', DtmDadosProcesso.cdsPesquisacodigo.AsInteger);
    edtDescricao.Text := DtmDadosProcesso.cdsPesquisadescricao.AsString;
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroProcesso.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroProcesso.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosProcesso.excluir(DtmDadosProcesso.cdsPesquisacodigo.AsInteger);
    DtmDadosProcesso.listar;
  end;
end;

procedure TFrmCadastroProcesso.btnSalvarClick(Sender: TObject);
var
  vProcesso: TProcesso;
begin
  inherited;
  if not validaCampos then
    Exit;

  vProcesso := TProcesso.Create;
  try
    if TipoOperacao = toAlterar then
      vProcesso.codigo := StrToInt(edtCodigo.Text);
    vProcesso.descricao := edtDescricao.Text;
    DtmDadosProcesso.salvar(vProcesso);
    DtmDadosProcesso.listar;

    limpar;
  finally
    FreeAndNil(vProcesso);
  end;

end;

procedure TFrmCadastroProcesso.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroProcesso.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosProcesso.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosProcesso.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;
  edtPesquisa.Clear;


  lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroProcesso.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroProcesso.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosProcesso.cdsPesquisa.Locate(DtmDadosProcesso.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosProcesso.cdsPesquisa.First;
end;

procedure TFrmCadastroProcesso.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if DtmDadosProcesso.cdsPesquisa.IndexFieldNames = 'CODIGO' then
    KeyPressCampoValor(Key);
end;

procedure TFrmCadastroProcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if TipoOperacao <> toCadastroRapido then
  begin
    Action := caFree;
    FrmCadastroProcesso := nil;
  end;
end;

procedure TFrmCadastroProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosProcesso := TDtmDadosProcesso.Create(nil);
  TipoOperacao := toInserir;
end;

procedure TFrmCadastroProcesso.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosProcesso);
end;

procedure TFrmCadastroProcesso.limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroProcesso.SetTipoOperacao(oTipoOperacao: TTipoOperacao);
begin
  TipoOperacao := oTipoOperacao;
end;

procedure TFrmCadastroProcesso.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TFrmCadastroProcesso.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtDescricao.Text) = '' then
    exibeMensagem('Informe a descrição!',tmAviso)
  else
    Result := True;
end;

end.
