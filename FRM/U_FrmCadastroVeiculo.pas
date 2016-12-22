unit U_FrmCadastroVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  U_DtmDadosVeiculo, U_BibliotecaFuncoes, U_TVeiculo, U_TCodDesc,U_TCliente,
  U_FrmCadastroTipo, U_FrmCadastroMarcaModelo, U_FrmCadastroCategoria, U_FrmCadastroCombustivel, U_FrmCadastroCor,
  U_FrmCadastroProcesso, Vcl.Mask, System.StrUtils, U_FrmSelecaoPadrao, U_DtmDadosMarcaModelo,
  U_TComprador;

type
  TFrmCadastroVeiculo = class(TFrmCadastroPadrao)
    Label2: TLabel;
    edtCodigo: TEdit;
    Label3: TLabel;
    memoObs: TMemo;
    btnPesquisar: TBitBtn;
    btnNegativaFurto: TBitBtn;
    Label21: TLabel;
    edtCliente: TEdit;
    medtPlacaPesquisa: TMaskEdit;
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    edtCpfCnpjComprador: TEdit;
    btnConsultarComprador: TSpeedButton;
    edtNomeComprador: TEdit;
    Label15: TLabel;
    GrpBxCliente: TGroupBox;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    edtCpfCnpj: TEdit;
    btnConsultaCliente: TSpeedButton;
    Label13: TLabel;
    edtNome: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    btnCadMarcaModelo: TSpeedButton;
    btnCadCategoria: TSpeedButton;
    btnCadCor: TSpeedButton;
    btnCadTipo: TSpeedButton;
    Label7: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    btnConsultaMarcaModelo: TSpeedButton;
    edtNumero: TEdit;
    cmbUF: TComboBox;
    edtRenavam: TEdit;
    edtChassi: TEdit;
    edtAnoFab: TEdit;
    edtAnoMod: TEdit;
    edtMotor: TEdit;
    cmbTipo: TComboBox;
    cmbCategoria: TComboBox;
    cmbCombustivel: TComboBox;
    cmbCor: TComboBox;
    medtPlaca: TMaskEdit;
    medtDataEmissao: TMaskEdit;
    medtDataRecebimento: TMaskEdit;
    edtCodMarcaModelo: TEdit;
    edtDesMarcaModelo: TEdit;
    btnCadCombustivel: TSpeedButton;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    cmbProcesso: TComboBox;
    btnCadProcesso: TSpeedButton;
    GrpBxConvocacao: TGroupBox;
    Label24: TLabel;
    edtNumConvocacao: TEdit;
    Label25: TLabel;
    mEdtDataConvocacao: TMaskEdit;
    Label26: TLabel;
    edtCodSeguradora: TEdit;
    btnConsultaSeguradora: TSpeedButton;
    edtNomeSeguradora: TEdit;
    btnCadSeguradora: TSpeedButton;
    grpSinistro: TGroupBox;
    Label19: TLabel;
    edtNumeroSinistro: TEdit;
    chkPossuiSinistro: TCheckBox;
    chkRecebeuCsv: TCheckBox;
    btnCadComprador: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbgrdConsultaTitleClick(Column: TColumn);
    procedure tbsCadastroShow(Sender: TObject);
    procedure dbgrdConsultaDblClick(Sender: TObject);
    procedure btnCadTipoClick(Sender: TObject);
    procedure btnCadMarcaModeloClick(Sender: TObject);
    procedure btnCadCategoriaClick(Sender: TObject);
    procedure btnCadCombustivelClick(Sender: TObject);
    procedure btnCadCorClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnCadProcessoClick(Sender: TObject);
    procedure btnNegativaFurtoClick(Sender: TObject);
    procedure btnConsultaClienteClick(Sender: TObject);
    procedure edtCpfCnpjExit(Sender: TObject);
    procedure edtCodMarcaModeloExit(Sender: TObject);
    procedure btnConsultaMarcaModeloClick(Sender: TObject);
    procedure medtPlacaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodMarcaModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConsultarCompradorClick(Sender: TObject);
    procedure btnCadCompradorClick(Sender: TObject);
    procedure edtCodSeguradoraExit(Sender: TObject);
    procedure edtCodSeguradoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCadSeguradoraClick(Sender: TObject);
    procedure edtCpfCnpjCompradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrlPrincipalEnter(Sender: TObject);
    procedure edtCpfCnpjCompradorExit(Sender: TObject);
    procedure btnConsultaSeguradoraClick(Sender: TObject);
    procedure edtCpfCnpjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
    TipoOperacao: TTipoOperacao;
    FiCodProcessoAtual: Integer;
    Cliente :TCliente;
    Comprador:TComprador;
    FiCodVeiculo: Integer;
    NomeCompradorAntigo:string;
    procedure SetiCodProcessoAtual(const Value: Integer);
    procedure SetiCodVeiculo(const Value: Integer);
    property iCodVeiculo:Integer read FiCodVeiculo write SetiCodVeiculo;
    procedure limpar;
    function validaCampos: boolean;
    procedure AbrirTelaHistorico(PPlaca:String);
  public
    { Public declarations }
    function getQtdRegistros: integer; override;
  end;

