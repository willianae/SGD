unit U_DtmDadosServico;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TServico, U_BibliotecaFuncoes  ;

type
  TDtmDadosServico = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisacod_veiculo: TIntegerField;
    cdsPesquisacod_tipo_servico: TIntegerField;
    cdsPesquisavalor: TBCDField;
    cdsPesquisasituacao: TStringField;
    cdsPesquisaplaca: TStringField;
    cdsPesquisatipo_servico: TStringField;
    cdsPesquisacod_usuario: TIntegerField;
    QryAuxWeb: TADOQuery;
    cdsPesquisanome: TStringField;
    cdsPesquisasenha: TStringField;
    cdsPesquisacod_situacao: TIntegerField;
    cdsPesquisacolor: TStringField;
    cdsPesquisaqtd_registros: TLargeintField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure salvar(AServico: TServico);
    procedure listar(APlaca:string = ''; ASituacao:string=''; ACodTipoServico:Integer=-1; ACliente:string='');
    function getQtdRegistros():integer;
  end;

var
  DtmDadosServico: TDtmDadosServico;

implementation

uses
  U_DtmConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosServico }

function TDtmDadosServico.getQtdRegistros: integer;
begin
  if cdsPesquisa.IsEmpty then
    Result := 0
  else
    Result := cdsPesquisaqtd_registros.AsInteger;

end;

procedure TDtmDadosServico.listar(APlaca:string = ''; ASituacao:string=''; ACodTipoServico:Integer=-1; ACliente:string='');
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT S.CODIGO, S.COD_VEICULO, S.COD_TIPO_SERVICO, S.COD_USUARIO, S.VALOR, '#13+
                          ' V.PLACA, TS.DESCRICAO TIPO_SERVICO, C.NOME, S.SENHA, SI.DESCRICAO SITUACAO, '#13+
                          ' S.COD_SITUACAO, SI.COLOR, COUNT(*) OVER() QTD_REGISTROS                     '#13+
                          '  FROM SERVICOS S                                                            '#13+
                          '  INNER JOIN VEICULO V ON (S.COD_VEICULO = V.CODIGO)                         '#13+
                          '  INNER JOIN CLIENTE C ON (S.COD_CLIENTE = C.CODIGO)                         '#13+
                          '  INNER JOIN TIPO_SERVICO TS ON (S.COD_TIPO_SERVICO = TS.CODIGO)             '#13+
                          '  INNER JOIN SITUACAO SI ON (SI.CODIGO = S.COD_SITUACAO)                     '#13+
                          '  WHERE 1 = 1                                                                ';

  if Trim(StringReplace(APlaca, '-', '', [rfReplaceAll])) <> '' then
    QryPesquisa.SQL.Add(' AND V.PLACA LIKE ''%' + StringReplace(APlaca, ' ',
      '_', [rfReplaceAll]) + '%''');

  if Trim(ASituacao) <> '' then
    QryPesquisa.SQL.Add(' AND SI.DESCRICAO = ' + QuotedStr(ASituacao));

  if ACodTipoServico <> -1 then
    QryPesquisa.SQL.Add(' AND TS.CODIGO = ' + IntToStr(ACodTipoServico));

  if Trim(ACliente) <> '' then
    QryPesquisa.SQL.Add(' AND UPPER(C.NOME) LIKE ''%' + ACliente + '%''');

  QryPesquisa.SQL.Add(' ORDER BY PLACA ');


  cdsPesquisa.Open;
end;

procedure TDtmDadosServico.salvar(AServico: TServico);
var
  senha:string;
begin
  try
    QryAux.Close;
    QryAuxWeb.Close;
    if AServico.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE SERVICOS              '#13+
                         ' SET VALOR = :VALOR,          '#13+
                         ' COD_SITUACAO = :COD_SITUACAO '#13+
                         ' WHERE CODIGO = :COD ';
      QryAux.Parameters.ParamByName('COD').Value := AServico.codigo;

      QryAuxWeb.SQL.Text := ' UPDATE servicos_veiculo_web      '#13+
                            ' SET SITUACAO = :SITUACAO         '#13+
                            ' WHERE PLACA = :PLACA             '#13+
                            '   AND COD_SERVICO = :COD_SERVICO '#13+
                            '   AND UF = :UF                   ';
      QryAuxWeb.Parameters.ParamByName('SITUACAO').Value := AServico.situacao.descricao;
      QryAuxWeb.Parameters.ParamByName('PLACA').Value := AServico.veiculo.placa;
      QryAuxWeb.Parameters.ParamByName('COD_SERVICO').Value := AServico.tipo_servico.codigo;
      QryAuxWeb.Parameters.ParamByName('UF').Value := AServico.veiculo.uf;
    end
    else
    begin
      QryAux.SQL.Text := ' INSERT INTO SERVICOS(COD_VEICULO, COD_TIPO_SERVICO, VALOR, COD_SITUACAO, COD_USUARIO, SENHA, COD_CLIENTE)   '#13+
                         ' VALUES(:COD_VEICULO, :COD_TIPO_SERVICO, :VALOR, :COD_SITUACAO, :COD_USUARIO, :SENHA, :COD_CLIENTE)          ';
      QryAux.Parameters.ParamByName('COD_VEICULO').Value := AServico.veiculo.codigo;
      QryAux.Parameters.ParamByName('COD_TIPO_SERVICO').Value := AServico.tipo_servico.codigo;
      QryAux.Parameters.ParamByName('COD_USUARIO').Value := DtmConexao.UsuarioLogado.codigo;//AServico.usuario.codigo;
      QryAux.Parameters.ParamByName('COD_CLIENTE').Value := AServico.veiculo.cliente.id;

      QryAuxWeb.SQL.Text := ' INSERT INTO SERVICOS_VEICULO_WEB                                          '#13+
                            '  (PLACA, UF, SERVICO, SITUACAO, COD_SERVICO, SENHA, DATA_EXPIRACAO)       '#13+
                            ' VALUES                                                                    '#13+
                            ' (:PLACA, :UF, :SERVICO, :SITUACAO, :COD_SERVICO, :SENHA, current_date + 30) ';
      QryAuxWeb.Parameters.ParamByName('PLACA').Value := AServico.veiculo.placa;
      QryAuxWeb.Parameters.ParamByName('UF').Value := AServico.veiculo.uf;
      QryAuxWeb.Parameters.ParamByName('SERVICO').Value := AServico.tipo_servico.descricao;
      QryAuxWeb.Parameters.ParamByName('SITUACAO').Value := AServico.situacao.descricao;
      QryAuxWeb.Parameters.ParamByName('COD_SERVICO').Value := AServico.tipo_servico.codigo;

      senha := gerarSenha;
      QryAux.Parameters.ParamByName('SENHA').Value :=senha;
      QryAuxWeb.Parameters.ParamByName('SENHA').Value :=senha;
    end;

    QryAux.Parameters.ParamByName('VALOR').Value := AServico.valor;
    QryAux.Parameters.ParamByName('COD_SITUACAO').Value := AServico.situacao.codigo;
    QryAux.ExecSQL;

    if DtmConexao.AdoConnWeb.Connected then
      QryAuxWeb.ExecSQL;
  except
    raise;
  end;
end;

end.
