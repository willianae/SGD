unit U_TSeguradora;

interface

type TSeguradora = class
  private
    Fdescricao: string;
    Fcodigo: integer;
    procedure Setcodigo(const Value: integer);
    procedure Setdescricao(const Value: string);

  public
    property codigo:integer read Fcodigo write Setcodigo;
    property descricao:string read Fdescricao write Setdescricao;
end;

implementation

{ TSeguradora }

procedure TSeguradora.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TSeguradora.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

end.
