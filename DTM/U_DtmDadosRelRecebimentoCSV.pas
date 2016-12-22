unit U_DtmDadosRelRecebimentoCSV;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB;

type
  TDtmDadosRelRecebimentoCSV = class(TDtmPadrao)
    cdsPesquisaplaca: TStringField;
    cdsPesquisarenavam: TStringField;
    cdsPesquisauf: TStringField;
    cdsPesquisamotivo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  DtmDadosRelRecebimentoCSV: TDtmDadosRelRecebimentoCSV;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosRelRecebimentoCSV }

procedure TDtmDadosRelRecebimentoCSV.listar;
begin
  QryPesquisa.Close;
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT PLACA,                 '#13+
                          ' RENAVAM,                      '#13+
                          ' UF,                           '#13+
                          ' ''SINISTRO'' AS MOTIVO        '#13+
                          ' FROM VEICULO                  '#13+
                          ' WHERE FLG_RECEBEU_CSV = ''S'' '#13+
                          ' AND FLG_IMPRIMIU_CSV = ''N''  ';
  cdsPesquisa.Open;

  {QryAux.Close;
  QryAux.SQL.Text := ' UPDATE FLG_IMPRIMIU_CSV = ''S'' '#13+
                     ' WHERE FLG_RECEBEU_CSV = ''S''   ';
  QryAux.ExecSQL;
  }
end;

end.
