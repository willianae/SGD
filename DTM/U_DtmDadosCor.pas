unit U_DtmDadosCor;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TCor;

type
  TDtmDadosCor = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisadescricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo:Integer);
    procedure salvar(ACor: TCor);
    procedure listar;


  end;

var
  DtmDadosCor: TDtmDadosCor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosCor }


{ TDtmDadosCor }

procedure TDtmDadosCor.DataModuleCreate(Sender: TObject);
begin
  inherited;
  listar;
end;

procedure TDtmDadosCor.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM Cor WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

procedure TDtmDadosCor.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM Cor ORDER BY CODIGO ';
  cdsPesquisa.Open;
end;

procedure TDtmDadosCor.salvar(ACor: TCor);
begin
  try
    QryAux.Close;
    if ACor.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE Cor    '#13+
                         ' SET DESCRICAO = :DESC '#13+
                         ' WHERE CODIGO = :COD   ';
      QryAux.Parameters.ParamByName('COD').Value := ACor.codigo;
    end
    else
      QryAux.SQL.Text := ' INSERT INTO Cor(DESCRICAO) '#13+
                         ' VALUES(:DESC)                      ';

    QryAux.Parameters.ParamByName('DESC').Value := ACor.descricao;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
