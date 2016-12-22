unit U_DtmDadosTipo;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TTipo;

type
  TDtmDadosTipo = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisadescricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo:Integer);
    procedure salvar(ATipo: TTipo);
    procedure listar;


  end;

var
  DtmDadosTipo: TDtmDadosTipo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosTipo }


{ TDtmDadosTipo }

procedure TDtmDadosTipo.DataModuleCreate(Sender: TObject);
begin
  inherited;
  listar;
end;

procedure TDtmDadosTipo.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM Tipo WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

procedure TDtmDadosTipo.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM Tipo ORDER BY CODIGO ';
  cdsPesquisa.Open;
end;

procedure TDtmDadosTipo.salvar(ATipo: TTipo);
begin
  try
    QryAux.Close;
    if ATipo.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE Tipo    '#13+
                         ' SET DESCRICAO = :DESC '#13+
                         ' WHERE CODIGO = :COD   ';
      QryAux.Parameters.ParamByName('COD').Value := ATipo.codigo;
    end
    else
      QryAux.SQL.Text := ' INSERT INTO Tipo(DESCRICAO) '#13+
                         ' VALUES(:DESC)                      ';

    QryAux.Parameters.ParamByName('DESC').Value := ATipo.descricao;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
