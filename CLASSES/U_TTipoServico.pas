unit U_TTipoServico;

interface

type TTipoServico = class
  private
    Fdescricao: string;
    Fcodigo: integer;
    Ftaxa_detran: double;
    procedure Setcodigo(const Value: integer);
    procedure Setdescricao(const Value: string);
    procedure Settaxa_detran(const Value: double);

  public
    property codigo:integer read Fcodigo write Setcodigo;
    property descricao:string read Fdescricao write Setdescricao;
    property taxa_detran:double read Ftaxa_detran write Settaxa_detran;
end;

implementation

{ TTipoServico }

procedure TTipoServico.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TTipoServico.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TTipoServico.Settaxa_detran(const Value: double);
begin
  Ftaxa_detran := Value;
end;

end.
