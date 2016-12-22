unit U_TVeiculo;

interface

uses
  U_TCombustivel, U_TTipo, U_TCategoria, U_TMarcaModelo, U_TCor, U_TCliente,
  U_TProcesso,
  U_TComprador;

type
  TVeiculo = class
  private
    Fmotor: string;
    Fano_fabricacao: integer;
    Fcor: TCor;
    Fchassi: string;
    Fuf: string;
    Fcategoria: TCategoria;
    Fnumero: string;
    Fano_modelo: integer;
    Fplaca: string;
    Fmarca_modelo: TMarcaModelo;
    Fcombustivel: TCombustivel;
    Ftipo: TTipo;
    Frenavam: String;
    Fobservacoes: string;
    Fcodigo: integer;
    Fcliente: TCliente;
    FnumeroSinistro: string;
    Fprocesso: TProcesso;
    Fnome_comprador: String;
    Fdata_emissao: TDate;
    Fdata_recebimento: TDate;
    Fpossui_sinistro: string;
    Frecebeu_csv: string;
    FComprador: TComprador;
    Fdata_convocacao: TDate;
    Fcod_seguradora: integer;
    Fnumero_convocacao: integer;
    procedure Setano_fabricacao(const Value: integer);
    procedure Setano_modelo(const Value: integer);
    procedure Setcategoria(const Value: TCategoria);
    procedure Setchassi(const Value: string);
    procedure Setcombustivel(const Value: TCombustivel);
    procedure Setcor(const Value: TCor);
    procedure Setmarca_modelo(const Value: TMarcaModelo);
    procedure Setmotor(const Value: string);
    procedure Setnumero(const Value: string);
    procedure Setobservacoes(const Value: string);
    procedure Setplaca(const Value: string);
    procedure Setrenavam(const Value: String);
    procedure Settipo(const Value: TTipo);
    procedure Setuf(const Value: string);
    procedure Setcodigo(const Value: integer);
    procedure Setcliente(const Value: TCliente);
    procedure SetnumeroSinistro(const Value: string);
    procedure Setprocesso(const Value: TProcesso);
    procedure Setdata_emissao(const Value: TDate);
    procedure Setdata_recebimento(const Value: TDate);
    procedure Setnome_comprador(const Value: String);
    procedure Setpossui_sinistro(const Value: string);
    procedure Setrecebeu_csv(const Value: string);
    procedure SetComprador(const Value: TComprador);
    procedure Setcod_seguradora(const Value: integer);
    procedure Setdata_convocacao(const Value: TDate);
    procedure Setnumero_convocacao(const Value: integer);

  public
    property codigo: integer read Fcodigo write Setcodigo;
    property uf: string read Fuf write Setuf;
    property numero: string read Fnumero write Setnumero;
    property renavam: String read Frenavam write Setrenavam;
    property placa: string read Fplaca write Setplaca;
    property chassi: string read Fchassi write Setchassi;
    property ano_fabricacao: integer read Fano_fabricacao
      write Setano_fabricacao;
    property ano_modelo: integer read Fano_modelo write Setano_modelo;
    property motor: string read Fmotor write Setmotor;
    property tipo: TTipo read Ftipo write Settipo;
    property marca_modelo: TMarcaModelo read Fmarca_modelo
      write Setmarca_modelo;
    property combustivel: TCombustivel read Fcombustivel write Setcombustivel;
    property categoria: TCategoria read Fcategoria write Setcategoria;
    property cor: TCor read Fcor write Setcor;
    property cliente: TCliente read Fcliente write Setcliente;
    property observacoes: string read Fobservacoes write Setobservacoes;
    property numeroSinistro: string read FnumeroSinistro
      write SetnumeroSinistro;
    property processo: TProcesso read Fprocesso write Setprocesso;
    property data_emissao: TDate read Fdata_emissao write Setdata_emissao;
    property data_recebimento: TDate read Fdata_recebimento
      write Setdata_recebimento;
    property possui_sinistro: string read Fpossui_sinistro
      write Setpossui_sinistro;
    property recebeu_csv: string read Frecebeu_csv write Setrecebeu_csv;
    property nome_comprador: String read Fnome_comprador
      write Setnome_comprador;
    property Comprador: TComprador read FComprador write SetComprador;
    property numero_convocacao: integer read Fnumero_convocacao
      write Setnumero_convocacao;
    property cod_seguradora: integer read Fcod_seguradora
      write Setcod_seguradora;
    property data_convocacao: TDate read Fdata_convocacao
      write Setdata_convocacao;
    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TVeiculo }