var
  FrmCadastroVeiculo: TFrmCadastroVeiculo;

implementation

{$R *.dfm}

uses U_FrmRelNegativaDeFurto, U_FrmCadastroCliente, U_FrmHistoricoProcesso,
  U_FrmCadastroSeguradora, U_DtmDadosSeguradora, U_DtmDadosCliente;

procedure TFrmCadastroVeiculo.AbrirTelaHistorico(PPlaca: String);
begin
  if (Trim( PPlaca) <> '' ) then
  begin
    if FrmHistoricoProcesso = nil then
    begin
      FrmHistoricoProcesso := TFrmHistoricoProcesso.Create(application);
      try
        FrmHistoricoProcesso.FormStyle := fsNormal;
        FrmHistoricoProcesso.Visible := False;
        FrmHistoricoProcesso.Placa := PPlaca;
        FrmHistoricoProcesso.ShowModal;
      finally
        FreeAndNil(FrmHistoricoProcesso);
      end;
    end
    else
    begin
      FrmHistoricoProcesso.Placa := PPlaca;
      FrmHistoricoProcesso.Show;
    end;
  end;
end;

procedure TFrmCadastroVeiculo.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text     := FormatFloat('00', DtmDadosVeiculo.cdsPesquisacodigo.AsInteger);
    edtCpfCnpj.Text    := DtmDadosVeiculo.cdsPesquisacpf_cnpj.AsString;
    edtNome.Text       := DtmDadosVeiculo.cdsPesquisanome.Text;
    if Length(DtmDadosVeiculo.cdsPesquisaplaca.Text) = 7 then
      medtPlaca.Text   := Copy(DtmDadosVeiculo.cdsPesquisaplaca.Text,1,3) + '-' +
                          Copy(DtmDadosVeiculo.cdsPesquisaplaca.Text,4,4)
    else
      medtPlaca.Text   := DtmDadosVeiculo.cdsPesquisaplaca.Text;
    cmbUF.ItemIndex    := cmbUF.Items.IndexOf(DtmDadosVeiculo.cdsPesquisauf.Text);
    edtNumero.Text     := DtmDadosVeiculo.cdsPesquisanumero.Text;
    edtRenavam.Text    := DtmDadosVeiculo.cdsPesquisarenavam.AsString;
    edtChassi.Text     := DtmDadosVeiculo.cdsPesquisachassi.AsString;
    edtAnoFab.Text     := DtmDadosVeiculo.cdsPesquisaano_fabricacao.AsString;
    edtAnoMod.Text     := DtmDadosVeiculo.cdsPesquisaano_modelo.AsString;
    edtMotor.Text      := DtmDadosVeiculo.cdsPesquisamotor.AsString;

    edtNumeroSinistro.Text := DtmDadosVeiculo.cdsPesquisanumero_sinistro.AsString;

    selecionarCombo(DtmDadosVeiculo.cdsPesquisacod_tipo.AsInteger, cmbTipo);
    //selecionarCombo(DtmDadosVeiculo.cdsPesquisacod_marca_modelo.AsInteger, cmbMarcaModelo);
    edtCodMarcaModelo.Text := DtmDadosVeiculo.cdsPesquisacod_marca_modelo.AsString;
    edtCodMarcaModeloExit(Sender);
    selecionarCombo(DtmDadosVeiculo.cdsPesquisacod_categoria.AsInteger, cmbCategoria);
    selecionarCombo(DtmDadosVeiculo.cdsPesquisacod_combustivel.AsInteger, cmbCombustivel);
    selecionarCombo(DtmDadosVeiculo.cdsPesquisacod_cor.AsInteger, cmbCor);
    selecionarCombo(DtmDadosVeiculo.cdsPesquisacod_processo.AsInteger, cmbProcesso);

    SetiCodProcessoAtual(DtmDadosVeiculo.cdsPesquisacod_processo.AsInteger);
    SetiCodVeiculo(DtmDadosVeiculo.cdsPesquisacodigo.AsInteger);

    memoObs.Lines.Text := DtmDadosVeiculo.cdsPesquisaobservacoes.AsString;
    btnNegativaFurto.Enabled := True;

    medtDataEmissao.Text := DtmDadosVeiculo.cdsPesquisadata_emissao_crv.AsString;
    medtDataRecebimento.Text :=  DtmDadosVeiculo.cdsPesquisadata_recebimento.AsString;
    chkPossuiSinistro.Checked := (DtmDadosVeiculo.cdsPesquisaflg_possui_sinistro.AsString = 'S');
    chkRecebeuCsv.Checked := (DtmDadosVeiculo.cdsPesquisaflg_recebeu_csv.AsString = 'S');
    // caso ja tenha comprador atrelado considerar o comprador senao atribui o nome do comprador antigo
    if DtmDadosVeiculo.cdsPesquisacod_comprador.AsInteger > 0 then
    begin
      edtCpfCnpjComprador.Text := DtmDadosVeiculo.cdsPesquisaDOC_COMPRADOR.AsString;
      edtNomeComprador.Text    := DtmDadosVeiculo.cdsPesquisacomprador.AsString;
      if not ( Assigned(Comprador)) then
        Comprador := TComprador.Create;
      Comprador.id := DtmDadosVeiculo.cdsPesquisacod_comprador.AsInteger;
      Comprador.nome := DtmDadosVeiculo.cdsPesquisacomprador.AsString;
    end
    else
    begin
      // nome antigo caso ainda nao atribuido o novo
      NomeCompradorAntigo    := DtmDadosVeiculo.cdsPesquisa.FieldByName('NOME_COMPRADOR').AsString;
      edtNomeComprador.Text := DtmDadosVeiculo.cdsPesquisanome_comprador.AsString;
    end;
    edtNumConvocacao.Text    := DtmDadosVeiculo.cdsPesquisa.FieldByName('NUMERO_CONVOCACAO').AsString;
    mEdtDataConvocacao.Text  := DtmDadosVeiculo.cdsPesquisa.FieldByName('DATA_CONVOCACAO').AsString;
    edtCodSeguradora.Text    := DtmDadosVeiculo.cdsPesquisa.FieldByName('COD_SEGURADORA').AsString;
    edtNomeSeguradora.Text   := DtmDadosVeiculo.cdsPesquisa.FieldByName('SEGURADORA').AsString;
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroVeiculo.btnCadCategoriaClick(Sender: TObject);
begin
  inherited;
  try
    FrmCadastroCategoria := TFrmCadastroCategoria.Create(nil);
    FrmCadastroCategoria.SetTipoOperacao(toCadastroRapido);
    FrmCadastroCategoria.FormStyle := fsNormal;
    FrmCadastroCategoria.Visible := False;
    FrmCadastroCategoria.ShowModal;
    carregaCombo('CATEGORIA',cmbCategoria);
  finally
    FreeAndNil(FrmCadastroCategoria);
  end;
