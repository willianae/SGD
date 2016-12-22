unit U_FrmGeraConvocacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmPadrao, Data.DB, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.ComCtrls, U_DtmDadosVeiculo, U_TVeiculo;

type
  TFrmGeraConvocacao = class(TFrmPadrao)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    stat1: TStatusBar;
    grp1: TGroupBox;
    medtPlaca: TMaskEdit;
    lbl1: TLabel;
    lbl3: TLabel;
    edtProprietario: TEdit;
    grp2: TGroupBox;
    lbl4: TLabel;
    cbbSeguradora: TComboBox;
    lbl5: TLabel;
    edtNumConvocacao: TEdit;
    rgIpva: TRadioGroup;
    rgRestricao: TRadioGroup;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    btnSalvar: TBitBtn;
    btnSair: TBitBtn;
    dbgrdServico: TDBGrid;
    lbl6: TLabel;
    edtVeiculo: TEdit;
    dsConvocacao: TDataSource;
    lbl7: TLabel;
    edtAnoModelo: TEdit;
    btnCadSeguradora: TSpeedButton;
    Label1: TLabel;
    edtUF: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCadSeguradoraClick(Sender: TObject);
    procedure medtPlacaExit(Sender: TObject);
  private
    FcodVeiculo: Integer;
    procedure SetcodVeiculo(const Value: Integer);
    procedure limpar;
    function getDadosVeiculo(sPlaca:string):Boolean;
    function validaCamposVeiculo:Boolean;
    procedure limparDadosVeiculo;
    function validaCampos:Boolean;
    { Private declarations }
    property codVeiculo:Integer read FcodVeiculo write SetcodVeiculo;
  public
    { Public declarations }
  end;

var
  FrmGeraConvocacao: TFrmGeraConvocacao;

implementation

{$R *.dfm}

uses U_FrmRelConvocacao, U_DtmDadosConvocacao, U_TCodDesc, U_BibliotecaFuncoes,
  U_FrmCadastroSeguradora;

procedure TFrmGeraConvocacao.btnAddClick(Sender: TObject);
var
  sIpva,sRestricao:string;
begin
  inherited;
  if validaCamposVeiculo then
  begin
    if rgIpva.ItemIndex = 0 then sIpva := 'S' else sIpva :=  'N';
    if(rgRestricao.ItemIndex = 0) then sRestricao := 'S' else sRestricao := 'N';

     DtmDadosConvocacao.adicionaCDSConvocacao(edtVeiculo.Text,medtPlaca.Text,edtUF.Text, edtAnoModelo.Text,
                                             sIpva,
                                             sRestricao,cbbSeguradora.Text,
                                             codVeiculo,
                                             TCodDesc(cbbSeguradora.Items.Objects[cbbSeguradora.ItemIndex]).codigo,
                                             StrToInt
                                             ( edtNumConvocacao.Text)
                                             );
     limparDadosVeiculo;
     medtPlaca.SetFocus;
  end;
end;

procedure TFrmGeraConvocacao.btnCadSeguradoraClick(Sender: TObject);
begin
  inherited;
  try
    FrmCadastroSeguradora := TFrmCadastroSeguradora.Create(nil);
    FrmCadastroSeguradora.SetTipoOperacao(toCadastroRapido);
    FrmCadastroSeguradora.FormStyle := fsNormal;
    FrmCadastroSeguradora.Visible := False;
    FrmCadastroSeguradora.ShowModal;
    carregaCombo('SEGURADORA',cbbSeguradora);
  finally
    FreeAndNil(FrmCadastroSeguradora);
  end;
end;

procedure TFrmGeraConvocacao.btnRemoveClick(Sender: TObject);
begin
  inherited;
  if not (DtmDadosConvocacao.cdsConvocacao.IsEmpty) then
  begin
    if ( exibeMensagem('Deseja excluir ?',tmPergunta) = ID_YES )  then
       DtmDadosConvocacao.cdsConvocacao.Delete;
  end;
end;

procedure TFrmGeraConvocacao.btnSairClick(Sender: TObject);
begin
  inherited;
   Close;
end;

procedure TFrmGeraConvocacao.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if (not (validaCampos ))then
    exit;
   try
     FrmRelConvocacao := TFrmRelConvocacao.Create(nil);
     FrmRelConvocacao.RLLblTituloSeguradora.Caption :=
     'Convocação ' +
     FormatFloat('000', StrToInt(edtNumConvocacao.Text)) + '/' +
     FormatDateTime('yyyy',DataDB);
     FrmRelConvocacao.RLLabelCidadeUFEmp.Caption := 'Recife - PE';
     FrmRelConvocacao.rlblAnoIpva.Caption := 'IPVA/' + FormatDateTime('yyyy',DataDB);
     DtmDadosConvocacao.gravarDadosConvocacao;
     FrmRelConvocacao.RLReport1.PreviewModal;
   finally
     FreeAndNil(FrmRelConvocacao);
     limpar;
   end;
