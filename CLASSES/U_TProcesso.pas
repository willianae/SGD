unit U_TProcesso;

interface

type TProcesso = class
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

{ TProcesso }

procedure TProcesso.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TProcesso.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

end.
