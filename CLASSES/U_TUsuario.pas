unit U_TUsuario;

interface

uses
  U_BibliotecaFuncoes;

type TUsuario = class

  private
    Fcodigo: Integer;
    Fnivel: integer;
    Fsenha: string;
    Flogin: string;
    Fnome: string;
    procedure Setcodigo(const Value: Integer);
    procedure Setlogin(const Value: string);
    procedure Setnivel(const Value: integer);
    procedure Setnome(const Value: string);
    procedure Setsenha(const Value: string);
  public
   property codigo :Integer read Fcodigo write Setcodigo;
   property nome : string read Fnome write Setnome;
   property login: string read Flogin write Setlogin;
   property senha: string read Fsenha write Setsenha;
   property nivel: integer read Fnivel write Setnivel;

end;

implementation

{ TUsuario }

procedure TUsuario.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TUsuario.Setlogin(const Value: string);
begin
  Flogin := Value;
end;

procedure TUsuario.Setnivel(const Value: integer);
begin
  Fnivel := Value;
end;

procedure TUsuario.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TUsuario.Setsenha(const Value: string);
begin
  Fsenha := Value;
end;

end.