end;

procedure TFrmCadastroVeiculo.btnCadCombustivelClick(Sender: TObject);
begin
  inherited;
  try
    FrmCadastroCombustivel := TFrmCadastroCombustivel.Create(nil);
    FrmCadastroCombustivel.SetTipoOperacao(toCadastroRapido);
    FrmCadastroCombustivel.FormStyle := fsNormal;
    FrmCadastroCombustivel.Visible := False;
    FrmCadastroCombustivel.ShowModal;
    carregaCombo('COMBUSTIVEL',cmbCombustivel);
  finally
    FreeAndNil(FrmCadastroCombustivel);
  end;
end;

procedure TFrmCadastroVeiculo.btnCadCompradorClick(Sender: TObject);
begin
  inherited;
    FrmCadastroCliente := TFrmCadastroCliente.Create(2);
  try
    FrmCadastroCliente.SetTipoOperacao(toCadastroRapido);
    FrmCadastroCliente.FormStyle := fsNormal;
    FrmCadastroCliente.Visible := False;
    FrmCadastroCliente.ShowModal;
  finally
    FreeAndNil(FrmCadastroCliente);
  end;
end;

procedure TFrmCadastroVeiculo.btnCadCorClick(Sender: TObject);
begin
  inherited;
  try
    FrmCadastroCor := TFrmCadastroCor.Create(nil);
    FrmCadastroCor.SetTipoOperacao(toCadastroRapido);
    FrmCadastroCor.FormStyle := fsNormal;
    FrmCadastroCor.Visible := False;
    FrmCadastroCor.ShowModal;
    carregaCombo('COR',cmbCor);
  finally
    FreeAndNil(FrmCadastroCor);
  end;
