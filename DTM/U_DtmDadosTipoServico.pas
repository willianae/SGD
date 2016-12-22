unit U_DtmDadosTipoServico;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TTipoServico;

type
  TDtmDadosTipoServico = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisadescricao: TStringField;
    cdsPesquisataxa_detran: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo:Integer);
    procedure salvar(ATipoServico: TTipoServico);
    procedure listar;
    function getDescricao(ACodigo:Integer):string;


  end;

var
  DtmDadosTipoServico: TDtmDadosTipoServico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosTipoServico }


{ TDtmDadosTipoServico }

procedure TDtmDadosTipoServico.DataModuleCreate(Sender: TObject);
begin
  inherited;
  listar;
end;

procedure TDtmDadosTipoServico.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM TIPO_SERVICO WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

function TDtmDadosTipoServico.getDescricao(ACodigo:Integer): string;
begin
  QryAux.Close;
  QryAux.SQL.Text := ' SELECT DESCRICAO FROM TIPO_SERVICO '#13+
                     ' WHERE CODIGO = :CODIGO             ';
  QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
  QryAux.Open;
  if QryAux.IsEmpty then
    Result := ''
  else
    Result := QryAux.FieldByName('DESCRICAO').AsString;
end;

procedure TDtmDadosTipoServico.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM TIPO_SERVICO ORDER BY CODIGO ';
  cdsPesquisa.Open;
end;

procedure TDtmDadosTipoServico.salvar(ATipoServico: TTipoServico);
begin
  try
    QryAux.Close;
    if ATipoServico.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE TIPO_SERVICO    '#13+
                         ' SET DESCRICAO = :DESC, '#13+
                         ' TAXA_DETRAN = :TAXA    '#13+
                         ' WHERE CODIGO = :COD    ';
      QryAux.Parameters.ParamByName('COD').Value := ATipoServico.codigo;
    end
    else
      QryAux.SQL.Text := ' INSERT INTO TIPO_SERVICO(DESCRICAO, TAXA_DETRAN) '#13+
                         ' VALUES(:DESC, :TAXA)                             ';

    QryAux.Parameters.ParamByName('DESC').Value := ATipoServico.descricao;
    QryAux.Parameters.ParamByName('TAXA').Value := ATipoServico.taxa_detran;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
