unit U_TCliente;

interface

uses
  U_TEndereco, U_TTipoCliente;

type TCliente = class

  private
    Fid: Integer;
    Femail: string;
    Fnome: string;
    Fendereco: TEndereco;
    FtelefoneFixo: string;
    Frg: string;
    Fcpf: string;
    Fcnh: string;
    FtelefoneCelular: string;
    FtipoCliente: TTipoCliente;
    procedure Setid(const Value: Integer);
    procedure Setemail(const Value: string);
    procedure Setnome(const Value: string);
    procedure Setendereco(const Value: TEndereco);
    procedure SetCnh(const Value: string);
    procedure Setcpf(const Value: string);
    procedure Setrg(const Value: string);
    procedure SettelefoneCelular(const Value: string);
    procedure SettelefoneFixo(const Value: string);
    procedure SettipoCliente(const Value: TTipoCliente);
  public
    property id:Integer read Fid write Setid;
    property nome:string read Fnome write Setnome;
    property endereco:TEndereco read Fendereco write Setendereco;
    property cnh:string read Fcnh write SetCnh;
    property cpf:string read Fcpf write Setcpf;
    property rg:string read Frg write Setrg;
    property telefoneFixo:string read FtelefoneFixo write SettelefoneFixo;
    property telefoneCelular:string read FtelefoneCelular write SettelefoneCelular;
    property email:string read Femail write Setemail;
    property tipoCliente:TTipoCliente read FtipoCliente write SettipoCliente;

end;

implementation

{ Cliente }



{ TCliente }

procedure TCliente.SetCnh(const Value: string);
begin
  Fcnh := Value;
end;

procedure TCliente.Setcpf(const Value: string);
begin
  Fcpf := Value;
end;


procedure TCliente.Setemail(const Value: string);
begin
   FEmail := Value;
end;

procedure TCliente.Setendereco(const Value: TEndereco);
begin
  FEndereco := Value;
end;

procedure TCliente.Setid(const Value: Integer);
begin
   Fid := Value;
end;

procedure TCliente.Setnome(const Value: string);
begin
   Fnome := Value;
end;

procedure TCliente.Setrg(const Value: string);
begin
  Frg := Value;
end;

procedure TCliente.SettelefoneCelular(const Value: string);
begin
  FtelefoneCelular := Value;
end;

procedure TCliente.SettelefoneFixo(const Value: string);
begin
  FtelefoneFixo := Value;
end;

procedure TCliente.SettipoCliente(const Value: TTipoCliente);
begin
  FtipoCliente := Value;
end;

end.
