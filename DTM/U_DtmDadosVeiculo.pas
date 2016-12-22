unit U_DtmDadosVeiculo;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TVeiculo, System.Variants, U_TProcesso;

type
  TDtmDadosVeiculo = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisauf: TStringField;
    cdsPesquisanumero: TStringField;
    cdsPesquisarenavam: TStringField;
    cdsPesquisaplaca: TStringField;
    cdsPesquisachassi: TStringField;
    cdsPesquisaano_fabricacao: TIntegerField;
    cdsPesquisaano_modelo: TIntegerField;
    cdsPesquisamotor: TStringField;
    cdsPesquisaobservacoes: TStringField;
    cdsPesquisacod_cliente: TIntegerField;
    cdsPesquisacod_tipo: TIntegerField;
    cdsPesquisacod_marca_modelo: TIntegerField;
    cdsPesquisacod_combustivel: TIntegerField;
    cdsPesquisacod_categoria: TIntegerField;
    cdsPesquisacod_cor: TIntegerField;
    cdsPesquisanome: TStringField;
    cdsPesquisacpf_cnpj: TStringField;
    cdsPesquisacod_processo: TIntegerField;
    cdsPesquisanumero_sinistro: TStringField;
    cdsPesquisacod_usuario: TIntegerField;
    cdsPesquisaprocesso: TStringField;
    cdsPesquisadata_emissao_crv: TDateField;
    cdsPesquisadata_recebimento: TDateField;
    cdsPesquisaflg_possui_sinistro: TStringField;
    cdsPesquisaflg_recebeu_csv: TStringField;
    cdsPesquisanome_comprador: TStringField;
    cdsPesquisacod_comprador: TIntegerField;
    cdsPesquisacomprador: TStringField;
    cdsPesquisaDOC_COMPRADOR: TStringField;
    cdsPesquisaNUMERO_CONVOCACAO: TIntegerField;
    cdsPesquisaDATA_CONVOCACAO: TDateField;
    cdsPesquisaCOD_SEGURADORA: TIntegerField;
    cdsPesquisaSEGURADORA: TStringField;
    cdsPesquisaQTD_REGISTROS: TLargeintField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo: Integer);
    procedure salvar(AVeiculo: TVeiculo);
    procedure listar(APlaca: string = ''; ACliente: string = '');
    function getVeiculoPelaPlaca(APlaca: string): TVeiculo;
    function getQtdRegistros:integer;
    // function existeServicoVinculado(ACodVeiculo:integer):boolean;
    function getNomeClientePorCPFCNPJ(sCPFCNPJ: String;
      var iCodigo: Integer; iTipoCliente:integer = 0): string;
    function placaUFJaExiste(sPlaca, sUF: String; iCodigo: Integer): Boolean;
  end;

var
  DtmDadosVeiculo: TDtmDadosVeiculo;

implementation

uses
  U_DtmConexao;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TDtmDadosVeiculo }

{ TDtmDadosVeiculo }

procedure TDtmDadosVeiculo.DataModuleCreate(Sender: TObject);
begin
  inherited;
  // listar;
end;

procedure TDtmDadosVeiculo.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM Veiculo WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

function TDtmDadosVeiculo.getNomeClientePorCPFCNPJ(sCPFCNPJ: String;
  var iCodigo: Integer; iTipoCliente:integer = 0): string;
begin
  try
    //iTipoCliente = 1 (VENDEDOR)
    //iTipoCliente = 2 (COMPRADOR)
    //iTipoCliente = 3 (AMBOS)
    //iTipoCliente = 4 (COMPRADOR, AMBOS)

    QryAux.Close;
    QryAux.SQL.Text :=
      ' SELECT CLI.NOME,CLI.CODIGO FROM CLIENTE CLI '+
      ' INNER JOIN TIPO_CLIENTE TP ON (TP.CODIGO = CLI.COD_TIPO_CLIENTE) '+
      ' WHERE CLI.CPF_CNPJ = :CPF_CNPJ ';

    if iTipoCliente = 1 then
      QryAux.SQL.Add(' AND TP.DESCRICAO = ''VENDEDOR'' ')
    else
    if iTipoCliente = 2 then
      QryAux.SQL.Add(' AND TP.DESCRICAO = ''COMPRADOR'' ')
    else
    if iTipoCliente = 3 then
      QryAux.SQL.Add(' AND TP.DESCRICAO = ''AMBOS'' ')
    else
    if iTipoCliente = 4 then
      QryAux.SQL.Add(' AND TP.DESCRICAO IN (''COMPRADOR'', ''AMBOS'') ');

    QryAux.Parameters.ParamByName('CPF_CNPJ').Value := sCPFCNPJ;
    QryAux.Open;
    Result := QryAux.FieldByName('NOME').AsString;
    iCodigo := QryAux.FieldByName('codigo').AsInteger
  except
    raise;
  end;
