unit U_FrmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,U_BibliotecaFuncoes,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,U_TCliente,
  Vcl.Mask, U_DtmDadosCliente;

  const
      VENDEDOR = 1;
      COMPRADOR = 2;
      AMBOS = 3;
type
  TFrmCadastroCliente = class(TFrmCadastroPadrao)
    edtCodigo: TEdit;
    edtNome: TEdit;
    Label1: TLabel;
    lbl1: TLabel;
    lblCPFCNPJ: TLabel;
    lbl3: TLabel;
    edtCNH: TEdit;
    lbl4: TLabel;
    edtRG: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edtLogradouro: TEdit;
    lbl7: TLabel;
    edtCidade: TEdit;
    lbl8: TLabel;
    edtBairro: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    medtTelefoneFixo: TMaskEdit;
    medtTelefoneCelular: TMaskEdit;
    lbl12: TLabel;
    lbl13: TLabel;
    edtEmail: TEdit;
    lbl14: TLabel;
    edtNumero: TEdit;
    rgTipoCliente : TRadioGroup;
    medtCPFCNPJ: TMaskEdit;
    medtCEP: TMaskEdit;
    cbbUF: TComboBox;
    RdGrpClasseCliente: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure dbgrdConsultaTitleClick(Column: TColumn);
    procedure dbgrdConsultaDblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure rgTipoClienteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TipoOperacao: TTipoOperacao;
    FCodTipoCliente: Integer;
    procedure limpar;
    function validaCampos: boolean;
    procedure configuraTamanhoCampo;
    procedure setTipoCliente();
    procedure Listar;
    procedure ConfiguraColunaPesquisa;
    procedure SetCodTipoCliente(const Value: Integer);
    procedure ConfiguraTela;

    property CodTipoCliente:Integer read FCodTipoCliente write SetCodTipoCliente;

  public
    { Public declarations }
    procedure SetTipoOperacao(oTipoOperacao:TTipoOperacao);
    constructor Create(PTipoCliente:Integer = 3);overload;
  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation

{$R *.dfm}

uses U_TEndereco, U_TTipo, U_TTipoCliente;

{ TFrmCadastroCliente }

procedure TFrmCadastroCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dsConsulta.DataSet.IsEmpty then
  begin
    edtCodigo.Text           := FormatFloat('000', DtmDadosCliente.cdsPesquisacodigo.AsInteger);
    edtNome.Text             := DtmDadosCliente.cdsPesquisaNOME.AsString;

    if ( Length(Trim(DtmDadosCliente.cdsPesquisacpf_cnpj.AsString)) = 11) then
      rgTipoCliente.ItemIndex := 0
    else
    if ( Length(trim(DtmDadosCliente.cdsPesquisacpf_cnpj.AsString)) = 14) then
      rgTipoCliente.ItemIndex := 1;
    setTipoCliente;

    medtCpfCnpj.Text          := DtmDadosCliente.cdsPesquisaCPF_CNPJ.AsString;
    edtCNH.Text              := DtmDadosCliente.cdsPesquisaCNH.AsString;
    edtRG.Text               := DtmDadosCliente.cdsPesquisaRG.AsString;
    edtLogradouro.Text       := DtmDadosCliente.cdsPesquisaLOGRADOURO.AsString;
    edtNumero.Text           := DtmDadosCliente.cdsPesquisaNUMERO.AsString;
    edtCidade.Text           := DtmDadosCliente.cdsPesquisaCIDADE.AsString;
    edtBairro.Text           := DtmDadosCliente.cdsPesquisaBAIRRO.AsString;

    cbbUF.ItemIndex    := cbbUF.Items.IndexOf(DtmDadosCliente.cdsPesquisaUF.Text);

    medtCEP.Text              := DtmDadosCliente.cdsPesquisaCEP.AsString;
    medtTelefoneFixo.Text    := DtmDadosCliente.cdsPesquisaTELEFONE_FIXO.AsString;
    medtTelefoneCelular.Text := DtmDadosCliente.cdsPesquisaTELEFONE_CELULAR.AsString;
    RdGrpClasseCliente.ItemIndex := DtmDadosCliente.cdsPesquisacod_tipo_cliente.AsInteger -1;
    TipoOperacao := toAlterar;
    pgctrlPrincipal.ActivePage := tbsCadastro;
  end;
