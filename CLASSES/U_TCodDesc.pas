unit U_TCodDesc;

interface

type TCodDesc = class
  private
    Fdescricao: string;
    Fcodigo: integer;
    procedure Setcodigo(const Value: integer);
    procedure Setdescricao(const Value: string);

  public
    property codigo:integer read Fcodigo write Setcodigo;
    property descricao:string read Fdescricao write Setdescricao;
    constructor Create(ACodigo:integer; ADescricao:string);
end;

implementation

{ TCodDesc }

constructor TCodDesc.Create(ACodigo: integer; ADescricao: string);
begin
  Fcodigo := ACodigo;
  Fdescricao := ADescricao;
end;

procedure TCodDesc.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TCodDesc.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

end.
