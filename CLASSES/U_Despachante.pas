unit U_Despachante;

interface
  uses
     U_Endereco;

type TDespachante = class
    private
      Fid: Integer;
      Fnome: string;
    FEndereco: TEndereco;
      procedure Setid(const Value: Integer);
      procedure Setnome(const Value: string);
    procedure SetEndereco(const Value: TEndereco);
    public
      property id:Integer read Fid write Setid;
      property nome:string read Fnome write Setnome;
      property Endereco:TEndereco read FEndereco write SetEndereco;
end;

implementation

{ TDespachante }

procedure TDespachante.SetEndereco(const Value: Endereco);
begin
  FEndereco := Value;
end;

procedure TDespachante.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TDespachante.Setnome(const Value: string);
begin
  Fnome := Value;
end;

end.
