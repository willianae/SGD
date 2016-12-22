unit U_DtmDadosConvocacao;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB;

type
  TDtmDadosConvocacao = class(TDtmPadrao)
    cdsConvocacao: TClientDataSet;
    cdsConvocacaoVEICULO: TStringField;
    cdsConvocacaoPLACA: TStringField;
    cdsConvocacaoUF: TStringField;
    cdsConvocacaoANO_MODELO: TStringField;
    cdsConvocacaoIPVA: TStringField;
    cdsConvocacaoRESTRICAO: TStringField;
    cdsConvocacaoVALOR_SERVICO: TFloatField;
    cdsConvocacaoCOD_VEICULO: TIntegerField;
    cdsConvocacaoCOD_SEGURADORA: TIntegerField;
    cdsConvocacaoNUMERO: TIntegerField;
    cdsConvocacaoSN_IPVA: TStringField;
    cdsConvocacaoSN_RESTRICAO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    function getValorServico(bComrestricao:Boolean):Double;
  public
    { Public declarations }
   procedure adicionaCDSConvocacao(sVeiculo, sPlaca, sUf,
  sAnoModelo, sIpva, sRestricao,sSeguradora: string; iCodVeiculo, iCodSeguradora,iNumConvocacao: Integer);
   function getDadosVeiculo(sPlaca:string;
   var
    codVeiculo:integer;var sVeiculo,sAnoModelo,sProprietario:string):Boolean;
    procedure gravarDadosConvocacao();
   function veiculoJaConvocado(sPlaca:string;iAno:Integer):Boolean;
  end;

var
  DtmDadosConvocacao: TDtmDadosConvocacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses U_BibliotecaFuncoes, U_DtmConexao;

{$R *.dfm}

{ TDtmDadosConvocacao }

procedure TDtmDadosConvocacao.adicionaCDSConvocacao(sVeiculo, sPlaca, sUf,
  sAnoModelo, sIpva, sRestricao,sSeguradora: string; iCodVeiculo, iCodSeguradora,iNumConvocacao: Integer);
begin
   cdsConvocacao.Append;
   cdsConvocacaoVEICULO.AsString    := sVeiculo;
   cdsConvocacaoPLACA.AsString      := sPlaca;
   cdsConvocacaoUF.AsString         := sUf;

   cdsConvocacaoANO_MODELO.AsString := sAnoModelo;
   cdsConvocacaoSN_IPVA.AsString        := sIpva;
   cdsConvocacaoSN_RESTRICAO.AsString   := sRestricao;

   if (sIpva = 'S') then
      cdsConvocacaoIPVA.AsString := 'CONSTA'
   else
      cdsConvocacaoIPVA.AsString := 'NÃO CONSTA';

   if (sRestricao = 'S') then
      cdsConvocacaoRESTRICAO.AsString := 'CONSTA'
   else
      cdsConvocacaoRESTRICAO.AsString := 'NÃO CONSTA';

   cdsConvocacaoVALOR_SERVICO.AsFloat := getValorServico(sRestricao = 'S');
   cdsConvocacaoCOD_VEICULO.AsInteger := iCodVeiculo;
   cdsConvocacaoCOD_SEGURADORA.AsInteger := iCodSeguradora;
   cdsConvocacao.Post;
end;

procedure TDtmDadosConvocacao.DataModuleCreate(Sender: TObject);
begin
  inherited;
   cdsConvocacao.CreateDataSet;
end;




procedure TDtmDadosConvocacao.DataModuleDestroy(Sender: TObject);
begin
  inherited;
//
   cdsConvocacao.Close;
end;

