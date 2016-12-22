unit U_DtmDadosHistoricoProcesso;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB;

type
  TDtmDadosHistoricoProcesso = class(TDtmPadrao)
    cdsPesquisaplaca: TStringField;
    cdsPesquisacliente: TStringField;
    cdsPesquisaprocesso_antigo: TStringField;
    cdsPesquisaprocesso_atual: TStringField;
    cdsPesquisausuario: TStringField;
    cdsPesquisadata_mudanca: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar(APlaca:string);
  end;

var
  DtmDadosHistoricoProcesso: TDtmDadosHistoricoProcesso;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosHistoricoProcesso }

procedure TDtmDadosHistoricoProcesso.DataModuleCreate(Sender: TObject);
begin
  inherited;
  cdsPesquisa.Close;
end;

procedure TDtmDadosHistoricoProcesso.listar(APlaca: string);
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text :=
  ' select v.placa Placa, c.nome Cliente, pro_antigo.descricao Processo_Antigo,                                 '#13+
  ' pro_atual.descricao Processo_Atual, usu.nome Usuario, to_char(his.data_mudanca,''dd/mm/yyyy'') Data_mudanca '#13+
  ' from historico_processo his                                                                                 '#13+
  ' inner join veiculo v on v.codigo = his.cod_veiculo                                                          '#13+
  ' inner join cliente c on c.codigo = his.cod_cliente                                                          '#13+
  ' inner join processo pro_antigo on pro_antigo.codigo = his.cod_processo_antigo                               '#13+
  ' inner join processo pro_atual on pro_atual.codigo = his.cod_processo_atual                                  '#13+
  ' left join usuario usu on usu.codigo = his.cod_usuario                                                       '#13+
  ' where v.placa = :placa                                                                                      '#13+
  ' order by data_mudanca                                                                                       ';

  QryPesquisa.Parameters.ParamByName('placa').Value := APlaca;
  cdsPesquisa.Open;
end;

end.
