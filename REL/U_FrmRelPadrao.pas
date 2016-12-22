unit U_FrmRelPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLFilters, RLPDFFilter,
  Data.DB, U_DtmDadosEmpresa;

type
  TFrmRelPadrao = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLPDFFilter1: TRLPDFFilter;
    RLImageLogoEmpresa: TRLImage;
    RLLblNomeEmpresa: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    ds1: TDataSource;
    RLLblTelefoneFixo: TRLLabel;
    RLLblTelefoneCelular: TRLLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelPadrao: TFrmRelPadrao;

implementation

{$R *.dfm}

procedure TFrmRelPadrao.FormCreate(Sender: TObject);
begin
  DtmDadosEmpresa := TDtmDadosEmpresa.Create(nil);
  try
    DtmDadosEmpresa.listar;

    RLLblNomeEmpresa.Caption     := DtmDadosEmpresa.cdsPesquisa.FieldByName('RAZAO_SOCIAL').AsString;
    RLLblTelefoneFixo.Caption    := DtmDadosEmpresa.cdsPesquisa.FieldByName('TELEFONE_FIXO').AsString;
    RLLblTelefoneCelular.Caption := DtmDadosEmpresa.cdsPesquisa.FieldByName('TELEFONE_CELULAR').AsString;
    if DtmDadosEmpresa.cdsPesquisa.FieldByName('logo').AsString <> '' then
     begin
       if FileExists( DtmDadosEmpresa.cdsPesquisa.FieldByName('logo').AsString )then
         RLImageLogoEmpresa.Picture.LoadFromFile(DtmDadosEmpresa.cdsPesquisa.FieldByName('logo').AsString);
     end;
  finally
    FreeAndNil(DtmDadosEmpresa);
  end;
end;

end.