function TDtmDadosConvocacao.getDadosVeiculo(sPlaca: string;
var
codVeiculo:Integer;var sVeiculo,sAnoModelo,sProprietario:String): Boolean;
begin
   QryAux.Close;
   QryAux.SQL.Text :=
   '   SELECT                                                        '+#13+
   '   m.descricao,                                                  '+#13+
   '   c.nome,                                                       '+#13+
   '   v.codigo,                                                     '+#13+
   '   v.PLACA,                                                      '+#13+
   '   v.UF,                                                         '+#13+
   '   v.ANO_FABRICACAO,                                             '+#13+
   '   v.ANO_MODELO                                                  '+#13+
   '   FROM                                                          '+#13+
   '   VEICULO V                                                     '+#13+
   '   left join cliente c on ( v.cod_cliente = c.codigo)            '+#13+
   '   left join marca_modelo m on ( v.cod_marca_modelo = m.codigo)  '+#13+
   '  WHERE                                                          '+#13+
   '  v.PLACA = :PLACA                                               ';
   QryAux.Parameters.ParamByName('PLACA').Value := sPlaca;
   QryAux.Open;
   if not ( QryAux.IsEmpty) then
   begin
     sVeiculo      := QryAux.FieldByName('DESCRICAO').AsString;
     sProprietario := QryAux.FieldByName('nome').AsString;
     codVeiculo    := QryAux.FieldByName('codigo').AsInteger;
     sAnoModelo    := QryAux.FieldByName('ANO_FABRICACAO').AsString+'/' +QryAux.FieldByName('ANO_MODELO').AsString
   end;
   Result := NOT QryAux.IsEmpty;
end;

function TDtmDadosConvocacao.getValorServico(bComrestricao: Boolean): Double;
var
  ValorServico:Double;
begin
   ValorServico := 0;
   QryAux.Close;
   if ( bComrestricao) then
     QryAux.SQL.Text := ' SELECT VALOR FROM PARAMETROS WHERE CODIGO = 1 '
   else
     QryAux.SQL.Text := ' SELECT VALOR FROM PARAMETROS WHERE CODIGO = 2 ';

   QryAux.Open;
   ValorServico := QryAux.FieldByName('VALOR').AsFloat;

   Result := ValorServico;
end;

procedure TDtmDadosConvocacao.gravarDadosConvocacao;
begin
   cdsConvocacao.First;
   while not (cdsConvocacao.Eof) do
   begin
     QryAux.Close;
     QryAux.SQL.Text :=
     ' INSERT INTO convocacao ( ' +
     ' NUMERO, ANO, COD_SEGURADORA,COD_VEICULO,' +
     ' SN_IPVA, SN_RESTRICAO, VALOR, COD_USUARIO )'+
     ' VALUES ( ' +
     ' :NUMERO, :ANO, :COD_SEGURADORA,:COD_VEICULO,' +
     ' :SN_IPVA, :SN_RESTRICAO, :VALOR, :COD_USUARIO )';
     QryAux.Parameters.ParamByName('NUMERO').Value          := cdsConvocacaoNUMERO.AsInteger;
     QryAux.Parameters.ParamByName('ANO').Value             := FormatDateTime('yyyy',DataDB);
     QryAux.Parameters.ParamByName('COD_SEGURADORA').Value  := cdsConvocacaoCOD_SEGURADORA.AsInteger;
     QryAux.Parameters.ParamByName('COD_VEICULO').Value     := cdsConvocacaoCOD_VEICULO.AsInteger;
     QryAux.Parameters.ParamByName('SN_IPVA').Value         := cdsConvocacaoSN_IPVA.AsString;
     QryAux.Parameters.ParamByName('SN_RESTRICAO').Value    := cdsConvocacaoSN_RESTRICAO.AsString;
     QryAux.Parameters.ParamByName('VALOR').Value           := cdsConvocacaoVALOR_SERVICO.AsFloat;
     QryAux.Parameters.ParamByName('COD_USUARIO').Value     := DtmConexao.UsuarioLogado.codigo;
     QryAux.ExecSQL;
     cdsConvocacao.Next;
   end;
   cdsConvocacao.First;
end;

function TDtmDadosConvocacao.veiculoJaConvocado(sPlaca: string;
  iAno: Integer): Boolean;
begin
   QryAux.Close;
   QryAux.SQL.Text :=
   ' SELECT COD_VEICULO FROM CONVOCACAO C              ' +
   ' INNER JOIN VEICULO V ON C.COD_VEICULO = V.CODIGO  ' +
   ' WHERE                                             ' +
   ' V.PLACA = :PLACA                                  ' +
   ' AND C.ANO  =:ANO                                  ';
   QryAux.Parameters.ParamByName('PLACA').Value := sPlaca;
   QryAux.Parameters.ParamByName('ano').Value    := iAno;
   QryAux.Open;
   Result := not QryAux.IsEmpty;
end;

end.