end;

procedure TFrmCadastroVeiculo.btnCadMarcaModeloClick(Sender: TObject);
begin
  inherited;
  try
    FrmCadastroMarcaModelo := TFrmCadastroMarcaModelo.Create(nil);
    FrmCadastroMarcaModelo.SetTipoOperacao(toCadastroRapido);
    FrmCadastroMarcaModelo.FormStyle := fsNormal;
    FrmCadastroMarcaModelo.Visible := False;
    FrmCadastroMarcaModelo.ShowModal;
  finally
    FreeAndNil(FrmCadastroMarcaModelo);
  end;
end;

procedure TFrmCadastroVeiculo.btnCadProcessoClick(Sender: TObject);
begin
  inherited;
  try
    FrmCadastroProcesso := TFrmCadastroProcesso.Create(nil);
    FrmCadastroProcesso.SetTipoOperacao(toCadastroRapido);
    FrmCadastroProcesso.FormStyle := fsNormal;
    FrmCadastroProcesso.Visible := False;
    FrmCadastroProcesso.ShowModal;
    carregaCombo('PROCESSO',cmbProcesso);
  finally
    FreeAndNil(FrmCadastroProcesso);
  end;
end;

procedure TFrmCadastroVeiculo.btnCadTipoClick(Sender: TObject);
begin
  inherited;
  try
    FrmCadastroTipo := TFrmCadastroTipo.Create(nil);
    FrmCadastroTipo.SetTipoOperacao(toCadastroRapido);
    FrmCadastroTipo.FormStyle := fsNormal;
    FrmCadastroTipo.Visible := False;
    FrmCadastroTipo.ShowModal;
    carregaCombo('TIPO',cmbTipo);
  finally
    FreeAndNil(FrmCadastroTipo);
  end;
end;

procedure TFrmCadastroVeiculo.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar;
end;

procedure TFrmCadastroVeiculo.btnConsultaClienteClick(Sender: TObject);
begin
  inherited;
   try
      FrmCadastroCliente := TFrmCadastroCliente.Create(nil);
      FrmCadastroCliente.tbsCadastro.TabVisible := False;
      FrmCadastroCliente.pnlBotoesAcoes.Visible := False;
      FrmCadastroCliente.SetTipoOperacao(toConsultar);
      FrmCadastroCliente.FormStyle:= fsNormal;
      FrmCadastroCliente.Visible := False;
      FrmCadastroCliente.ShowModal;
      if ( FrmCadastroCliente.ModalResult = mrOk) then
      begin
        edtCpfCnpj.Text := FrmCadastroCliente.dbgrdConsulta.DataSource.DataSet.FieldByName('CPF_CNPJ').AsString;
        edtCpfCnpjExit(sender);
      end;
   finally
      //FrmCadastroCliente.FormStyle:= fsMDIChild;
      FreeAndNil(FrmCadastroCliente);
   end;
end;

procedure TFrmCadastroVeiculo.btnConsultaMarcaModeloClick(Sender: TObject);
begin
  inherited;
  try
    DtmDadosMarcaModelo := TDtmDadosMarcaModelo.Create(nil);
    FrmSelecaoPadrao := TFrmSelecaoPadrao.Create(nil);
    DtmDadosMarcaModelo.listar;
    FrmSelecaoPadrao.dbgrdConsulta.DataSource := DtmDadosMarcaModelo.dsPesquisa;
    FrmSelecaoPadrao.ShowModal;
    if FrmSelecaoPadrao.ModalResult = mrOk then
    begin
      edtCodMarcaModelo.Text := FormatFloat('000', DtmDadosMarcaModelo.cdsPesquisacodigo.AsInteger);
      edtDesMarcaModelo.Text := DtmDadosMarcaModelo.cdsPesquisadescricao.AsString;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  finally
    FreeAndNil(FrmSelecaoPadrao);
    FreeAndNil(DtmDadosMarcaModelo);
  end;