end;

procedure TFrmCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpar();
end;

procedure TFrmCadastroCliente.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not dsConsulta.DataSet.IsEmpty) and (exibeMensagem('Deseja excluir o registro?',tmPergunta) = mrYes) then
  begin
    DtmDadosCliente.excluir(DtmDadosCliente.cdsPesquisaCODIGO.AsInteger);
    Listar();
    limpar;
  end;
end;

procedure TFrmCadastroCliente.btnSalvarClick(Sender: TObject);
var
  Cliente: TCliente;
  intAux:integer;
begin
  inherited;
  if not validaCampos then
    Exit;

  Cliente := TCliente.Create;
  try
    if TipoOperacao = toAlterar then
      Cliente.id := StrToInt(edtCodigo.Text);

    Cliente.nome               := Trim(edtNome.Text);
    Cliente.cpf                := Trim(medtCPFCNPJ.Text);
    Cliente.cnh                := Trim(edtCNH.Text);
    Cliente.rg                 := Trim(edtRG.Text);

    Cliente.endereco           := TEndereco.Create;
    Cliente.tipoCliente        := TTipoCliente.Create;

    Cliente.endereco.rua       := Trim(edtLogradouro.Text);
    Cliente.endereco.numero    := Trim(edtNumero.Text);
    Cliente.endereco.cidade    := Trim(edtCidade.Text);
    Cliente.endereco.bairro    := Trim(edtBairro.Text);
    Cliente.endereco.cep       := Trim(medtCEP.Text);
    if ( cbbUF.ItemIndex > 0) then
      Cliente.endereco.uf        := cbbUF.Text;
    Cliente.telefoneFixo       := Trim(medtTelefoneFixo.Text);
    Cliente.telefoneCelular    := Trim(medtTelefoneCelular.Text);

    Cliente.tipoCliente.codigo := RdGrpClasseCliente.ItemIndex + 1;
    DtmDadosCliente.salvar(Cliente);
    DtmDadosCliente.listar;

    limpar;
  finally
    FreeAndNil(Cliente);
  end;

end;

procedure TFrmCadastroCliente.ConfiguraColunaPesquisa;
begin

end;

procedure TFrmCadastroCliente.configuraTamanhoCampo;
begin
    edtNome.MaxLength             := DtmDadosCliente.cdsPesquisaNOME.Size;
    medtCpfCnpj.MaxLength          := DtmDadosCliente.cdsPesquisaCPF_CNPJ.Size;
    edtCNH.MaxLength              := DtmDadosCliente.cdsPesquisaCNH.Size;
    edtRG.MaxLength               := DtmDadosCliente.cdsPesquisaRG.Size;
    edtLogradouro.MaxLength       := DtmDadosCliente.cdsPesquisaLOGRADOURO.Size;
    edtNumero.MaxLength           := DtmDadosCliente.cdsPesquisaNUMERO.Size;
    edtCidade.MaxLength           := DtmDadosCliente.cdsPesquisaCIDADE.Size;
    edtBairro.MaxLength           := DtmDadosCliente.cdsPesquisaBAIRRO.Size;
    medtCEP.MaxLength              := DtmDadosCliente.cdsPesquisaCEP.Size;
    medtTelefoneFixo.MaxLength    := DtmDadosCliente.cdsPesquisaTELEFONE_FIXO.Size;
    medtTelefoneCelular.MaxLength := DtmDadosCliente.cdsPesquisaTELEFONE_CELULAR.Size;
end;

procedure TFrmCadastroCliente.ConfiguraTela;
begin
  if CodTipoCliente = COMPRADOR then
  begin
    RdGrpClasseCliente.ItemIndex := 1;
  end
  else
  if (CodTipoCliente = VENDEDOR )then
  begin
    RdGrpClasseCliente.ItemIndex := 0;
  end;
end;

constructor TFrmCadastroCliente.Create(PTipoCliente: Integer);
begin
  inherited Create(nil);

  CodTipoCliente := PTipoCliente;

  ConfiguraTela;
end;

procedure TFrmCadastroCliente.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  if( TipoOperacao <> toConsultar) then
     btnAlterarClick(Sender)
  else
  begin
    ModalResult :=  mrOk;
  end;
end;

