unit U_FrmRecebimentoCSV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmPadrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, U_FrmRelRecebimentoCSV, U_BibliotecaFuncoes;

type
  TFrmRecebimentoCSV = class(TFrmPadrao)
    pnlBotoes: TPanel;
    btnSair: TBitBtn;
    pnl2: TPanel;
    btnRelatorio: TBitBtn;
    Label12: TLabel;
    edtValorServico: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure edtValorServicoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRecebimentoCSV: TFrmRecebimentoCSV;

implementation

{$R *.dfm}

procedure TFrmRecebimentoCSV.btnRelatorioClick(Sender: TObject);
var
  dAux:Double;
begin
  inherited;
  if not TryStrToFloat(edtValorServico.Text,dAux) then
    exibeMensagem('Informe corretamente o VALOR!',tmAviso)
  else
  try
    FrmRelRecebimentoCSV := TFrmRelRecebimentoCSV.Create(nil);
    FrmRelRecebimentoCSV.ValorServico := StrToFloat(edtValorServico.Text);
    FrmRelRecebimentoCSV.imprimir;
  finally
    FreeAndNil(FrmRelRecebimentoCSV);
  end;
end;

procedure TFrmRecebimentoCSV.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmRecebimentoCSV.edtValorServicoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnRelatorioClick(Sender);
end;

end.