end;

procedure TFrmCadastroVeiculo.btnConsultarCompradorClick(Sender: TObject);
begin
  try
    DtmDadosCliente  := TDtmDadosCliente.Create(nil);
    FrmSelecaoPadrao := TFrmSelecaoPadrao.Create(nil);
    DtmDadosCliente.listarCompradores;

    if DtmDadosCliente.cdsPesquisa.IsEmpty then
      exibeMensagem('Não existem compradores cadastrados!',tmAviso, nil,true);


    FrmSelecaoPadrao.dbgrdConsulta.DataSource := DtmDadosCliente.dsPesquisa;
    FrmSelecaoPadrao.ShowModal;
    if FrmSelecaoPadrao.ModalResult = mrOk then
    begin
      Comprador.id := DtmDadosCliente.cdsPesquisa.FieldByName('CODIGO').AsInteger;
      edtCpfCnpjComprador.Text := DtmDadosCliente.cdsPesquisa.FieldByName('CPF_CNPJ').AsString;
      edtNomeComprador.Text    := DtmDadosCliente.cdsPesquisa.FieldByName('NOME').AsString;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  finally
    FreeAndNil(FrmSelecaoPadrao);
    FreeAndNil(DtmDadosCliente);
  end;
end;

procedure TFrmCadastroVeiculo.btnConsultaSeguradoraClick(Sender: TObject);
begin
  try
    DtmDadosSeguradora := TDtmDadosSeguradora.Create(nil);
    FrmSelecaoPadrao := TFrmSelecaoPadrao.Create(nil);
    DtmDadosSeguradora.listar;
    FrmSelecaoPadrao.dbgrdConsulta.DataSource := DtmDadosSeguradora.dsPesquisa;
    FrmSelecaoPadrao.ShowModal;
    if FrmSelecaoPadrao.ModalResult = mrOk then
    begin
      edtCodSeguradora.Text := FormatFloat('000', DtmDadosSeguradora.cdsPesquisacodigo.AsInteger);
      edtNomeSeguradora.Text := DtmDadosSeguradora.cdsPesquisadescricao.AsString;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  finally
    FreeAndNil(FrmSelecaoPadrao);
    FreeAndNil(DtmDadosSeguradora);
  end;
end;

procedure TFrmCadastroVeiculo.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro e todos os serviços vinculados?',tmPergunta) = mrYes) then
  begin
    DtmDadosVeiculo.excluir(DtmDadosVeiculo.cdsPesquisacodigo.AsInteger);
    DtmDadosVeiculo.listar;
    limpar;
  end;
end;

procedure TFrmCadastroVeiculo.btnNegativaFurtoClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  try
   FrmRelNegativaDeFurto := TFrmRelNegativaDeFurto.Create(nil);
   if (FrmRelNegativaDeFurto.carregaRelatorio(DtmDadosVeiculo.cdsPesquisaplaca.AsString)) then
      FrmRelNegativaDeFurto.RLReport1.PreviewModal;
  finally
   FreeAndNil(FrmRelNegativaDeFurto);
  end;
end;

procedure TFrmCadastroVeiculo.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crSQLWait;
    limpar;
    DtmDadosVeiculo.listar(medtPlacaPesquisa.Text, edtCliente.Text);
    stbResumo.Panels[0].Text := FormatFloat('###,000', getQtdRegistros ) + ' registro(s) encontrado(s).';
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadastroVeiculo.btnSalvarClick(Sender: TObject);
var
  vVeiculo: TVeiculo;
  intAux:integer;
  dataAux:TDateTime;
  operacaoAnterior: TTipoOperacao;