end;

function TDtmDadosVeiculo.getQtdRegistros: integer;
begin
  if cdsPesquisa.IsEmpty then
    Result := 0
  else
    Result := cdsPesquisaqtd_registros.AsInteger;
end;

function TDtmDadosVeiculo.getVeiculoPelaPlaca(APlaca: string): TVeiculo;
begin
  QryAux.Close;
  QryAux.SQL.Text :=
    ' SELECT V.*, C.NOME, M.DESCRICAO MARCA, CO.NOME COMPRADOR, CO.CPF_CNPJ DOC_COMPRADOR FROM VEICULO V        '#13
    + ' LEFT JOIN CLIENTE CO ON CO.CODIGO = V.COD_COMPRADOR        '#13 +
    ' LEFT JOIN CLIENTE C ON C.CODIGO = V.COD_CLIENTE             '#13 +
    ' LEFT JOIN MARCA_MODELO M ON (V.COD_MARCA_MODELO = M.CODIGO) ' + #13 +
    ' WHERE PLACA = :PLACA                                        ';
  QryAux.Parameters.ParamByName('PLACA').Value := APlaca;
  QryAux.Open;
  if QryAux.IsEmpty then
    Result := nil
  else
  begin
    Result := TVeiculo.Create;
    Result.codigo := QryAux.FieldByName('CODIGO').AsInteger;
    Result.cliente.id := QryAux.FieldByName('COD_CLIENTE').AsInteger;
    Result.cliente.nome := QryAux.FieldByName('NOME').AsString;
    Result.placa := QryAux.FieldByName('PLACA').AsString;
    Result.uf := QryAux.FieldByName('UF').AsString;
    Result.marca_modelo.descricao := QryAux.FieldByName('MARCA').AsString;
    Result.ano_fabricacao := QryAux.FieldByName('ANO_FABRICACAO').AsInteger;
    Result.ano_modelo := QryAux.FieldByName('ANO_MODELO').AsInteger;
  end;
end;

procedure TDtmDadosVeiculo.listar(APlaca: string = ''; ACliente: string = '');
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text :=
    ' SELECT V.*, C.NOME, C.CPF_CNPJ, P.DESCRICAO PROCESSO, CO.NOME COMPRADOR, CO.CPF_CNPJ DOC_COMPRADOR, '#13
    + ' S.DESCRICAO SEGURADORA, COUNT(*) OVER() QTD_REGISTROS                                             '#13
    + ' FROM VEICULO V                                                      '#13
    + ' INNER JOIN CLIENTE C ON (V.COD_CLIENTE = C.CODIGO)                  '#13
    + ' LEFT JOIN CLIENTE CO ON (V.COD_COMPRADOR = CO.CODIGO)               '#13
    + ' LEFT JOIN PROCESSO P ON (P.CODIGO = V.COD_PROCESSO)                 '#13
    + ' LEFT JOIN SEGURADORA S ON ( V.COD_SEGURADORA = S.CODIGO )           '#13
    + ' WHERE 1 = 1                                                         ';
  if Trim(StringReplace(APlaca, '-', '', [rfReplaceAll])) <> '' then
    QryPesquisa.SQL.Add(' AND V.PLACA LIKE ''%' + StringReplace(APlaca, ' ',
      '_', [rfReplaceAll]) + '%''');

  if Trim(ACliente) <> '' then
    QryPesquisa.SQL.Add(' AND C.NOME LIKE ''%' + ACliente + '%''');

  QryPesquisa.SQL.Add(' ORDER BY V.PLACA ');

  cdsPesquisa.Open;
end;

