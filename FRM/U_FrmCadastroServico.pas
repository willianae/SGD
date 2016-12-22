unit U_FrmCadastroServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosServico, U_BibliotecaFuncoes, U_TServico, U_TCodDesc,
  U_FrmCadastroTipo, U_FrmCadastroMarcaModelo, U_FrmCadastroCategoria, U_FrmCadastroCombustivel, U_FrmCadastroCor,
  U_FrmSelecaoPadrao, U_DtmDadosTipoServico, Datasnap.DBClient, U_DtmDadosVeiculo, U_TVeiculo,
  U_FrmCadastroSituacao, U_TSituacao, Vcl.Mask;

type
  TFrmCadastroServico = class(TFrmCadastroPadrao)
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edtCodTipoServico: TEdit;
    cmbSituacao: TComboBox;
    edtValorServico: TEdit;
    btnVeiculo: TSpeedButton;
    btnConsultaTipoServico: TSpeedButton;
    edtDesTipoServico: TEdit;
    btnPesquisar: TBitBtn;
    Label2: TLabel;
    cmbSituacaoConsulta: TComboBox;
    Label3: TLabel;
    edtCodTipoServicoConsulta: TEdit;
    btnConsultaTipoServico2: TSpeedButton;
    edtDesTipoServicoConsulta: TEdit;
    pnlServicos: TPanel;
    dbgrdServico: TDBGrid;
    cdsServico: TClientDataSet;
    dsServico: TDataSource;
    cdsServicoPLACA: TStringField;
    cdsServicoTIPO_SERVICO: TStringField;
    cdsServicoCOD_TIPO_SERVICO: TIntegerField;
    cdsServicoVALOR: TFloatField;
    cdsServicoSITUACAO: TStringField;
    cdsServicoCOD_VEICULO: TIntegerField;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    Label5: TLabel;
    edtCodigo: TEdit;
    edtProprietario: TEdit;
    Label7: TLabel;
    btnCadSituacao: TSpeedButton;
    cdsServicoCOD_SITUACAO: TIntegerField;
    cdsServicoCLIENTE: TStringField;
    Label8: TLabel;
    edtCliente: TEdit;
    medtPlacaPesquisa: TMaskEdit;
    edtPlaca: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbgrdConsultaTitleClick(Column: TColumn);
    procedure tbsCadastroShow(Sender: TObject);
    procedure dbgrdConsultaDblClick(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConsultaTipoServicoClick(Sender: TObject);
    procedure btnConsultaTipoServico2Click(Sender: TObject);
    procedure edtCodTipoServicoConsultaExit(Sender: TObject);
    procedure edtCodTipoServicoExit(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edtPlacaExit(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtCodTipoServicoChange(Sender: TObject);
    procedure edtValorServicoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCadSituacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdConsultaDrawColumnCell(Sender: TObject;
      const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    TipoOperacao: TTipoOperacao;
    FVeiculo: TVeiculo;
    procedure limpar;
    function validaCampos: boolean;
    procedure consultaTipoServico(var AEdtCod:TEdit; var AEdtDes:TEdit);
  public
    { Public declarations }
    function getQtdRegistros:integer; override;
  end;

var
  FrmCadastroServico: TFrmCadastroServico;

implementation

{$R *.dfm}

procedure TFrmCadastroServico.btnAddClick(Sender: TObject);
begin
  inherited;
  if validaCampos then
  begin
    cdsServico.Append;
    cdsServicoCOD_VEICULO.AsInteger := FVeiculo.codigo; //CodVeiculo;
    cdsServicoPLACA.AsString := edtPlaca.Text;
    cdsServicoTIPO_SERVICO.AsString := edtDesTipoServico.Text;
    cdsServicoCOD_TIPO_SERVICO.AsInteger := StrToInt(edtCodTipoServico.Text);
    cdsServicoVALOR.AsFloat := StrToFloat(edtValorServico.Text);
    cdsServicoCOD_SITUACAO.AsInteger := TSituacao(cmbSituacao.Items.Objects[cmbSituacao.ItemIndex]).codigo;
    cdsServicoSITUACAO.AsString := cmbSituacao.Text;
    cdsServico.Post;

    edtCodTipoServico.clear;
    edtDesTipoServico.clear;
    edtValorServico.text := '0,00';
    cmbSituacao.ItemIndex := 0;
    edtCodTipoServico.SetFocus;
  end;
end;

procedure TFrmCadastroServico.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    //CodVeiculo         := DtmDadosServico.cdsPesquisacod_veiculo.AsInteger;
    FVeiculo := DtmDadosVeiculo.getVeiculoPelaPlaca(DtmDadosServico.cdsPesquisaplaca.AsString);

    edtCodigo.Text     := DtmDadosServico.cdsPesquisacodigo.AsString;
    edtPlaca.Text      := DtmDadosServico.cdsPesquisaplaca.AsString;
    edtCodTipoServico.Text := FormatFloat('000',  DtmDadosServico.cdsPesquisacod_tipo_servico.AsInteger);
    edtDesTipoServico.Text := DtmDadosServico.cdsPesquisatipo_servico.Text;
    edtValorServico.Text := DtmDadosServico.cdsPesquisavalor.AsString;
    edtProprietario.Text := DtmDadosServico.cdsPesquisanome.AsString;

    selecionarCombo(DtmDadosServico.cdsPesquisacod_situacao.AsInteger, cmbSituacao);

    edtPlaca.Enabled := false;
    edtCodTipoServico.Enabled := False;
    btnConsultaTipoServico.Enabled := False;
    btnAdd.Visible := False;
    btnRemove.Visible := False;
    dbgrdServico.Visible := False;

    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroServico.btnCadSituacaoClick(Sender: TObject);
begin
  inherited;
  try
    FrmCadastroSituacao := TFrmCadastroSituacao.Create(nil);
    FrmCadastroSituacao.SetTipoOperacao(toCadastroRapido);
    FrmCadastroSituacao.FormStyle := fsNormal;
    FrmCadastroSituacao.Visible := False;
    FrmCadastroSituacao.ShowModal;
    carregaCombo('SITUACAO',cmbSituacao);
    carregaCombo('SITUACAO',cmbSituacaoConsulta);
  finally
    FreeAndNil(FrmCadastroSituacao);
  end;
end;

procedure TFrmCadastroServico.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroServico.btnConsultaTipoServico2Click(Sender: TObject);
begin
  inherited;
  consultaTipoServico(edtCodTipoServicoConsulta, edtDesTipoServicoConsulta);
end;

procedure TFrmCadastroServico.btnConsultaTipoServicoClick(Sender: TObject);
begin
  inherited;
  consultaTipoServico(edtCodTipoServico, edtDesTipoServico);
end;

procedure TFrmCadastroServico.btnExcluirClick(Sender: TObject);
begin
  inherited;
  {if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosServico.excluir(DtmDadosServico.cdsPesquisacodigo.AsInteger);
    DtmDadosServico.listar;
    limpar;
  end;
  }
end;

procedure TFrmCadastroServico.btnPesquisarClick(Sender: TObject);
var
  strSituacao:string;
  intTipoServico:integer;
begin
  inherited;
  try
    Screen.Cursor := crSQLWait;
    if cmbSituacaoConsulta.ItemIndex <=0 then
      strSituacao := ''
    else
      strSituacao := cmbSituacaoConsulta.Text;

    if Trim(edtCodTipoServicoConsulta.Text) = '' then
      intTipoServico := -1
    else
      intTipoServico := StrToInt(edtCodTipoServicoConsulta.Text);


    DtmDadosServico.listar(medtPlacaPesquisa.Text, strSituacao,intTipoServico, edtCliente.Text);
    stbResumo.Panels[0].Text := FormatFloat('###,000', getQtdRegistros ) + ' registro(s) encontrado(s).';
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TFrmCadastroServico.btnRemoveClick(Sender: TObject);
begin
  inherited;
  if not cdsServico.IsEmpty then
    cdsServico.Delete;
end;

procedure TFrmCadastroServico.btnSalvarClick(Sender: TObject);
var
  vServico: TServico;
begin
  inherited;
  if (TipoOperacao = toAlterar) and (not validaCampos) then
    Exit
  else
  if (TipoOperacao = toInserir) and (cdsServico.RecordCount = 0) then
    exibeMensagem('Adicione os serviços na grade para poder salvá-los!',tmAviso,nil,True);


  vServico := TServico.Create;
  try
    if TipoOperacao = toAlterar then
    begin
      vServico.codigo := StrToInt(edtCodigo.Text);
      vServico.valor := StrToFloat(edtValorServico.Text);
      vServico.situacao.codigo := TSituacao(cmbSituacao.Items.Objects[cmbSituacao.ItemIndex]).codigo;
      vServico.situacao.descricao := TSituacao(cmbSituacao.Items.Objects[cmbSituacao.ItemIndex]).descricao;
      vServico.veiculo := DtmDadosVeiculo.getVeiculoPelaPlaca(edtPlaca.Text);
      vServico.tipo_servico.codigo := StrToInt(edtCodTipoServico.Text);

      DtmDadosServico.salvar(vServico);
      //DtmDadosServico.listar;
      btnPesquisarClick(Sender);
    end
    else
    while not cdsServico.Eof  do
    begin
      vServico.veiculo := DtmDadosVeiculo.getVeiculoPelaPlaca(cdsServicoPLACA.AsString);
      vServico.tipo_servico.codigo := cdsServicoCOD_TIPO_SERVICO.AsInteger;
      vServico.tipo_servico.descricao := cdsServicoTIPO_SERVICO.AsString;
      vServico.valor := cdsServicoVALOR.AsFloat; ;
      vServico.situacao.codigo := cdsServicoCOD_SITUACAO.AsInteger;
      vServico.situacao.descricao := cdsServicoSITUACAO.AsString;
      //vServico.usuario.codigo := ;

      DtmDadosServico.salvar(vServico);
      cdsServico.Next;
    end;
    //DtmDadosServico.listar;

    limpar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  finally
    FreeAndNil(vServico);
  end;

end;

procedure TFrmCadastroServico.consultaTipoServico(var AEdtCod:TEdit; var AEdtDes:TEdit);
begin
  try
    AEdtDes.Clear;

    FrmSelecaoPadrao := TFrmSelecaoPadrao.Create(nil);
    DtmDadosTipoServico.listar;
    FrmSelecaoPadrao.dbgrdConsulta.DataSource := DtmDadosTipoServico.dsPesquisa;
    FrmSelecaoPadrao.ShowModal;
    if FrmSelecaoPadrao.ModalResult = mrOk then
    begin
      AEdtCod.Text := FormatFloat('000', DtmDadosTipoServico.cdsPesquisacodigo.AsInteger);
      AEdtDes.Text := DtmDadosTipoServico.cdsPesquisadescricao.AsString;
      if edtValorServico.CanFocus then      
      edtValorServico.SetFocus;
    end;
  finally
    FreeAndNil(FrmSelecaoPadrao);
  end;
end;

procedure TFrmCadastroServico.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

procedure TFrmCadastroServico.dbgrdConsultaDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not DtmDadosServico.cdsPesquisa.IsEmpty then
  begin
   dbgrdConsulta.Canvas.Brush.Color := StringToColor(DtmDadosServico.cdsPesquisacolor.AsString);
   dbgrdConsulta.DefaultDrawDataCell(Rect, dbgrdConsulta.columns[datacol].field, State);
  end;
end;

procedure TFrmCadastroServico.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  DtmDadosServico.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosServico.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;


  //lblPesquisa.Caption := Column.Title.Caption;
end;

procedure TFrmCadastroServico.edtCodTipoServicoChange(Sender: TObject);
begin
  inherited;
  //if Length(Trim(edtCodTipoServico.Text)) = 3 then
  //  edtValorServico.SetFocus;

end;

procedure TFrmCadastroServico.edtCodTipoServicoConsultaExit(Sender: TObject);
begin
  inherited;
  if Trim(edtCodTipoServicoConsulta.Text) = '' then
    edtDesTipoServicoConsulta.Clear
  else
  begin
    edtDesTipoServicoConsulta.Text := DtmDadosTipoServico.getDescricao(StrToInt(edtCodTipoServicoConsulta.Text));
    if Trim(edtDesTipoServicoConsulta.Text) = '' then
      exibeMensagem('Tipo de serviço não encontrado!',tmAviso, edtCodTipoServicoConsulta);
  end;
end;

procedure TFrmCadastroServico.edtCodTipoServicoExit(Sender: TObject);
begin
  inherited;
  if Trim(edtCodTipoServico.Text) = '' then
    edtDesTipoServico.Clear
  else
  begin
    edtDesTipoServico.Text := DtmDadosTipoServico.getDescricao(StrToInt(edtCodTipoServico.Text));
    if Trim(edtDesTipoServico.Text) = '' then
      exibeMensagem('Tipo de serviço não encontrado!',tmAviso, edtCodTipoServico)
    else
      edtCodTipoServico.Text := FormatFloat('000', StrToInt(edtCodTipoServico.text));
  end;
end;

procedure TFrmCadastroServico.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroServico.edtPlacaExit(Sender: TObject);
//var vVeiculo: TVeiculo;
begin
  inherited;
  if Trim(StringReplace(edtPlaca.Text,'-','',[rfReplaceAll]))<> '' then
  begin
    FVeiculo := DtmDadosVeiculo.getVeiculoPelaPlaca(edtPlaca.Text);
    if not Assigned(FVeiculo) then
    begin
      edtProprietario.Clear;
      exibeMensagem('Veículo não encontrado!',tmAviso,edtPlaca,True)
    end
    else
    begin
       //CodVeiculo := vVeiculo.codigo;
       edtProprietario.Text := FVeiculo.cliente.nome;
    end;
  end;
end;

procedure TFrmCadastroServico.edtValorServicoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    btnAddClick(Sender);
end;

procedure TFrmCadastroServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmCadastroServico := nil;
end;

procedure TFrmCadastroServico.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosServico := TDtmDadosServico.Create(nil);
  DtmDadosTipoServico := TDtmDadosTipoServico.Create(nil);
  DtmDadosVeiculo := TDtmDadosVeiculo.Create(nil);


  carregaCombo('SITUACAO',cmbSituacao);
  carregaCombo('SITUACAO',cmbSituacaoConsulta);
  //CodVeiculo := -1;
  FVeiculo := nil;

  cdsServico.Close;
  cdsServico.CreateDataSet;

  TipoOperacao := toInserir;
end;

procedure TFrmCadastroServico.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosServico);
  FreeAndNil(DtmDadosTipoServico);
  FreeAndNil(DtmDadosVeiculo);
end;

procedure TFrmCadastroServico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F8 then
  begin
    btnPesquisarClick(Sender);
  end;
end;

function TFrmCadastroServico.getQtdRegistros: integer;
begin
  Result := DtmDadosServico.getQtdRegistros;
end;

procedure TFrmCadastroServico.limpar;
begin
  //CodVeiculo := -1;
  FVeiculo := nil;
  edtCodigo.Clear;
  edtPlaca.Clear;
  edtCodTipoServico.Clear;
  edtDesTipoServico.Clear;
  edtValorServico.Text := '0,00';
  cmbSituacao.ItemIndex := 0;
  edtProprietario.Clear;
  edtPlaca.Enabled := True;
  edtCodTipoServico.Enabled := True;
  btnConsultaTipoServico.Enabled := True;
  btnAdd.Visible := True;
  btnRemove.Visible := True;
  dbgrdServico.Visible := True;


  cdsServico.Close;
  cdsServico.CreateDataSet;

  TipoOperacao := toInserir;
  pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroServico.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  if edtPlaca.CanFocus then
    edtPlaca.SetFocus;
end;

function TFrmCadastroServico.validaCampos: boolean;
var
  dAux:Double;
begin
  Result := False;
  if Trim(edtPlaca.Text) = '' then
    exibeMensagem('Informe a PLACA!',tmAviso)
  else
  if Trim(edtCodTipoServico.Text)='' then
    exibeMensagem('Informe o TIPO DE SERVIÇO!',tmAviso)
  else
  if not TryStrToFloat(edtValorServico.Text,dAux) then
    exibeMensagem('Informe corretamente o VALOR!',tmAviso)
  else
  if cmbSituacao.ItemIndex <=0 then
    exibeMensagem('Informe a SITUAÇÂO!',tmAviso)
  else
    Result := True;
end;

end.