begin
  inherited;
  if not validaCampos then
    Exit;

  vVeiculo := TVeiculo.Create;
  operacaoAnterior := TipoOperacao;
  try
    if TipoOperacao = toAlterar then
      vVeiculo.codigo := StrToInt(edtCodigo.Text);
   // vVeiculo.descricao := edtDescricao.Text;

    vVeiculo.uf := cmbUF.Text;
    vVeiculo.numero := edtNumero.Text;
    vVeiculo.renavam := edtRenavam.Text;
    vVeiculo.placa := medtPlaca.Text;
    vVeiculo.chassi := edtChassi.Text;
    if TryStrToInt(edtAnoFab.Text, intAux) then
      vVeiculo.ano_fabricacao := intAux;
    if TryStrToInt(edtAnoMod.Text, intAux) then
      vVeiculo.ano_modelo := StrToInt(edtAnoMod.Text);
    vVeiculo.motor := edtMotor.Text;
    vVeiculo.observacoes := memoObs.Text;
    vVeiculo.numeroSinistro := edtNumeroSinistro.Text;
    vVeiculo.Cliente.id := Cliente.id;
    vVeiculo.tipo.codigo         := TCodDesc(cmbTipo.Items.Objects[cmbTipo.ItemIndex]).codigo;
    //vVeiculo.marca_modelo.codigo := TCodDesc(cmbMarcaModelo.Items.Objects[cmbMarcaModelo.ItemIndex]).codigo;
    if TryStrToInt(edtCodMarcaModelo.Text, intAux) then
    vVeiculo.marca_modelo.codigo :=intAux;

    vVeiculo.combustivel.codigo  := TCodDesc(cmbCombustivel.Items.Objects[cmbCombustivel.ItemIndex]).codigo;
    vVeiculo.categoria.codigo    := TCodDesc(cmbCategoria.Items.Objects[cmbCategoria.ItemIndex]).codigo;
    vVeiculo.cor.codigo          := TCodDesc(cmbCor.Items.Objects[cmbCor.ItemIndex]).codigo;
    vVeiculo.processo.codigo     := TCodDesc(cmbProcesso.Items.Objects[cmbProcesso.ItemIndex]).codigo;

    if TryStrToDate(medtDataEmissao.Text, dataAux) then
      vVeiculo.data_emissao     := dataAux;
    if TryStrToDate(medtDataRecebimento.Text, dataAux) then
      vVeiculo.data_recebimento := dataAux;
    vVeiculo.possui_sinistro  := Ifthen(chkPossuiSinistro.Checked, 'S','N');
    vVeiculo.recebeu_csv      := Ifthen(chkRecebeuCsv.Checked, 'S','N');
    vVeiculo.nome_comprador   := edtNomeComprador.Text;

    vVeiculo.Comprador := Comprador;

    {if Comprador.id > 0 then
      vVeiculo.Comprador := Comprador
    else
      vVeiculo.Comprador.id := 0;
    }

    vVeiculo.cod_seguradora := StrToIntDef(edtCodSeguradora.Text,0);
    vVeiculo.numero_convocacao := StrToIntDef(edtNumConvocacao.Text,0);
    if TryStrToDate(mEdtDataConvocacao.Text, dataAux) then
    vVeiculo.data_convocacao   := dataAux;

    DtmDadosVeiculo.salvar(vVeiculo);

    btnPesquisarClick(Sender);
    if operacaoAnterior = toInserir then
      pgctrlPrincipal.ActivePage := tbsCadastro;
  finally
    FreeAndNil(vVeiculo);
  end;

end;

procedure TFrmCadastroVeiculo.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnAlterarClick(Sender);
end;

{procedure TFrmCadastroVeiculo.dbgrdConsultaDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not odd(dbgrdConsulta.DataSource.DataSet.RecNo) then
    if not (gdSelected in State) then
    begin
      dbgrdConsulta.Canvas.Brush.Color := clMoneyGreen;
      dbgrdConsulta.Canvas.FillRect(Rect);
      dbgrdConsulta.DefaultDrawDataCell(rect,Column.Field,state);
    end;
end;
 }
procedure TFrmCadastroVeiculo.dbgrdConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnAlterarClick(Sender);


end;

procedure TFrmCadastroVeiculo.dbgrdConsultaTitleClick(Column: TColumn);
begin
  {inherited;
  DtmDadosVeiculo.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosVeiculo.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;


  lblPesquisa.Caption := Column.Title.Caption;
  }
end;

procedure TFrmCadastroVeiculo.edtCodMarcaModeloExit(Sender: TObject);
begin
  inherited;
  if Trim(edtCodMarcaModelo.Text) = '' then
    edtDesMarcaModelo.Clear
  else
  begin
    edtDesMarcaModelo.Text := getDescricao('MARCA_MODELO', StrToInt(edtCodMarcaModelo.Text));
    if Trim(edtDesMarcaModelo.Text) = '' then
      exibeMensagem('Marca/Modelo não encontrado!',tmAviso, edtCodMarcaModelo)
    else
      edtCodMarcaModelo.Text := FormatFloat('000', StrToInt(edtCodMarcaModelo.text));
  end;
