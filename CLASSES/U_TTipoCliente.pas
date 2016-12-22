unit U_TTipoCliente;

interface
  type
     TTipoCliente = class
  private
    Fdescricao: string;
    Fcodigo: Integer;
    procedure Setcodigo(const Value: Integer);
    procedure Setdescricao(const Value: string);
  public
    property codigo:Integer read Fcodigo write Setcodigo;
    property descricao :string read Fdescricao write Setdescricao;
  end;
implementation

{ TTipoCliente }

procedure TTipoCliente.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TTipoCliente.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

end.
