unit U_TServico;

interface

uses
  U_TVeiculo, U_TTipoServico, U_TUsuario, U_TSituacao;

type TServico = class
  private
    Fvalor: Double;
    Fcodigo: integer;
    Ftipo_servico: TTipoServico;
    Fveiculo: TVeiculo;
    Fusuario: TUsuario;
    Fsituacao: TSituacao;
    procedure Setcodigo(const Value: integer);
    procedure Settipo_servico(const Value: TTipoServico);
    procedure Setvalor(const Value: Double);
    procedure Setveiculo(const Value: TVeiculo);
    procedure Setusuario(const Value: TUsuario);
    procedure Setsituacao(const Value: TSituacao);

  public
    property codigo: integer read Fcodigo write Setcodigo;
    property valor:Double read Fvalor write Setvalor;
    property situacao: TSituacao read Fsituacao write Setsituacao;
    property veiculo: TVeiculo read Fveiculo write Setveiculo;
    property tipo_servico: TTipoServico read Ftipo_servico write Settipo_servico;
    property usuario: TUsuario read Fusuario write Setusuario;

    constructor Create;
    destructor Destroy; override;

end;

implementation

{ TServico }

constructor TServico.Create;
begin
  veiculo      := TVeiculo.Create;
  tipo_servico := TTipoServico.Create;
  usuario      := TUsuario.Create;
  situacao     := TSituacao.Create;
end;

destructor TServico.Destroy;
begin
  veiculo.Free;
  veiculo := nil;

  tipo_servico.Free;
  tipo_servico := nil;

  usuario.Free;
  usuario := nil;

  situacao.Free;
  situacao := nil;
end;

procedure TServico.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;


procedure TServico.Setsituacao(const Value: TSituacao);
begin
  Fsituacao := Value;
end;

procedure TServico.Settipo_servico(const Value: TTipoServico);
begin
  Ftipo_servico := Value;
end;

procedure TServico.Setusuario(const Value: TUsuario);
begin
  Fusuario := Value;
end;

procedure TServico.Setvalor(const Value: Double);
begin
  Fvalor := Value;
end;

procedure TServico.Setveiculo(const Value: TVeiculo);
begin
  Fveiculo := Value;
end;

end.
