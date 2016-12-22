unit U_DtmDadosCliente;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB,U_TCliente;

type
  TDtmDadosCliente = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisanome: TStringField;
    cdsPesquisacpf_cnpj: TStringField;
    cdsPesquisacnh: TStringField;
    cdsPesquisarg: TStringField;
    cdsPesquisalogradouro: TStringField;
    cdsPesquisanumero: TStringField;
    cdsPesquisacidade: TStringField;
    cdsPesquisabairro: TStringField;
    cdsPesquisauf: TStringField;
    cdsPesquisacep: TStringField;
    cdsPesquisatelefone_fixo: TStringField;
    cdsPesquisatelefone_celular: TStringField;
    cdsPesquisaemail: TStringField;
    cdsPesquisacpf_cnpj_formatado: TStringField;
    cdsPesquisacod_tipo_cliente: TIntegerField;
    procedure cdsPesquisaCalcFields(DataSet: TDataSet);
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ICodigo:Integer);
    procedure salvar(Cliente:TCliente);
    procedure listar;
    procedure listarCompradores;
    function CPFCNPJExiste(sCPFCNPJ: string; iCodigo:integer): Boolean;
  end;

var
  DtmDadosCliente: TDtmDadosCliente;

const
  // SCRIPTS

  SQL_DELETE_CLIENTE_PARAM_CODIGO =
  ' DELETE FROM CLIENTE WHERE CODIGO = :CODIGO ';

  SQL_SELECT_CLIENTES =
  ' SELECT * FROM CLIENTE ';

  SQL_SELECT_CLIENTES_COMPRADORES =
 ' SELECT CLI.* FROM CLIENTE CLI                                    '#13+
 ' INNER JOIN TIPO_CLIENTE TP ON (CLI.COD_TIPO_CLIENTE = TP.CODIGO) '#13+
 ' WHERE TP.DESCRICAO IN (''COMPRADOR'',''AMBOS'')                  '#13+
 ' ORDER BY NOME                                                    ';

  SQL_INSERT_CLIENTE =
 ' INSERT INTO cliente(                                                 '+#13+
 '         NOME, CPF_CNPJ, CNH, RG, LOGRADOURO, NUMERO, CIDADE,         '+#13+
 '        BAIRRO, UF, CEP, TELEFONE_FIXO, TELEFONE_CELULAR, EMAIL, COD_TIPO_CLIENTE)      '+#13+
 '   VALUES (                                                           '+#13+
 '      :NOME, :CPF_CNPJ, :CNH, :RG, :LOGRADOURO, :NUMERO, :CIDADE,     '+#13+
 '      :BAIRRO, :UF, :CEP, :TELEFONE_FIXO, :TELEFONE_CELULAR, :EMAIL, :COD_TIPO_CLIENTE); ';

 SQL_UPDATE_CLIENTE =
' UPDATE cliente                                              '+#13+
'   SET  NOME=:NOME, CPF_CNPJ=:CPF_CNPJ, CNH=:CNH, RG=:RG,    '+#13+
'       LOGRADOURO=:LOGRADOURO, NUMERO=:NUMERO,               '+#13+
'       CIDADE=:CIDADE, BAIRRO=:BAIRRO, UF=:UF, CEP=:CEP,     '+#13+
'       TELEFONE_FIXO=:TELEFONE_FIXO,                         '+#13+
'       TELEFONE_CELULAR=:TELEFONE_CELULAR,                   '+#13+
'       EMAIL=:EMAIL,                                         '+#13+
'       COD_TIPO_CLIENTE = :COD_TIPO_CLIENTE                  '+#13+
' WHERE CODIGO = :CODIGO                                      ';
// campos
CODIGO           = 'CODIGO';
NOME             = 'NOME';
CPF_CNPJ         = 'CPF_CNPJ';
CNH              = 'CNH';
RG               = 'RG';
LOGRADOURO       = 'LOGRADOURO';
NUMERO           = 'NUMERO';
CIDADE           = 'CIDADE';
BAIRRO           = 'BAIRRO';
UF               = 'UF';
CEP              = 'CEP';
TELEFONE_FIXO    = 'TELEFONE_FIXO';
TELEFONE_CELULAR = 'TELEFONE_CELULAR';
EMAIL            = 'EMAIL';
COD_TIPO_CLIENTE = 'COD_TIPO_CLIENTE';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses U_BibliotecaFuncoes;



