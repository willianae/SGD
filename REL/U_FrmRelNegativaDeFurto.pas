unit U_FrmRelNegativaDeFurto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLRichText,U_DtmDadosRelatorioNegativaFurto,
  RLFilters, RLPDFFilter;

type
  TFrmRelNegativaDeFurto = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLMemoTextoNegativaFurto: TRLMemo;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLBand4: TRLBand;
    RLLabel1: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function carregaRelatorio(sPlaca:string):boolean;
  end;

var
  FrmRelNegativaDeFurto: TFrmRelNegativaDeFurto;

implementation

{$R *.dfm}

uses U_DtmDadosEmpresa;



function TFrmRelNegativaDeFurto.carregaRelatorio(sPlaca: string): boolean;
begin
   result := DtmDadosRelatorioNegativaFurto.carregaNegativaFurtosPorPlaca(sPlaca);
end;

procedure TFrmRelNegativaDeFurto.FormCreate(Sender: TObject);
begin
   DtmDadosEmpresa := TDtmDadosEmpresa.Create(nil);
   DtmDadosRelatorioNegativaFurto := TDtmDadosRelatorioNegativaFurto.Create(nil);
   DtmDadosEmpresa.listar;

   RLReport1.DataSource := DtmDadosRelatorioNegativaFurto.dsPesquisa;

end;

procedure TFrmRelNegativaDeFurto.FormDestroy(Sender: TObject);
begin
   FreeAndNil(DtmDadosEmpresa);
   FreeAndNil(DtmDadosRelatorioNegativaFurto);
end;

procedure TFrmRelNegativaDeFurto.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
  var
     sTexto:TStringBuilder;
begin

   sTexto := TStringBuilder.Create;
   sTexto.Append('Nome ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('NOME').AsString)
   .Append(', natural de ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('NATURALIDADE').AsString)
   .Append(', filho de ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('PAI').AsString)
   .Append(' e de ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('MAE').AsString)
   .Append(', nascido em ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('DATANASCIMENTO').AsString)
   .Append(', com profissão de ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('PROFISSAO').AsString)
   .Append(', residente a ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('LOGRADOURO').AsString)
   .Append(', nº ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('NUMERO').AsString)
   .Append(', bairro de ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('BAIRRO').AsString)
   .Append(', cidade de ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('CIDADE').AsString)
   .Append(', portador do RG nº ').Append(DtmDadosEmpresa.cdsPesquisa.FieldByName('RG').AsString)
   .Append(', para fins de matricular o veículo de marca ')
   .Append(DtmDadosRelatorioNegativaFurto.cdsPesquisa.FieldByName('MARCA_MODELO').AsString)
   .Append(' chassi ').Append(DtmDadosRelatorioNegativaFurto.cdsPesquisa.FieldByName('CHASSI').AsString)
   .Append(', motor ').Append(DtmDadosRelatorioNegativaFurto.cdsPesquisa.FieldByName('MOTOR').AsString)
   .Append(', placa ').Append(DtmDadosRelatorioNegativaFurto.cdsPesquisa.FieldByName('PLACA').AsString)
   .Append(', ano ').Append(DtmDadosRelatorioNegativaFurto.cdsPesquisa.FieldByName('ANOFABMOD').AsString)
   .Append(' cor ').Append(DtmDadosRelatorioNegativaFurto.cdsPesquisa.FieldByName('COR').AsString)
   .Append(', certificado no registro nº').Append(DtmDadosRelatorioNegativaFurto.cdsPesquisa.FieldByName('REGISTRO').AsString)
   .Append(' expedido DETRAN do Estado de  ').Append(DtmDadosRelatorioNegativaFurto.cdsPesquisa.FieldByName('UF').AsString)
   .Append(' de propriedade do ').Append(DtmDadosRelatorioNegativaFurto.cdsPesquisa.FieldByName('PROPRIETARIO').AsString)
   .Append(' vem solicitar a V.Sª, se digne em fornecer Certidão Nada Consta referente ao veículo acima caracterizado, para fins ')
   .Append('de emplacamento no Município de  Recife, Estado PE.');

   RLMemoTextoNegativaFurto.Lines.Add(sTexto.ToString);

end;

end.
