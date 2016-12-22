unit U_FrmCadastroUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TFrmCadastroUsuario = class(TForm)
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtLogin: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    dbgUsuario: TDBGrid;
    lblNivel: TLabel;
    cbNivel: TComboBox;
    btnNovo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure dbgUsuarioDblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    Fcodigo: integer;
    procedure Setcodigo(const Value: integer);
  private
    { Private declarations }
    property codigo:integer read Fcodigo write Setcodigo;
    procedure limpar();

  public
    { Public declarations }
  end;

var
  FrmCadastroUsuario: TFrmCadastroUsuario;

implementation

uses U_dtmDadosUsuario, U_BibliotecaFuncoes, U_DtmConexao;

{$R *.dfm}

procedure TFrmCadastroUsuario.FormCreate(Sender: TObject);
begin
  if not Assigned(DtmDadosUsuario) then
   dtmDadosUsuario := TdtmDadosUsuario.Create(nil);

   dtmDadosUsuario.carregarGradeUsuario;
   dbgUsuario.DataSource := dtmDadosUsuario.dsPesquisa;
   limpar;

   lblNivel.Visible := DtmConexao.UsuarioLogado.nivel > 0;
   cbNivel.Visible := DtmConexao.UsuarioLogado.nivel > 0;
end;

procedure TFrmCadastroUsuario.limpar;
begin
   edtNome.Clear;
   edtLogin.Clear;
   edtSenha.Clear;
   codigo := -1;
   cbNivel.ItemIndex := 0;
end;

procedure TFrmCadastroUsuario.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TFrmCadastroUsuario.dbgUsuarioDblClick(Sender: TObject);
begin
// carregar
   edtNome.Text   := dtmDadosUsuario.cdsPesquisaNOME.AsString;
   edtLogin.Text  := dtmDadosUsuario.cdsPesquisaLOGIN.AsString;
   edtSenha.Text  := descriptografar( dtmDadosUsuario.cdsPesquisaSENHA.AsString );
   codigo         := dtmDadosUsuario.cdsPesquisaCODIGO.AsInteger;
   cbNivel.ItemIndex := dtmDadosUsuario.cdsPesquisaNIVEL.AsInteger;
end;

procedure TFrmCadastroUsuario.btnSalvarClick(Sender: TObject);
var
  icodigo:integer;
begin

   icodigo := codigo;
   try
     if ( Trim(edtNome.Text) = '' ) then
     begin
       exibeMensagem('Nome não informado!', tmAviso);
       Exit;
     end;

     if ( Trim(edtLogin.Text) = '')then
     begin
       exibeMensagem('Login não informado', tmAviso);
       Exit;
     end;

     if ( Trim(edtSenha.Text) = '')then
     begin
       exibeMensagem('Senha não informada!', tmAviso);
       Exit;
     end;

     if ( Length(trim(edtLogin.Text)) < 4 )then
     begin
       exibeMensagem('Informar login com no minimo 4 caracteres!', tmAviso);
       Exit;
     end;

     if ( Length(trim(edtSenha.Text)) < 4 )then
     begin
       exibeMensagem('Informar senha com no minimo 4 caracteres!', tmAviso);
       Exit;
     end;

     if ( dtmDadosUsuario.existeLogin(edtLogin.Text,icodigo))then
     begin
       exibeMensagem('Login já cadastrado!', tmAviso);
       Exit;
     end;

     if ( dtmDadosUsuario.gravarUsuario(Trim(edtNome.Text),Trim(edtLogin.Text),Trim(edtSenha.Text),icodigo, cbNivel.ItemIndex))then
     begin
       exibeMensagem('Usuário cadastrado com sucesso!', tmInformacao);
       limpar;
       dtmDadosUsuario.carregarGradeUsuario();
     end
     else
     begin
       exibeMensagem('Erro ao cadastrado usuário! Tente novamente!', tmErro);
       limpar;
       edtNome.SetFocus;
     end;
   except
     on e: Exception do
     begin
          exibeMensagem('Erro ao gravar usuário. Informe o erro:' + e.Message, tmErro);
          Exit;
     end;
   end;
end;

procedure TFrmCadastroUsuario.btnExcluirClick(Sender: TObject);
begin
   edtNome.Clear;
   edtLogin.Clear;
   edtSenha.Clear;
   if ( exibeMensagem('Deseja excluir usuário?', tmPergunta) =  ID_YES)then
   begin
      dtmDadosUsuario.excluirUsuario(dtmDadosUsuario.cdsPesquisaCODIGO.AsInteger);
      dtmDadosUsuario.carregarGradeUsuario();
   end;
end;

procedure TFrmCadastroUsuario.btnNovoClick(Sender: TObject);
begin
  limpar;
  edtNome.SetFocus;
end;

procedure TFrmCadastroUsuario.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