function TDtmDadosVeiculo.placaUFJaExiste(sPlaca, sUF: String;
  iCodigo: Integer): Boolean;
begin
  try
    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add
      (' SELECT PLACA FROM VEICULO WHERE PLACA = :PLACA AND UF = :UF ');
    if (iCodigo <> 0) then
    begin
      QryAux.SQL.Add(' AND ' +
        ' CODIGO <> :CODIGO                                            ');
      QryAux.Parameters.ParamByName('CODIGO').Value := iCodigo;
    end;
    QryAux.Parameters.ParamByName('PLACA').Value := sPlaca;
    QryAux.Parameters.ParamByName('UF').Value := sUF;

    QryAux.Open;
    Result := not QryAux.IsEmpty;
  except
    raise;
  end;
end;

procedure TDtmDadosVeiculo.salvar(AVeiculo: TVeiculo);
begin
  try
    QryAux.Close;
    if AVeiculo.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE VEICULO           '#13 +
        '  SET UF=:UF,                              '#13 +
        '  NUMERO=:NUMERO,                          '#13 +
        '  RENAVAM=:RENAVAM,                        '#13 +
        '  PLACA=:PLACA,                            '#13 +
        '  CHASSI=:CHASSI,                          '#13 +
        '  ANO_FABRICACAO=:ANO_FABRICACAO,          '#13 +
        '  ANO_MODELO=:ANO_MODELO,                  '#13 +
        '  MOTOR=:MOTOR,                            '#13 +
        '  NUMERO_SINISTRO=:NUMERO_SINISTRO,        '#13 +
        '  OBSERVACOES=:OBSERVACOES,                '#13 +
        '  COD_CLIENTE=:COD_CLIENTE,                '#13 +
        '  COD_TIPO=:COD_TIPO,                      '#13 +
        '  COD_MARCA_MODELO=:COD_MARCA_MODELO,      '#13 +
        '  COD_COMBUSTIVEL=:COD_COMBUSTIVEL,        '#13 +
        '  COD_CATEGORIA=:COD_CATEGORIA,            '#13 +
        '  COD_COR=:COD_COR,                        '#13 +
        '  COD_PROCESSO=:COD_PROCESSO,              '#13 +
        '  COD_USUARIO=:COD_USUARIO,                '#13 +
        '  DATA_EMISSAO_CRV=:DATA_EMISSAO_CRV,      '#13 +
        '  DATA_RECEBIMENTO=:DATA_RECEBIMENTO,      '#13 +
        '  FLG_POSSUI_SINISTRO=:FLG_POSSUI_SINISTRO,'#13 +
        '  FLG_RECEBEU_CSV=:FLG_RECEBEU_CSV,        '#13 +
        '  NOME_COMPRADOR=:NOME_COMPRADOR,          '#13 +
        '  COD_COMPRADOR = :COD_COMPRADOR,          '#13 +
        '  NUMERO_CONVOCACAO = :NUMERO_CONVOCACAO,   '#13 +
        '  COD_SEGURADORA    = :COD_SEGURADORA,      '#13 +
        '  DATA_CONVOCACAO   = :DATA_CONVOCACAO     '#13 +
        ' WHERE CODIGO = :COD                       ';
      QryAux.Parameters.ParamByName('COD').Value := AVeiculo.codigo;
    end
    else
    begin
      QryAux.SQL.Text :=
        ' INSERT INTO VEICULO(                                                                                  '#13
        + '       UF, NUMERO, RENAVAM, PLACA, CHASSI, ANO_FABRICACAO,                                             '#13
        + '       ANO_MODELO, MOTOR, OBSERVACOES, COD_CLIENTE, COD_TIPO, COD_MARCA_MODELO,                        '#13
        + '       COD_COMBUSTIVEL, COD_CATEGORIA, COD_COR, NUMERO_SINISTRO, COD_PROCESSO, COD_USUARIO,            '#13
        + '       DATA_EMISSAO_CRV, DATA_RECEBIMENTO, FLG_POSSUI_SINISTRO, FLG_RECEBEU_CSV, NOME_COMPRADOR,COD_COMPRADOR, NUMERO_CONVOCACAO, COD_SEGURADORA, DATA_CONVOCACAO)  '#13
        + ' VALUES (:UF, :NUMERO, :RENAVAM, :PLACA, :CHASSI, :ANO_FABRICACAO,                                     '#13
        + '       :ANO_MODELO, :MOTOR, :OBSERVACOES, :COD_CLIENTE, :COD_TIPO, :COD_MARCA_MODELO,                  '#13
        + '       :COD_COMBUSTIVEL, :COD_CATEGORIA, :COD_COR, :NUMERO_SINISTRO, :COD_PROCESSO, :COD_USUARIO,      '#13
        + '       :DATA_EMISSAO_CRV, :DATA_RECEBIMENTO, :FLG_POSSUI_SINISTRO, :FLG_RECEBEU_CSV, :NOME_COMPRADOR,:COD_COMPRADOR, :NUMERO_CONVOCACAO, :COD_SEGURADORA, :DATA_CONVOCACAO); ';
    end;

    QryAux.Parameters.ParamByName('UF').Value := AVeiculo.uf;
    QryAux.Parameters.ParamByName('NUMERO').Value := AVeiculo.numero;
    QryAux.Parameters.ParamByName('RENAVAM').Value := AVeiculo.renavam;
    QryAux.Parameters.ParamByName('PLACA').Value := AVeiculo.placa;
    QryAux.Parameters.ParamByName('CHASSI').Value := AVeiculo.chassi;

    if AVeiculo.ano_fabricacao = 0 then
    begin
      QryAux.Parameters.ParamByName('ANO_FABRICACAO').DataType := ftInteger;
      QryAux.Parameters.ParamByName('ANO_FABRICACAO').Value := Unassigned;
    end
    else
      QryAux.Parameters.ParamByName('ANO_FABRICACAO').Value :=
        AVeiculo.ano_fabricacao;

    if AVeiculo.ano_modelo = 0 then
    begin
      QryAux.Parameters.ParamByName('ANO_MODELO').DataType := ftInteger;
      QryAux.Parameters.ParamByName('ANO_MODELO').Value := Unassigned;
    end
    else
      QryAux.Parameters.ParamByName('ANO_MODELO').Value := AVeiculo.ano_modelo;

    QryAux.Parameters.ParamByName('MOTOR').Value := AVeiculo.motor;
    QryAux.Parameters.ParamByName('OBSERVACOES').Value := AVeiculo.observacoes;
    QryAux.Parameters.ParamByName('NUMERO_SINISTRO').Value :=
      AVeiculo.numeroSinistro;
    QryAux.Parameters.ParamByName('COD_CLIENTE').Value := AVeiculo.cliente.id;

    if AVeiculo.tipo.codigo > -1 then
      QryAux.Parameters.ParamByName('COD_TIPO').Value := AVeiculo.tipo.codigo
    else
    begin
      QryAux.Parameters.ParamByName('COD_TIPO').DataType := ftInteger;
      QryAux.Parameters.ParamByName('COD_TIPO').Value := Unassigned;
    end;

    if AVeiculo.marca_modelo.codigo > 0 then
      QryAux.Parameters.ParamByName('COD_MARCA_MODELO').Value :=
        AVeiculo.marca_modelo.codigo
    else
    begin
      QryAux.Parameters.ParamByName('COD_MARCA_MODELO').DataType := ftInteger;
      QryAux.Parameters.ParamByName('COD_MARCA_MODELO').Value := Unassigned;
    end;

    if AVeiculo.combustivel.codigo > -1 then
      QryAux.Parameters.ParamByName('COD_COMBUSTIVEL').Value :=
        AVeiculo.combustivel.codigo
    else
    begin
      QryAux.Parameters.ParamByName('COD_COMBUSTIVEL').DataType := ftInteger;
      QryAux.Parameters.ParamByName('COD_COMBUSTIVEL').Value := Unassigned;
    end;

    if AVeiculo.categoria.codigo > -1 then
      QryAux.Parameters.ParamByName('COD_CATEGORIA').Value :=
        AVeiculo.categoria.codigo
    else
    begin
      QryAux.Parameters.ParamByName('COD_CATEGORIA').DataType := ftInteger;
      QryAux.Parameters.ParamByName('COD_CATEGORIA').Value := Unassigned;
    end;

    if AVeiculo.cor.codigo > -1 then
      QryAux.Parameters.ParamByName('COD_COR').Value := AVeiculo.cor.codigo
    else
    begin
      QryAux.Parameters.ParamByName('COD_COR').DataType := ftInteger;
      QryAux.Parameters.ParamByName('COD_COR').Value := Unassigned;
    end;

    if AVeiculo.processo.codigo > -1 then
      QryAux.Parameters.ParamByName('COD_PROCESSO').Value :=
        AVeiculo.processo.codigo
    else
    begin
      QryAux.Parameters.ParamByName('COD_PROCESSO').DataType := ftInteger;
      QryAux.Parameters.ParamByName('COD_PROCESSO').Value := Unassigned;
    end;

    QryAux.Parameters.ParamByName('COD_USUARIO').Value :=
      DtmConexao.UsuarioLogado.codigo;

    if AVeiculo.data_emissao > 0 then
      QryAux.Parameters.ParamByName('DATA_EMISSAO_CRV').Value :=
        FormatDateTime('dd/mm/yyyy', AVeiculo.data_emissao)
    else
    begin
      QryAux.Parameters.ParamByName('DATA_EMISSAO_CRV').DataType := ftDate;
      QryAux.Parameters.ParamByName('DATA_EMISSAO_CRV').Value := Unassigned;
    end;

    if AVeiculo.data_recebimento > 0 then
      QryAux.Parameters.ParamByName('DATA_RECEBIMENTO').Value :=
        FormatDateTime('dd/mm/yyyy', AVeiculo.data_recebimento)
    else
    begin
      QryAux.Parameters.ParamByName('DATA_RECEBIMENTO').DataType := ftDate;
      QryAux.Parameters.ParamByName('DATA_RECEBIMENTO').Value := Unassigned;
    end;

    QryAux.Parameters.ParamByName('FLG_POSSUI_SINISTRO').Value :=
      AVeiculo.possui_sinistro;
    QryAux.Parameters.ParamByName('FLG_RECEBEU_CSV').Value :=
      AVeiculo.recebeu_csv;
    // se possuir o comprador limpa do banco o antigo e atribui  o novo
    if AVeiculo.Comprador.id > 0 then
    begin
      QryAux.Parameters.ParamByName('COD_COMPRADOR').Value :=
        AVeiculo.Comprador.id;
      QryAux.Parameters.ParamByName('NOME_COMPRADOR').DataType := ftString;
      QryAux.Parameters.ParamByName('NOME_COMPRADOR').Value := Unassigned;
    end
    else
    begin
      // caso contrario limpra o codigo comprador e mantem o antigo
      QryAux.Parameters.ParamByName('COD_COMPRADOR').DataType := ftInteger;
      QryAux.Parameters.ParamByName('COD_COMPRADOR').Value    := Unassigned;
      QryAux.Parameters.ParamByName('NOME_COMPRADOR').Value   := AVeiculo.nome_comprador;
    end;

    if AVeiculo.numero_convocacao > 0 then
    begin
      QryAux.Parameters.ParamByName('NUMERO_CONVOCACAO').Value :=
        AVeiculo.numero_convocacao
    end
    else
    begin
      QryAux.Parameters.ParamByName('NUMERO_CONVOCACAO').DataType := ftInteger;
      QryAux.Parameters.ParamByName('NUMERO_CONVOCACAO').Value := Unassigned;
    end;

    if AVeiculo.data_convocacao > 0 then
    begin
      QryAux.Parameters.ParamByName('DATA_CONVOCACAO').Value :=
        FormatDateTime('dd/mm/yyyy', AVeiculo.data_convocacao)
    end
    else
    begin
      QryAux.Parameters.ParamByName('DATA_CONVOCACAO').DataType := ftDate;
      QryAux.Parameters.ParamByName('DATA_CONVOCACAO').Value := Unassigned;
    end;

    if AVeiculo.cod_seguradora > 0 then
    begin
      QryAux.Parameters.ParamByName('COD_SEGURADORA').Value :=
        AVeiculo.cod_seguradora
    end
    else
    begin
      QryAux.Parameters.ParamByName('COD_SEGURADORA').DataType := ftInteger;
      QryAux.Parameters.ParamByName('COD_SEGURADORA').Value := Unassigned;
    end;

    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