end;

procedure TFrmCadastroVeiculo.edtCodMarcaModeloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    btnConsultaMarcaModelo.Click;
end;

procedure TFrmCadastroVeiculo.edtCodSeguradoraExit(Sender: TObject);
begin
  inherited;
  if Trim(edtCodSeguradora.Text) = '' then
    edtNomeSeguradora.Clear
  else
  begin
    edtNomeSeguradora.Text := getDescricao('SEGURADORA', StrToInt(edtCodSeguradora.Text));
    if Trim(edtNomeSeguradora.Text) = '' then
      exibeMensagem('Seguradora não encontrado!',tmAviso, edtCodSeguradora)
    else
      edtCodSeguradora.Text := FormatFloat('000', StrToInt(edtCodSeguradora.text));
  end;
end;

procedure TFrmCadastroVeiculo.edtCodSeguradoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    btnConsultaSeguradora.Click;
end;

procedure TFrmCadastroVeiculo.edtCpfCnpjCompradorExit(Sender: TObject);
var
  iCodigo:Integer;
  NomePesquisa:String;
begin
  inherited;
   if ( Trim(edtCpfCnpjComprador.Text) <> '' )  then
   begin
     NomePesquisa := DtmDadosVeiculo.getNomeClientePorCPFCNPJ(edtCpfCnpjComprador.Text,iCodigo,4);
     if NomePesquisa <> EmptyStr then
     begin
       edtNomeComprador.Text := NomePesquisa;
       Comprador.id    := iCodigo;
     end
     else
     begin
       Comprador.id    := 0;
       if (NomeCompradorAntigo <> EmptyStr )then
         edtNomeComprador.Text := NomeCompradorAntigo;

       exibeMensagem('Comprador não encontrado!',tmAviso, edtCpfCnpjComprador);
       edtCpfCnpjComprador.Clear;
     end;
   end
   else
   begin
      // se nao informou o cpf e nao tem comprador antigo limpa o nome senao mantem
     if NomeCompradorAntigo = EmptyStr then
     begin
       Comprador.id    := 0;
       edtNomeComprador.Clear;
     end;
   end;
end;

procedure TFrmCadastroVeiculo.edtCpfCnpjCompradorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    btnConsultarComprador.Click;
end;

procedure TFrmCadastroVeiculo.edtCpfCnpjExit(Sender: TObject);
var
  iCodigo:Integer;
begin
  inherited;
   if ( Trim(edtCpfCnpj.Text) <> '' )  then
   begin
     edtNome.Text := DtmDadosVeiculo.getNomeClientePorCPFCNPJ(edtCpfCnpj.Text,iCodigo);
     Cliente.id   := iCodigo;
     //if ( edtNome.Text <> '' ) then
     //   if medtPlaca.CanFocus then medtPlaca.SetFocus;
   end
   else
     edtNome.Clear;
end;

procedure TFrmCadastroVeiculo.edtCpfCnpjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    btnConsultaCliente.Click;
end;

procedure TFrmCadastroVeiculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmCadastroVeiculo := nil;
end;

procedure TFrmCadastroVeiculo.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosVeiculo := TDtmDadosVeiculo.Create(nil);
  if not Assigned(Cliente) then Cliente := TCliente.Create;
  if not Assigned(Comprador) then Comprador := TComprador.Create;
  
  TipoOperacao := toInserir;

  carregaCombo('TIPO',cmbTipo);
  //carregaCombo('MARCA_MODELO',cmbMarcaModelo);
  carregaCombo('CATEGORIA',cmbCategoria);
  carregaCombo('COMBUSTIVEL',cmbCombustivel);
  carregaCombo('COR',cmbCor);
  carregaCombo('PROCESSO',cmbProcesso);

  iCodVeiculo := 0;
end;

procedure TFrmCadastroVeiculo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosVeiculo);
  if Assigned(Cliente) then Cliente.Free;
  if Assigned(Comprador) then Comprador.Free;
end;

procedure TFrmCadastroVeiculo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F4 then
  begin
    if not (dbgrdConsulta.DataSource.DataSet.IsEmpty) then
      AbrirTelaHistorico( dbgrdConsulta.DataSource.DataSet.FieldByName('placa').AsString );
  end
  else
  if Key = VK_F8 then
    btnPesquisarClick(Sender);