procedure TFrmCadastroCliente.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  if ( Column.Index = 1 )  then
     DtmDadosCliente.cdsPesquisa.IndexFieldNames :='CPF_CNPJ'
  else
     DtmDadosCliente.cdsPesquisa.IndexFieldNames := Column.FieldName;
  DtmDadosCliente.cdsPesquisa.First;

  edtPesquisa.NumbersOnly := Column.Field.DataType <> ftString;


  lblPesquisa.Caption := Column.Title.Caption+':';
end;

procedure TFrmCadastroCliente.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtPesquisa.Text) <> '' then
    DtmDadosCliente.cdsPesquisa.Locate(DtmDadosCliente.cdsPesquisa.IndexFieldNames, edtPesquisa.Text, [loPartialKey])
  else
    DtmDadosCliente.cdsPesquisa.First;
end;

procedure TFrmCadastroCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if TipoOperacao <> toConsultar then
  begin
    Action := caFree;
    FrmCadastroCliente := nil;
  end;
end;

procedure TFrmCadastroCliente.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosCliente := TDtmDadosCliente.Create(nil);
  Listar;
  DtmDadosCliente.cdsPesquisa.IndexFieldNames := 'NOME';
  lblPesquisa.Caption := 'Nome:';

  TipoOperacao := toInserir;
  configuraTamanhoCampo;
end;

procedure TFrmCadastroCliente.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(DtmDadosCliente);
end;

procedure TFrmCadastroCliente.limpar;
begin
   edtCodigo.Clear;
   edtNome.Clear;
   medtCPFCNPJ.Clear;
   edtCNH.Clear;
   edtRG.Clear;
   edtLogradouro.Clear;
   edtNumero.Clear;
   edtCidade.Clear;
   edtBairro.Clear;
   cbbUF.ItemIndex := 0;
   medtCEP.Clear;
   medtTelefoneFixo.Clear;
   medtTelefoneCelular.Clear;
   edtEmail.Clear;
   rgTipoCliente.ItemIndex := 0;
   RdGrpClasseCliente.ItemIndex := 0 ;
   setTipoCliente;
   TipoOperacao := toInserir;
   pgctrlPrincipal.ActivePage := tbsConsulta;
end;

procedure TFrmCadastroCliente.Listar;
begin
  DtmDadosCliente.listar;
//  stbResumo.Panels[0].Text := 'Qtd. Registros: ' + FormatFloat('000', DtmDadosCliente.cdsPesquisa.RecordCount);
end;

procedure TFrmCadastroCliente.rgTipoClienteClick(Sender: TObject);
begin
  inherited;
  setTipoCliente();
end;

procedure TFrmCadastroCliente.SetCodTipoCliente(const Value: Integer);
begin
  FCodTipoCliente := Value;
end;

procedure TFrmCadastroCliente.setTipoCliente;
begin
  medtCPFCNPJ.Clear;
  if( rgTipoCliente.ItemIndex = 0 ) then
  begin
    lblCPFCNPJ.Caption := 'CPF:';
    medtCPFCNPJ.MaxLength := 11;
    medtCPFCNPJ.EditMask := '999\.999\.999\-99;0;_';
  end
  else
  begin
    lblCPFCNPJ.Caption := 'CNPJ:';
    medtCPFCNPJ.MaxLength := 14;
    medtCPFCNPJ.EditMask := '99\.999\.999\/9999\-99;0;_';
  end;
end;

procedure TFrmCadastroCliente.SetTipoOperacao(oTipoOperacao: TTipoOperacao);
begin
   TipoOperacao := oTipoOperacao;
end;

function TFrmCadastroCliente.validaCampos: boolean;
begin
  Result := False;
  if Trim(edtNome.Text) = '' then
    exibeMensagem('Informe o Nome!',tmAviso)
  else
  if Trim(medtCpfCnpj.Text) = '' then
    exibeMensagem('Informe o' + lblCPFCNPJ.Caption+'!',tmAviso)
  else
  if not( validaCPFCNPJ(medtCPFCNPJ.Text)) then
    exibeMensagem(lblCPFCNPJ.Caption + ' Inválido!',tmAviso)
  else
  if DtmDadosCliente.CPFCNPJExiste(Trim(medtCPFCNPJ.Text),StrToIntDef(edtCodigo.Text,0)) then
    exibeMensagem(lblCPFCNPJ.Caption + ' já cadastrado!',tmAviso)
  else
    Result := True;
end;

end.
