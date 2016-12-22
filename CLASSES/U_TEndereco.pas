unit U_TEndereco;

interface

type TEndereco = class

  private
    Fbairro: string;
    Fuf: string;
    Fcep: string;
    Fid: integer;
    Fnumero: string;
    Fcomplemento: string;
    Fcidade: String;
    Frua: string;
    procedure Setbairro(const Value: string);
    procedure Setcep(const Value: string);
    procedure Setcidade(const Value: String);
    procedure Setcomplemento(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setnumero(const Value: string);
    procedure Setrua(const Value: string);
    procedure Setuf(const Value: string);

  public
    property id:integer read Fid write Setid;
    property rua:string read Frua write Setrua;
    property numero:string read Fnumero write Setnumero;
    property complemento:string read Fcomplemento write Setcomplemento;
    property bairro:string read Fbairro write Setbairro;
    property cidade:String read Fcidade write Setcidade;
    property uf:string read Fuf write Setuf;
    property cep:string read Fcep write Setcep;
end;

implementation

{ TEndereco }

procedure TEndereco.Setbairro(const Value: string);
begin
  Fbairro := Value;
end;

procedure TEndereco.Setcep(const Value: string);
begin
  Fcep := Value;
end;

procedure TEndereco.Setcidade(const Value: String);
begin
  Fcidade := Value;
end;

procedure TEndereco.Setcomplemento(const Value: string);
begin
  Fcomplemento := Value;
end;

procedure TEndereco.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TEndereco.Setnumero(const Value: string);
begin
  Fnumero := Value;
end;

procedure TEndereco.Setrua(const Value: string);
begin
  Frua := Value;
end;

procedure TEndereco.Setuf(const Value: string);
begin
  Fuf := Value;
end;

end.
