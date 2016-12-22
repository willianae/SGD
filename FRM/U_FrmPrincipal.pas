unit U_FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_BibliotecaFuncoes, Vcl.Menus,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ImgList, U_DtmConexao, U_TUsuario,
  U_FrmCadastroUsuario, U_FrmCadastroCombustivel, U_FrmCadastroTipo, U_FrmCadastroCategoria,
  U_FrmCadastroMarcaModelo, U_FrmCadastroCor, U_FrmCadastroTipoServico, U_FrmCadastroVeiculo,
  U_FrmCadastroServico, U_FrmCadastroSituacao, U_FrmCadastroProcesso,
  Vcl.Imaging.jpeg, U_FrmHistoricoProcesso, U_FrmRecebimentoCSV,
  System.ImageList;

type
  TFrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Relatrios1: TMenuItem;
    Sobre1: TMenuItem;
    N1: TMenuItem;
    stbResumo: TStatusBar;
    Cliente1: TMenuItem;
    Veculo1: TMenuItem;
    iposdeServios1: TMenuItem;
    Servicos1: TMenuItem;
    AuxiliaresVeculos1: TMenuItem;
    NegativadeFurto1: TMenuItem;
    ipo1: TMenuItem;
    Combustvel1: TMenuItem;
    Categoria1: TMenuItem;
    MarcaModelo1: TMenuItem;
    Cor1: TMenuItem;
    ImageListPrincipal: TImageList;
    ToolBarPrincipal: TToolBar;
    btnCliente: TToolButton;
    ToolButton2: TToolButton;
    btnVeiculo: TToolButton;
    timerPrincipal: TTimer;
    Acesso1: TMenuItem;
    Logoff1: TMenuItem;
    Sair1: TMenuItem;
    btnServiços: TToolButton;
    ToolButton3: TToolButton;
    CadastroUsurio1: TMenuItem;
    Configuraes1: TMenuItem;
    Empresa1: TMenuItem;
    Situacao1: TMenuItem;
    Processo1: TMenuItem;
    imgPrincipal: TImage;
    HistoricodeProcesso1: TMenuItem;
    ToolButton1: TToolButton;
    btnHistoricoProcesso: TToolButton;
    ToolButton4: TToolButton;
    N2: TMenuItem;
    Convocao1: TMenuItem;
    RecebimentoCSV1: TMenuItem;
    Seguradora1: TMenuItem;
    N3: TMenuItem;
    RealizarBackup1: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sair1Click(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure timerPrincipalTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CadastroUsurio1Click(Sender: TObject);
    procedure Combustvel1Click(Sender: TObject);
    procedure ipo1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure MarcaModelo1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure iposdeServios1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Servicos1Click(Sender: TObject);
    procedure NegativadeFurto1Click(Sender: TObject);
    procedure Situacao1Click(Sender: TObject);
    procedure Processo1Click(Sender: TObject);
    procedure HistoricodeProcesso1Click(Sender: TObject);
    procedure Convocao1Click(Sender: TObject);
    procedure RecebimentoCSV1Click(Sender: TObject);
    procedure Seguradora1Click(Sender: TObject);
    procedure RealizarBackup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure logar;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  U_FrmLogin, U_FrmCadastroCliente,
  U_FrmNegativaDeFurto, U_FrmCadastroEmpresa, U_FrmGeraConvocacao,
  U_FrmCadastroPadrao, U_FrmCadastroSeguradora;

{$R *.dfm}

procedure TFrmPrincipal.CadastroUsurio1Click(Sender: TObject);
begin
  try
    FrmCadastroUsuario := TFrmCadastroUsuario.Create(nil);
    FrmCadastroUsuario.ShowModal;
  finally
    FreeAndNil(FrmCadastroUsuario);
  end;
end;

procedure TFrmPrincipal.Categoria1Click(Sender: TObject);
begin
  if FrmCadastroCategoria = nil then
    FrmCadastroCategoria := TFrmCadastroCategoria.Create(application)
  else
    FrmCadastroCategoria.Show;
end;

procedure TFrmPrincipal.Cliente1Click(Sender: TObject);
begin
  if FrmCadastroCliente = nil then
    FrmCadastroCliente := TFrmCadastroCliente.Create(application)
  else
    FrmCadastroCliente.Show;
end;

procedure TFrmPrincipal.Combustvel1Click(Sender: TObject);
begin
  if FrmCadastroCombustivel = nil then
    FrmCadastroCombustivel := TFrmCadastroCombustivel.Create(application)
  else
    FrmCadastroCombustivel.Show;
end;

procedure TFrmPrincipal.Convocao1Click(Sender: TObject);
begin
   try
      FrmGeraConvocacao := TFrmGeraConvocacao.Create(nil);
      FrmGeraConvocacao.ShowModal;
   finally
      FreeAndNil(FrmGeraConvocacao);
   end;
end;

procedure TFrmPrincipal.Cor1Click(Sender: TObject);
begin
  if FrmCadastroCor = nil then
    FrmCadastroCor := TFrmCadastroCor.Create(application)
  else
    FrmCadastroCor.Show;
end;

procedure TFrmPrincipal.Empresa1Click(Sender: TObject);
begin
   try
      FrmCadastroEmpresa := TFrmCadastroEmpresa.Create(nil);
      FrmCadastroEmpresa.ShowModal;
   finally
      FreeAndNil(FrmCadastroEmpresa);
   end;

end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := exibeMensagem('Deseja sair do sistema?',tmPergunta) = mrYes;
  if CanClose then
    Application.Terminate;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  indexOf:integer;
begin
  FrmPrincipal.Caption := FrmPrincipal.Caption + ' [ ' + VersaoExe + ' ] ';

  if not DtmConexao.AdoConn.Connected then
  begin
    for indexOf := 0 to mnuPrincipal.Items.Count -1 do
    begin
      mnuPrincipal.Items[indexOf].Enabled := False;
    end;

    for indexOf := 0 to ToolBarPrincipal.ButtonCount -1 do
    begin
      ToolBarPrincipal.Buttons[indexOf].Enabled := False;
    end;
  end

end;

procedure TFrmPrincipal.FormPaint(Sender: TObject);
begin
  logar;
end;

procedure TFrmPrincipal.HistoricodeProcesso1Click(Sender: TObject);
begin
  if FrmHistoricoProcesso = nil then
    FrmHistoricoProcesso := TFrmHistoricoProcesso.Create(application)
  else
    FrmHistoricoProcesso.Show;
end;

procedure TFrmPrincipal.ipo1Click(Sender: TObject);
begin
  if FrmCadastroTipo = nil then
    FrmCadastroTipo := TFrmCadastroTipo.Create(application)
  else
    FrmCadastroTipo.Show;
end;

procedure TFrmPrincipal.iposdeServios1Click(Sender: TObject);
begin
  if FrmCadastroTipoServico = nil then
    FrmCadastroTipoServico := TFrmCadastroTipoServico.Create(application)
  else
    FrmCadastroTipoServico.Show;
end;

procedure TFrmPrincipal.logar;
begin
  if (DtmConexao.UsuarioLogado.nome = '') and (FrmLogin = nil) then
  try
    FrmLogin := TFrmLogin.Create(nil);
    FrmLogin.ShowModal;
    if FrmLogin.ModalResult = mrOk then
      stbResumo.Panels[0].Text := 'Usuário: ' + DtmConexao.UsuarioLogado.nome
    else
      Application.Terminate;
  finally
    FreeAndNil(FrmLogin);
  end;
end;

procedure TFrmPrincipal.Logoff1Click(Sender: TObject);
begin
  FreeAndNil(DtmConexao.UsuarioLogado);
  DtmConexao.UsuarioLogado := TUsuario.Create;
  stbResumo.Panels[0].Text := '';
  logar;
end;

procedure TFrmPrincipal.MarcaModelo1Click(Sender: TObject);
begin
  if FrmCadastroMarcaModelo = nil then
    FrmCadastroMarcaModelo := TFrmCadastroMarcaModelo.Create(application)
  else
    FrmCadastroMarcaModelo.Show;
end;

procedure TFrmPrincipal.NegativadeFurto1Click(Sender: TObject);
begin
   try
     FrmNegativaDeFurto := TFrmNegativaDeFurto.Create(nil);
     FrmNegativaDeFurto.ShowModal;
   finally
     FreeAndNil(FrmNegativaDeFurto);
   end;
end;

procedure TFrmPrincipal.Processo1Click(Sender: TObject);
begin
  if FrmCadastroProcesso = nil then
    FrmCadastroProcesso := TFrmCadastroProcesso.Create(application)
  else
    FrmCadastroProcesso.Show;
end;

procedure TFrmPrincipal.RealizarBackup1Click(Sender: TObject);
begin
 // ShellExecute( 0, 'open', pchar( 'pg_dump.exe --host 192.168.0.1 --port 5432 --username postgres --format custom --file C:\temp\NomeBackup.backup Nome_Banco' ), nil, nil, SW_HIDE );
end;

procedure TFrmPrincipal.RecebimentoCSV1Click(Sender: TObject);
begin
  try
      FrmRecebimentoCSV := TFrmRecebimentoCSV.Create(nil);
      FrmRecebimentoCSV.ShowModal;
  finally
      FreeAndNil(FrmRecebimentoCSV);
  end;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.Seguradora1Click(Sender: TObject);
begin
  if Frmcadastroseguradora = nil then
    Frmcadastroseguradora := TFrmcadastroseguradora.Create(application)
  else
    Frmcadastroseguradora.Show;
end;

procedure TFrmPrincipal.Servicos1Click(Sender: TObject);
begin
  if FrmCadastroServico = nil then
    FrmCadastroServico := TFrmCadastroServico.Create(application)
  else
    FrmCadastroServico.Show;
end;

procedure TFrmPrincipal.Situacao1Click(Sender: TObject);
begin
  if FrmCadastroSituacao = nil then
    FrmCadastroSituacao := TFrmCadastroSituacao.Create(application)
  else
    FrmCadastroSituacao.Show;
end;

procedure TFrmPrincipal.timerPrincipalTimer(Sender: TObject);
begin
  stbResumo.Panels[1].Text := FormatDateTime('hh:mm:ss',Now);
end;

procedure TFrmPrincipal.Veculo1Click(Sender: TObject);
begin
  if FrmCadastroVeiculo = nil then
    FrmCadastroVeiculo := TFrmCadastroVeiculo.Create(application)
  else
    FrmCadastroVeiculo.Show;
end;

end.
