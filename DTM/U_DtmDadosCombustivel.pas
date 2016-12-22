unit U_DtmDadosCombustivel;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TCombustivel;

type
  TDtmDadosCombustivel = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisadescricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo:Integer);
    procedure salvar(ACombustivel: TCombustivel);
    procedure listar;


  end;

var
  DtmDadosCombustivel: TDtmDadosCombustivel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosCombustivel }


{ TDtmDadosCombustivel }

procedure TDtmDadosCombustivel.DataModuleCreate(Sender: TObject);
begin
  inherited;
  listar;
end;

procedure TDtmDadosCombustivel.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM COMBUSTIVEL WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

procedure TDtmDadosCombustivel.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM COMBUSTIVEL ORDER BY CODIGO ';
  cdsPesquisa.Open;
end;

procedure TDtmDadosCombustivel.salvar(ACombustivel: TCombustivel);
begin
  try
    QryAux.Close;
    if ACombustivel.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE COMBUSTIVEL    '#13+
                         ' SET DESCRICAO = :DESC '#13+
                         ' WHERE CODIGO = :COD   ';
      QryAux.Parameters.ParamByName('COD').Value := ACombustivel.codigo;
    end
    else
      QryAux.SQL.Text := ' INSERT INTO COMBUSTIVEL(DESCRICAO) '#13+
                         ' VALUES(:DESC)                      ';

    QryAux.Parameters.ParamByName('DESC').Value := ACombustivel.descricao;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
