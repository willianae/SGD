unit U_TSituacao;

interface

type TSituacao = class
  private
    Fdescricao: string;
    Fcodigo: integer;
    Fcolor: string;
    procedure Setcodigo(const Value: integer);
    procedure Setdescricao(const Value: string);
    procedure Setcolor(const Value: string);

  public
    property codigo:integer read Fcodigo write Setcodigo;
    property descricao:string read Fdescricao write Setdescricao;
    property color:string read Fcolor write Setcolor;
end;

implementation

{ TSituacao }

procedure TSituacao.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TSituacao.Setcolor(const Value: string);
begin
  Fcolor := Value;
end;

procedure TSituacao.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

end.