constructor TVeiculo.Create;
begin
  tipo := TTipo.Create;
  marca_modelo := TMarcaModelo.Create;
  combustivel := TCombustivel.Create;
  categoria := TCategoria.Create;
  cor := TCor.Create;
  cliente := TCliente.Create;
  processo := TProcesso.Create;
end;

destructor TVeiculo.Destroy;
begin
  tipo.Free;
  tipo := nil;

  marca_modelo.Free;
  marca_modelo := nil;

  combustivel.Free;
  combustivel := nil;

  categoria.Free;
  categoria := nil;

  cor.Free;
  cor := nil;

  processo.Free;
  processo := nil;
end;

procedure TVeiculo.Setano_fabricacao(const Value: integer);
begin
  Fano_fabricacao := Value;
end;

procedure TVeiculo.Setano_modelo(const Value: integer);
begin
  Fano_modelo := Value;
end;

procedure TVeiculo.Setcategoria(const Value: TCategoria);
begin
  Fcategoria := Value;
end;

procedure TVeiculo.Setchassi(const Value: string);
begin
  Fchassi := Value;
end;

procedure TVeiculo.Setcliente(const Value: TCliente);
begin
  Fcliente := Value;
end;

procedure TVeiculo.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TVeiculo.Setcod_seguradora(const Value: integer);
begin
  Fcod_seguradora := Value;
end;

procedure TVeiculo.Setcombustivel(const Value: TCombustivel);
begin
  Fcombustivel := Value;
end;

procedure TVeiculo.SetComprador(const Value: TComprador);
begin
  FComprador := Value;
end;

procedure TVeiculo.Setcor(const Value: TCor);
begin
  Fcor := Value;
end;

procedure TVeiculo.Setdata_convocacao(const Value: TDate);
begin
  Fdata_convocacao := Value;
end;

procedure TVeiculo.Setdata_emissao(const Value: TDate);
begin
  Fdata_emissao := Value;
end;

procedure TVeiculo.Setdata_recebimento(const Value: TDate);
begin
  Fdata_recebimento := Value;
end;

procedure TVeiculo.Setmarca_modelo(const Value: TMarcaModelo);
begin
  Fmarca_modelo := Value;
end;

procedure TVeiculo.Setmotor(const Value: string);
begin
  Fmotor := Value;
end;

procedure TVeiculo.Setnome_comprador(const Value: String);
begin
  Fnome_comprador := Value;
end;

procedure TVeiculo.Setnumero(const Value: string);
begin
  Fnumero := Value;
end;

procedure TVeiculo.SetnumeroSinistro(const Value: string);
begin
  FnumeroSinistro := Value;
end;

procedure TVeiculo.Setnumero_convocacao(const Value: integer);
begin
  Fnumero_convocacao := Value;
end;

procedure TVeiculo.Setobservacoes(const Value: string);
begin
  Fobservacoes := Value;
end;

procedure TVeiculo.Setplaca(const Value: string);
begin
  Fplaca := Value;
end;

procedure TVeiculo.Setpossui_sinistro(const Value: string);
begin
  Fpossui_sinistro := Value;
end;

procedure TVeiculo.Setprocesso(const Value: TProcesso);
begin
  Fprocesso := Value;
end;

procedure TVeiculo.Setrecebeu_csv(const Value: string);
begin
  Frecebeu_csv := Value;
end;

procedure TVeiculo.Setrenavam(const Value: String);
begin
  Frenavam := Value;
end;

procedure TVeiculo.Settipo(const Value: TTipo);
begin
  Ftipo := Value;
end;

procedure TVeiculo.Setuf(const Value: string);
begin
  Fuf := Value;
end;

end.
