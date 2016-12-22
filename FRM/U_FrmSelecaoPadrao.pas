unit U_FrmSelecaoPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmPadrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

type
  TFrmSelecaoPadrao = class(TFrmPadrao)
    pnlConsulta: TPanel;
    dbgrdConsulta: TDBGrid;
    pnlBotoesAcoes: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    edtFiltro: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgrdConsultaDblClick(Sender: TObject);
    procedure dbgrdConsultaTitleClick(Column: TColumn);
    procedure edtFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure edtFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Selecionar(Key:word);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecaoPadrao: TFrmSelecaoPadrao;

implementation

{$R *.dfm}

procedure TFrmSelecaoPadrao.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmSelecaoPadrao.btnOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFrmSelecaoPadrao.dbgrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  btnOkClick(Sender);
end;

procedure TFrmSelecaoPadrao.dbgrdConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   Selecionar(key);
end;

procedure TFrmSelecaoPadrao.dbgrdConsultaTitleClick(Column: TColumn);
begin
  inherited;
  if dbgrdConsulta.DataSource.DataSet is TClientDataSet then
  begin
    TClientDataSet(dbgrdConsulta.DataSource.DataSet).IndexFieldNames :=
      Column.FieldName;
  end;
end;

procedure TFrmSelecaoPadrao.edtFiltroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Selecionar(Key);
  if Key =VK_DOWN then
    dbgrdConsulta.SetFocus;

end;

procedure TFrmSelecaoPadrao.edtFiltroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Trim(edtFiltro.Text) <> '' then
  begin
    dbgrdConsulta.DataSource.DataSet.Filtered := False;
    dbgrdConsulta.DataSource.DataSet.Filter   := dbgrdConsulta.DataSource.DataSet.Fields[1].FieldName +
      ' LIKE ' +Quotedstr('%'+ edtFiltro.Text+'%');
    dbgrdConsulta.DataSource.DataSet.Filtered := True;
  end
  else
    dbgrdConsulta.DataSource.DataSet.Filtered := false;


end;


procedure TFrmSelecaoPadrao.Selecionar(Key: word);
begin
  if Key = VK_RETURN then
  begin
    if not (dbgrdConsulta.DataSource.DataSet.IsEmpty) then
    begin
      btnOk.Click;
    end;
  end;
end;

end.
