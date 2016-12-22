unit U_FrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage,U_FrmPadrao;

type
  TFrmLogin = class(TFrmPadrao)
    Panel1: TPanel;
    edtSenha: TEdit;
    Label2: TLabel;
    edtLogin: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    btnEntrar: TBitBtn;
    btnSair: TBitBtn;
    Image1: TImage;
    procedure btnSairClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses U_dtmDadosUsuario, U_BibliotecaFuncoes, U_FrmPrincipal;

{$R *.dfm}

procedure TFrmLogin.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.btnEntrarClick(Sender: TObject);
begin
   if (  Trim(edtLogin.Text) = '') then
   begin
     exibeMensagem('Login não informado!', tmInformacao);
     Exit;
   end;

   if ( Trim(edtSenha.Text) = '' ) then
   begin
     exibeMensagem('Senha não informada!', tmInformacao);
     Exit;
   end;

   if ( dtmDadosUsuario.efetuarLogin(edtLogin.Text, edtSenha.Text) ) then
   begin
      //Application.CreateForm(TfrmPrincipal, frmPrincipal);
      //Self.Hide;
      //frmPrincipal.Show;
      ModalResult := mrOk;

   end
   else
   begin
     exibeMensagem('Usuário ou senha inválido!', tmAviso);
      Exit;
   end;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
   dtmDadosUsuario := TdtmDadosUsuario.Create(nil);
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
   FreeAndNil(dtmDadosUsuario);
end;

procedure TFrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnEntrarClick(Sender);
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  edtLogin.Clear;
  edtSenha.Clear;
  if edtLogin.CanFocus then
    edtLogin.SetFocus;
end;

end.
