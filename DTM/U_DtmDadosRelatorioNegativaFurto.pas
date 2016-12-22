unit U_DtmDadosRelatorioNegativaFurto;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB;

type
  TDtmDadosRelatorioNegativaFurto = class(TDtmPadrao)
    cdsEmpresa: TClientDataSet;
    dsEmpresa: TDataSource;
    qryEmpresa: TADOQuery;
    dspEmpresa: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
    function carregaNegativaFurtosPorPlaca(sPlaca:String):Boolean;
    procedure carregaDadosEmpresa;
  end;

var
  DtmDadosRelatorioNegativaFurto: TDtmDadosRelatorioNegativaFurto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmPadrao1 }

procedure TDtmDadosRelatorioNegativaFurto.carregaDadosEmpresa;
var
  I:Integer;
begin
   qryEmpresa.Close;
   qryEmpresa.SQL.Text :=
   ' SELECT * FROM EMPRESA';
   cdsEmpresa.Open;
   I := cdsEmpresa.RecordCount
end;

function TDtmDadosRelatorioNegativaFurto.carregaNegativaFurtosPorPlaca(sPlaca: String): Boolean;
begin
   QryPesquisa.Close;
   QryPesquisa.SQL.Text:=
    'SELECT                                                                                  '+#13+
    'CL.NOME PROPRIETARIO,                                                                   '+#13+
    'coalesce(c.descricao,''________'') as COR,                                              '+#13+
    'coalesce(M.DESCRICAO,''________________'') AS MARCA_MODELO,                             '+#13+
    ' case when v.NUMERO is null or trim(v.NUMERO) = ''''                                    '+
    ' then ''_________'' else v.NUMERO end as REGISTRO,                                          '+
    'cast(coalesce(cast(V.ANO_FABRICAcaO as varchar(4)),''____'') ||''/'' ||                 '+
    '  coalesce(cast(V.ANO_MODELO as varchar(4)),''____'') as varchar(10)) as ANOFABMod,     '+#13+
    'v.placa,                                                                                '+#13+
    'case when v.chassi is null or trim(v.chassi) = ''''                                     '+
    '  then ''__________________'' else v.chassi end as chassi,                              '+
    'case when v.motor is null or trim(v.motor) = ''''                                       '+
    '  then ''_________'' else v.motor end as motor,                                         '+#13+
    'v.uf                                                                                    '+#13+
    'FROM VEICULO V                                                                          '+#13+
    'inner join cliente cl ON V.COD_CLIENTE = CL.CODIGO                                      '+#13+
    'left join cor  c         on ( v.cod_cor = c.codigo )                                    '+#13+
    'left JOIN MARCA_MODELO M ON ( M.CODIGO = V.COD_MARCA_MODELO )                           '+#13+
    '                                                                                        '+#13+
    ' WHERE V.PLACA = :PLACA                                                                 ';
    QryPesquisa.Parameters.ParamByName('PLACA').Value := sPlaca;
    cdsPesquisa.Open;
    Result := not ( cdsPesquisa.IsEmpty );


end;

end.