{$R *.dfm}

{ TDtmDadosCliente }

procedure TDtmDadosCliente.cdsPesquisaCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsPesquisacpf_cnpj_formatado.AsString := FormataMascaraCPForCNPJ(cdsPesquisacpf_cnpj.AsString);
end;

procedure TDtmDadosCliente.excluir(ICodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := SQL_DELETE_CLIENTE_PARAM_CODIGO;
    QryAux.Parameters.ParamByName(CODIGO).Value := ICodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

procedure TDtmDadosCliente.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := SQL_SELECT_CLIENTES+ '  ORDER BY NOME';
  cdsPesquisa.Open;
end;

procedure TDtmDadosCliente.listarCompradores;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := SQL_SELECT_CLIENTES_COMPRADORES;
  cdsPesquisa.Open;
end;

procedure TDtmDadosCliente.salvar(Cliente: TCliente);
begin
  try
    QryAux.Close;
    if Cliente.id > 0 then
    begin
      QryAux.SQL.Text := SQL_UPDATE_CLIENTE;
      QryAux.Parameters.ParamByName(CODIGO).Value := Cliente.id;
    end
    else
      QryAux.SQL.Text :=
       ' INSERT INTO cliente(                                                   '#13+
       '         nome, cpf_cnpj, cnh, rg, logradouro, numero, cidade,           '#13+
       '         bairro, uf, cep, telefone_fixo, telefone_celular, email, cod_tipo_cliente)       '#13+
       ' VALUES (:nome, :cpf_cnpj, :cnh, :rg, :logradouro, :numero, :cidade,    '#13+
       '         :bairro, :uf, :cep, :telefone_fixo, :telefone_celular, :email, :cod_tipo_cliente) ';

    QryAux.Parameters.ParamByName('nome').Value             := Cliente.nome;
    QryAux.Parameters.ParamByName('cpf_cnpj').Value         := Cliente.cpf;
    QryAux.Parameters.ParamByName('cnh').Value              := Cliente.cnh;
    QryAux.Parameters.ParamByName('rg').Value               := Cliente.rg;
    QryAux.Parameters.ParamByName('logradouro').Value       := Cliente.endereco.rua;
    QryAux.Parameters.ParamByName('numero').Value           := Cliente.endereco.numero;
    QryAux.Parameters.ParamByName('cidade').Value           := Cliente.endereco.cidade;
    QryAux.Parameters.ParamByName('bairro').Value           := Cliente.endereco.bairro;
    QryAux.Parameters.ParamByName('uf').Value               := Cliente.endereco.uf;
    QryAux.Parameters.ParamByName('cep').Value              := Cliente.endereco.cep;
    QryAux.Parameters.ParamByName('telefone_fixo').Value    := Cliente.telefoneFixo;
    QryAux.Parameters.ParamByName('telefone_celular').Value := Cliente.telefoneCelular;
    QryAux.Parameters.ParamByName('email').Value            := Cliente.email;
    QryAux.Parameters.ParamByName('cod_tipo_cliente').Value := Cliente.tipoCliente.codigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;


function TDtmDadosCliente.CPFCNPJExiste(sCPFCNPJ: string; iCodigo:integer): Boolean;
begin
   Result := False;
   try
      QryAux.Close;
      QryAux.SQL.Text :=
      ' SELECT CPF_CNPJ FROM CLIENTE WHERE CPF_CNPJ = :CPF_CNPJ AND CODIGO <> :CODIGO ' ;
      QryAux.Parameters.ParamByName(CPF_CNPJ).Value := sCPFCNPJ;
      QryAux.Parameters.ParamByName(CODIGO).Value  := iCodigo;
      QryAux.Open;
      Result := not QryAux.IsEmpty;
   except
      raise;
   end;
end;

end.
