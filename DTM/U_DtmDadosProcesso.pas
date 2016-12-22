unit U_DtmDadosProcesso;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, U_TProcesso;

type
  TDtmDadosProcesso = class(TDtmPadrao)
    cdsPesquisacodigo: TLargeintField;
    cdsPesquisadescricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure excluir(ACodigo:Integer);
    procedure salvar(AProcesso: TProcesso);
    procedure listar;


  end;

var
  DtmDadosProcesso: TDtmDadosProcesso;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosProcesso }


{ TDtmDadosProcesso }

procedure TDtmDadosProcesso.DataModuleCreate(Sender: TObject);
begin
  inherited;
  listar;
end;

procedure TDtmDadosProcesso.excluir(ACodigo: Integer);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := ' DELETE FROM Processo WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

procedure TDtmDadosProcesso.listar;
begin
  cdsPesquisa.Close;
  QryPesquisa.SQL.Text := ' SELECT * FROM Processo ORDER BY CODIGO ';
  cdsPesquisa.Open;
end;

procedure TDtmDadosProcesso.salvar(AProcesso: TProcesso);
begin
  try
    QryAux.Close;
    if AProcesso.codigo > 0 then
    begin
      QryAux.SQL.Text := ' UPDATE Processo    '#13+
                         ' SET DESCRICAO = :DESC '#13+
                         ' WHERE CODIGO = :COD   ';
      QryAux.Parameters.ParamByName('COD').Value := AProcesso.codigo;
    end
    else
      QryAux.SQL.Text := ' INSERT INTO Processo(DESCRICAO) '#13+
                         ' VALUES(:DESC)                      ';

    QryAux.Parameters.ParamByName('DESC').Value := AProcesso.descricao;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
