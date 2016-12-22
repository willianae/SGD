unit U_FrmCadastroTipoServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosTipoServico, U_BibliotecaFuncoes, U_TTipoServico;

type
  TFrmCadastroTipoServico = class(TFrmCadastroPadrao)
    Label2: TLabel;
    edtCodigo: TEdit;
    Label3: TLabel;
    edtDescricao: TEdit;
    Label1: TLabel;
    edtTaxa: TEdit;
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
    procedure edtTaxaKeyPress(Sender: TObject; var Key: Char);
    procedure edtTaxaExit(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TipoOperacao: TTipoOperacao;
    procedure limpar;
    function validaCampos: boolean;
  public
    { Public declarations }
  end;

var
  FrmCadastroTipoServico: TFrmCadastroTipoServico;

implementation

{$R *.dfm}

procedure TFrmCadastroTipoServico.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text := FormatFloat('00', DtmDadosTipoServico.cdsPesquisacodigo.AsInteger);
    edtDescricao.Text := DtmDadosTipoServico.cdsPesquisadescricao.AsString;
    edtTaxa.Text := FormatFloat('###,###,##0.00', DtmDadosTipoServico.cdsPesquisataxa_detran.AsFloat);
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroTipoServico.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroTipoServico.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosTipoServico.excluir(DtmDadosTipoServico.cdsPesquisacodigo.AsInteger);
    DtmDadosTipoServico.listar;
  end;
end;

procedure TFrmCadastroTipoServico.btnSalvarClick(Sender: TObject);
var
  vTipoServico: TTipoServico;
begin
  inherited;
  if not validaCampos then
    Exit;

  vTipoServico := TTipoServico.Create;
  try
    if TipoOperacao = toAlterar then
      vTipoServico.codigo := StrToInt(edtCodigo.Text);
    vTipoServico.descricao := edtDescricao.Text;
    vTipoServico.taxa_detran := StrToFloat(edtTaxa.Text);

    DtmDadosTipoServico.salvar(vTipoServico);
    DtmDadosTipoServico.listar;

    limpar;
  finally
    FreeAndNil(vTipoServico);
  end;

end;

procedure TFrmCadastroTipoServico.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroTipoServico.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosTipoServico.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosTipoServico.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;
  edtPesquisa.Clear;

  lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroTipoServico.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroTipoServico.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosTipoServico.cdsPesquisa.Locate(DtmDadosTipoServico.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosTipoServico.cdsPesquisa.First;
end;

procedure TFrmCadastroTipoServico.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if DtmDadosTipoServico.cdsPesquisa.IndexFieldNames = 'CODIGO' then
    KeyPressCampoValor(Key);

end;

procedure TFrmCadastroTipoServico.edtTaxaExit(Sender: TObject);
var
  dAux:Double;
begin
  inherited;
  if Trim(edtTaxa.Text) = '' then
    edtTaxa.Text := '0,00'
  else
  if not TryStrToFloat(edtTaxa.Text, dAux) then
  begin
    exibeMensagem('Valor inválido!', tmAviso, edtTaxa);
  end;

end;

procedure TFrmCadastroTipoServico.edtTaxaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0)
  else
    KeyPressCampoValor(Key);
end;

procedure TFrmCadastroTipoServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmCadastroTipoServico := nil;
end;

procedure TFrmCadastroTipoServico.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosTipoServico := TDtmDadosTipoServico.Create(nil);
  TipoOperacao := toInserir;
end;

procedure TFrmCadastroTipoServico.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosTipoServico);
end;

procedure TFrmCadastroTipoServico.limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtTaxa.Text := '0,00';
  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroTipoServico.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TFrmCadastroTipoServico.validaCampos: boolean;
var
  dAux: Double;
begin
  Result := False;
  if Trim(edtDescricao.Text) = '' then
    exibeMensagem('Informe a descrição!',tmAviso)
  else
  if not TryStrToFloat(edtTaxa.Text, dAux) then
    exibeMensagem('Valor inválido!', tmAviso, edtTaxa)
  else
    Result := True;
end;

end.