end;

procedure TFrmGeraConvocacao.FormCreate(Sender: TObject);
begin
  inherited;
  DtmDadosConvocacao := TDtmDadosConvocacao.Create(nil);
  DtmDadosVeiculo    := TDtmDadosVeiculo.Create(nil);

  carregaCombo('SEGURADORA',cbbSeguradora);
end;

procedure TFrmGeraConvocacao.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(DtmDadosConvocacao);
   FreeAndNil(DtmDadosVeiculo);
end;

function TFrmGeraConvocacao.getDadosVeiculo(sPlaca: string):Boolean;
var
  vVeiculo: TVeiculo;
begin
  vVeiculo := DtmDadosVeiculo.getVeiculoPelaPlaca(sPlaca);
  Result := vVeiculo <> nil;
  if Result then
  begin
    edtVeiculo.Text := vVeiculo.marca_modelo.descricao;
    edtUF.Text := vVeiculo.uf;
    edtAnoModelo.Text := IntToStr(vVeiculo.ano_fabricacao) + '/' + IntToStr(vVeiculo.ano_modelo);
    edtProprietario.Text := vVeiculo.cliente.nome;
    SetcodVeiculo(vVeiculo.codigo);
  end;

   { ESTUDAR CONCEITO DE OO COM RIBA -----
   if ( DtmDadosConvocacao.getDadosVeiculo(sPlaca,icodVeiculo,sVeiculo,sAnoModelo,sProprietario)) then
   begin
      edtVeiculo.Text := sVeiculo;
      edtAnoModelo.Text := sAnoModelo;
      edtProprietario.Text := sProprietario;
      SetcodVeiculo(icodVeiculo);
      Result := True;
   end
   else
      Result := False;
   }
end;

procedure TFrmGeraConvocacao.limpar;
begin
   DtmDadosConvocacao.cdsConvocacao.EmptyDataSet;
   cbbSeguradora.ItemIndex :=0;
   edtNumConvocacao.Clear;
   limparDadosVeiculo;
   cbbSeguradora.SetFocus;
end;

procedure TFrmGeraConvocacao.limparDadosVeiculo;
begin
   SetcodVeiculo(0);
   medtPlaca.Clear;
   edtUF.Clear;
   edtVeiculo.Clear;
   edtAnoModelo.Clear;
   edtProprietario.Clear;
   rgIpva.ItemIndex := 0;
   rgRestricao.ItemIndex := 1;

end;

procedure TFrmGeraConvocacao.medtPlacaExit(Sender: TObject);
begin
  inherited;
  if Trim(StringReplace(medtPlaca.Text,'-','',[rfReplaceAll])) <> '' then
  begin
     if not getDadosVeiculo(medtPlaca.Text) then
       exibeMensagem('Veículo não encontrado!', tmAviso, medtPlaca, True);
  end;
end;

procedure TFrmGeraConvocacao.SetcodVeiculo(const Value: Integer);
begin
  FcodVeiculo := Value;
end;

function TFrmGeraConvocacao.validaCampos:Boolean;
begin
   Result := True;
   if ( trim( edtNumConvocacao.Text ) = '') then
   begin
     exibeMensagem('Número da convocação não informado!',tmAviso,edtNumConvocacao);
     Result := False;
   end;
end;

function TFrmGeraConvocacao.validaCamposVeiculo: Boolean;
begin
   if ( cbbSeguradora.ItemIndex <= 0 ) then
   begin
     exibeMensagem('Seguradora não informada!',tmAviso, medtPlaca);
     Result := False;
     Exit;
   end
   else
   if ( Trim(medtPlaca.Text) = '' )   then
   begin
     exibeMensagem('Placa do Veículo não informado!',tmAviso, medtPlaca);
     Result := False;
     Exit;
   end
   else
   if DtmDadosConvocacao.cdsConvocacao.Locate('PLACA',medtPlaca.Text,[loCaseInsensitive]) then
   begin
     exibeMensagem('Veiculo já adicionado!',tmAviso,medtPlaca);
     Result := False;
     Exit;
   end
   else
   if ( DtmDadosConvocacao.veiculoJaConvocado(medtPlaca.Text, StrToInt( FormatDateTime('yyyy',DataDB)))) then
   begin
     exibeMensagem('Veículo já convocado!',tmAviso,medtPlaca);
     Result := False;
     Exit;
   end;

    Result := True;
end;

end.