end;

function TFrmCadastroVeiculo.getQtdRegistros: integer;
begin
  Result := DtmDadosVeiculo.getQtdRegistros;
end;

procedure TFrmCadastroVeiculo.limpar;
begin
  edtCodigo.Clear;
  edtCpfCnpj.Clear;
  edtNome.Clear;
  medtPlaca.Clear;
  cmbUF.ItemIndex := 0;
  edtNumero.Clear;
  edtRenavam.Clear;
  edtChassi.Clear;
  edtAnoFab.Clear;
  edtAnoMod.Clear;
  edtMotor.Clear;
  edtNumeroSinistro.Clear;

  cmbTipo.ItemIndex := 0;
  cmbCategoria.ItemIndex := 0;
  cmbCombustivel.ItemIndex := 0;
  cmbCor.ItemIndex := 0;
  cmbProcesso.ItemIndex := 0;
  memoObs.Lines.Clear;
  SetiCodProcessoAtual(-1);
  SetiCodVeiculo(0);

  medtDataEmissao.Clear;
  medtDataRecebimento.Clear;
  chkPossuiSinistro.Checked := False;
  chkRecebeuCsv.Checked := False;
  edtNomeComprador.Clear;

  edtCodMarcaModelo.Clear;
  edtDesMarcaModelo.Clear;

  edtCpfCnpjComprador.Clear;
  edtNumConvocacao.Clear;
  mEdtDataConvocacao.Clear;
  edtCodSeguradora.Clear;
  edtNomeSeguradora.Clear;
  NomeCompradorAntigo := EmptyStr;
  if Assigned(Comprador) then
  begin
    Comprador.id := 0;
    Comprador.nome := EmptyStr;
  end;
//  btnNegativaFurto.Enabled:= False;
  pgctrlPrincipal.ActivePage := tbsConsulta;

  TipoOperacao := toInserir;

end;



procedure TFrmCadastroVeiculo.medtPlacaPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  if Key = #13 then
//    btnPesquisarClick(Sender);
end;

procedure TFrmCadastroVeiculo.pgctrlPrincipalEnter(Sender: TObject);
begin
  inherited;
  if (medtPlacaPesquisa.CanFocus) then
    medtPlacaPesquisa.SetFocus;
end;

procedure TFrmCadastroVeiculo.SetiCodProcessoAtual(const Value: Integer);
begin
  FiCodProcessoAtual := Value;
end;

procedure TFrmCadastroVeiculo.SetiCodVeiculo(const Value: Integer);
begin
  FiCodVeiculo := Value;
end;

procedure TFrmCadastroVeiculo.btnCadSeguradoraClick(Sender: TObject);
begin
  inherited;
  try
    FrmCadastroSeguradora := TFrmCadastroSeguradora.Create(nil);
    FrmCadastroSeguradora.SetTipoOperacao(toCadastroRapido);
    FrmCadastroSeguradora.FormStyle := fsNormal;
    FrmCadastroSeguradora.Visible := False;
    FrmCadastroSeguradora.ShowModal;
  finally
    FreeAndNil(FrmCadastroSeguradora);
  end;
end;

procedure TFrmCadastroVeiculo.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  edtCpfCnpj.SetFocus;
end;

function TFrmCadastroVeiculo.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtCpfCnpj.Text) = '' then
    exibeMensagem('Informe o CPF/CNPJ!',tmAviso)
  else
  if Trim(StringReplace( medtPlaca.Text,'-','',[rfReplaceAll])) = '' then
    exibeMensagem('Informe a PLACA!',tmAviso)
  else
  if cmbUF.ItemIndex <= 0 then
    exibeMensagem('Informe a UF!',tmAviso)
  else
  if not ValidaMascaraData(medtDataEmissao.Text) then
    exibeMensagem('Informe a DATA DA EMISSÃO corretamente!',tmAviso)
  else
  if not ValidaMascaraData(medtDataRecebimento.Text) then
    exibeMensagem('Informe a DATA DO RECEBIMENTO corretamente!',tmAviso)
  else
  if ( DtmDadosVeiculo.placaUFJaExiste( medtPlaca.Text,
                                        cmbUF.Text,
                                        iCodVeiculo)) then
    exibeMensagem('Placa já cadastrada para a UF informada!',tmAviso)
  else
    Result := True;
end;

end.
