unit U_DtmDadosSeguradora;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TSeguradora;

type
  TDtmDadosSeguradora = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisadescricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo:Integer);
    procedure salvar(ASeguradora: TSeguradora);
    procedure listar;


  end;

var
  DtmDadosSeguradora: TDtmDadosSeguradora;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosSeguradora }


{ TDtmDadosSeguradora }

procedure TDtmDadosSeguradora.DataModuleCreate(Sender: TObject);
begin
  inherited;
  listar;
end;

procedure TDtmDadosSeguradora.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM Seguradora WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

procedure TDtmDadosSeguradora.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM Seguradora ORDER BY CODIGO ';
  cdsPesquisa.Open;
end;

procedure TDtmDadosSeguradora.salvar(ASeguradora: TSeguradora);
begin
  try
    QryAux.Close;
    if ASeguradora.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE Seguradora    '#13+
                         ' SET DESCRICAO = :DESC '#13+
                         ' WHERE CODIGO = :COD   ';
      QryAux.Parameters.ParamByName('COD').Value := ASeguradora.codigo;
    end
    else
      QryAux.SQL.Text := ' INSERT INTO Seguradora(DESCRICAO) '#13+
                         ' VALUES(:DESC)                      ';

    QryAux.Parameters.ParamByName('DESC').Value := ASeguradora.descricao;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
