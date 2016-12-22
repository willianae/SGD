unit U_DtmDadosCategoria;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TCategoria;

type
  TDtmDadosCategoria = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisadescricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo:Integer);
    procedure salvar(ACategoria: TCategoria);
    procedure listar;


  end;

var
  DtmDadosCategoria: TDtmDadosCategoria;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosCategoria }


{ TDtmDadosCategoria }

procedure TDtmDadosCategoria.DataModuleCreate(Sender: TObject);
begin
  inherited;
  listar;
end;

procedure TDtmDadosCategoria.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM Categoria WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

procedure TDtmDadosCategoria.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM Categoria ORDER BY CODIGO ';
  cdsPesquisa.Open;
end;

procedure TDtmDadosCategoria.salvar(ACategoria: TCategoria);
begin
  try
    QryAux.Close;
    if ACategoria.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE Categoria    '#13+
                         ' SET DESCRICAO = :DESC '#13+
                         ' WHERE CODIGO = :COD   ';
      QryAux.Parameters.ParamByName('COD').Value := ACategoria.codigo;
    end
    else
      QryAux.SQL.Text := ' INSERT INTO Categoria(DESCRICAO) '#13+
                         ' VALUES(:DESC)                      ';

    QryAux.Parameters.ParamByName('DESC').Value := ACategoria.descricao;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
