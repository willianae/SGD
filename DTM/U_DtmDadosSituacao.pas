unit U_DtmDadosSituacao;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TSituacao;

type
  TDtmDadosSituacao = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisadescricao: TStringField;
    cdsPesquisacolor: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo:Integer);
    procedure salvar(ASituacao: TSituacao);
    procedure listar;
    function getSituacaoPeloCodigo(ACodigo:integer):string;


  end;

var
  DtmDadosSituacao: TDtmDadosSituacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosSituacao }


{ TDtmDadosSituacao }

procedure TDtmDadosSituacao.DataModuleCreate(Sender: TObject);
begin
  inherited;
  listar;
end;

procedure TDtmDadosSituacao.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM Situacao WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

function TDtmDadosSituacao.getSituacaoPeloCodigo(ACodigo: integer): string;
begin
  QryAux.Close;
  QryAux.SQL.Text := ' SELECT DESCRICAO FROM Situacao '#13+
                     ' WHERE CODIGO = :CODIGO         ';
  QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
  QryAux.Open;
  if not QryAux.IsEmpty then
    Result := QryAux.FieldByName('DESCRICAO').AsString
  else
    Result := '';

end;

procedure TDtmDadosSituacao.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM Situacao ORDER BY CODIGO ';
  cdsPesquisa.Open;
end;

procedure TDtmDadosSituacao.salvar(ASituacao: TSituacao);
begin
  try
    QryAux.Close;
    if ASituacao.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE Situacao        '#13+
                         ' SET DESCRICAO = :DESC, '#13+
                         ' COLOR = :COLOR         '#13+
                         ' WHERE CODIGO = :COD    ';
      QryAux.Parameters.ParamByName('COD').Value := ASituacao.codigo;
    end
    else
      QryAux.SQL.Text := ' INSERT INTO Situacao(DESCRICAO, COLOR) '#13+
                         ' VALUES(:DESC, :COLOR)                  ';

    QryAux.Parameters.ParamByName('DESC').Value := ASituacao.descricao;
    QryAux.Parameters.ParamByName('COLOR').Value := ASituacao.color;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
