unit U_FrmNegativaDeFurto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, U_FrmPadrao,
  Vcl.Mask;

type
  TFrmNegativaDeFurto = class(TFrmPadrao)
    pnl1: TPanel;
    pnlBotoes: TPanel;
    btnSair: TBitBtn;
    pnl2: TPanel;
    btnRelatorio: TBitBtn;
    lbl1: TLabel;
    medtPlaca: TMaskEdit;
    procedure btn1Click(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure cbbUFKeyPress(Sender: TObject; var Key: Char);
    procedure medtPlacaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNegativaDeFurto: TFrmNegativaDeFurto;

implementation

{$R *.dfm}

uses  U_FrmRelNegativaDeFurto;

procedure TFrmNegativaDeFurto.btn1Click(Sender: TObject);
begin

   Close;
end;

procedure TFrmNegativaDeFurto.btnRelatorioClick(Sender: TObject);
begin
  try
   FrmRelNegativaDeFurto := TFrmRelNegativaDeFurto.Create(nil);
   if (FrmRelNegativaDeFurto.carregaRelatorio(medtPlaca.Text)) then
      FrmRelNegativaDeFurto.RLReport1.PreviewModal
   else
      ShowMessage('Veículo não encontrado!');
  finally
   FreeAndNil(FrmRelNegativaDeFurto);
  end;
end;

procedure TFrmNegativaDeFurto.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmNegativaDeFurto.cbbUFKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13) and ( medtPlaca.Text <> '') then btnRelatorio.Click;
end;

procedure TFrmNegativaDeFurto.medtPlacaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    btnRelatorioClick(Sender);
end;

end.
