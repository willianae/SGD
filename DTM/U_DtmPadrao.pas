unit U_DtmPadrao;

interface

uses
  System.SysUtils, System.Classes, U_DtmConexao, Data.DB, Data.Win.ADODB,
  Datasnap.Provider, Datasnap.DBClient;

type
  TDtmPadrao = class(TDataModule)
    QryAux: TADOQuery;
    cdsPesquisa: TClientDataSet;
    dsPesquisa: TDataSource;
    QryPesquisa: TADOQuery;
    dspPesquisa: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmPadrao: TDtmPadrao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
