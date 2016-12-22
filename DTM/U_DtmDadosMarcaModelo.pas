unit U_DtmDadosMarcaModelo;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TMarcaModelo;

type
  TDtmDadosMarcaModelo = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisadescricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo:Integer);
    procedure salvar(AMarcaModelo: TMarcaModelo);
    procedure listar;


  end;

var
  DtmDadosMarcaModelo: TDtmDadosMarcaModelo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosMarcaModelo }


{ TDtmDadosMarcaModelo }

procedure TDtmDadosMarcaModelo.DataModuleCreate(Sender: TObject);
begin
  inherited;
  listar;
end;

procedure TDtmDadosMarcaModelo.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM MARCA_MODELO WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

procedure TDtmDadosMarcaModelo.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM MARCA_MODELO ORDER BY DESCRICAO ';
  cdsPesquisa.Open;

end;

procedure TDtmDadosMarcaModelo.salvar(AMarcaModelo: TMarcaModelo);
begin
  try
    QryAux.Close;
    if AMarcaModelo.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE MARCA_MODELO    '#13+
                         ' SET DESCRICAO = :DESC '#13+
                         ' WHERE CODIGO = :COD   ';
      QryAux.Parameters.ParamByName('COD').Value := AMarcaModelo.codigo;
    end
    else
      QryAux.SQL.Text := ' INSERT INTO MARCA_MODELO(DESCRICAO) '#13+
                         ' VALUES(:DESC)                      ';

    QryAux.Parameters.ParamByName('DESC').Value := AMarcaModelo.descricao;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
