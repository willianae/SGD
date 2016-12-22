unit U_FrmCadastroEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ExtDlgs, Vcl.Mask;

type
  TFrmCadastroEmpresa = class(TFrmCadastroPadrao)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edtRazaoSocial: TEdit;
    edtNaturalidade: TEdit;
    edtPai: TEdit;
    edtMae: TEdit;
    edtRg: TEdit;
    edtLogradouro: TEdit;
    lbl8: TLabel;
    edtNumero: TEdit;
    lbl9: TLabel;
    edtCidade: TEdit;
    lbl10: TLabel;
    edtBairro: TEdit;
    lbl11: TLabel;
    edtProfissao: TEdit;
    dlgOpenPic1: TOpenPictureDialog;
    lbl12: TLabel;
    edtCodigo: TEdit;
    btnCarregarLogo: TSpeedButton;
    lbl13: TLabel;
    cbbUF: TComboBox;
    lbl14: TLabel;
    edtNome: TEdit;
    lbl15: TLabel;
    lbl16: TLabel;
    medtDataEmissao: TMaskEdit;
    medtTelefoneCelular: TMaskEdit;
    medtTelefoneFixo: TMaskEdit;
    GroupBox1: TGroupBox;
    imgLogoEmpresa: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCarregarLogoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroEmpresa: TFrmCadastroEmpresa;

implementation

{$R *.dfm}

uses U_DtmDadosEmpresa, U_TEmpresa, U_TEndereco, U_BibliotecaFuncoes;

procedure TFrmCadastroEmpresa.btnCarregarLogoClick(Sender: TObject);
begin
  inherited;
  if ( dlgOpenPic1.Execute) then
  begin
     imgLogoEmpresa.Picture.LoadFromFile(dlgOpenPic1.FileName);
     imgLogoEmpresa.Picture.SaveToFile(ExtractFilePath(Application.ExeName) +'/imgs/'+ ExtractFileName(dlgOpenPic1.FileName) );
  end;
end;

procedure TFrmCadastroEmpresa.btnSalvarClick(Sender: TObject);
var
   empresa :Tempresa;
begin
  inherited;
   empresa := TEmpresa.Create;
   try
      empresa.id   := StrToInt( edtCodigo.Text );
      empresa.nome := edtNome.Text;
      empresa.naturalidade := edtNaturalidade.Text;
      empresa.pai := edtPai.Text;
      empresa.mae := edtMae.Text;
      empresa.dataNascimento := medtDataEmissao.Text;
      empresa.endereco        := TEndereco.Create;
      empresa.endereco.rua    := edtLogradouro.Text;
      empresa.endereco.numero := edtNumero.Text;
      empresa.endereco.cidade := edtCidade.Text;
      empresa.endereco.bairro := edtBairro.Text;
      if ( cbbUF.ItemIndex > 0 ) then
        empresa.endereco.uf     := cbbUF.Text;
      empresa.profissao       := edtProfissao.Text;
      empresa.rg              := edtRg.Text;
      empresa.logo            := ExtractFilePath(Application.ExeName) +'imgs\'+ ExtractFileName(dlgOpenPic1.FileName) ;
      empresa.telefoneFixo    := medtTelefoneFixo.Text;
      empresa.telefoneCelular := medtTelefoneCelular.Text;
      empresa.razaoSocial     := edtRazaoSocial.Text;
      DtmDadosEmpresa.salvar(empresa);
      exibeMensagem('Dados da empresa atualizado com sucesso!',tmAviso,edtNome);
   finally
     empresa.Free
   end;
end;

procedure TFrmCadastroEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
   if not DirectoryExists(ExtractFilePath(Application.ExeName) +'imgs\')  then
      ForceDirectories(ExtractFilePath(Application.ExeName) +'imgs\');

   pgctrlPrincipal.ActivePage := tbsCadastro;

   DtmDadosEmpresa := TDtmDadosEmpresa.Create(nil);
   DtmDadosEmpresa.listar;
   edtCodigo.Text         := DtmDadosEmpresa.cdsPesquisa.FieldByName('CODIGO').AsString;
   edtNome.Text           := DtmDadosEmpresa.cdsPesquisa.FieldByName('NOME').AsString;
   edtNaturalidade.Text   := DtmDadosEmpresa.cdsPesquisa.FieldByName('NATURALIDADE').AsString;
   edtPai.Text            := DtmDadosEmpresa.cdsPesquisa.FieldByName('PAI').AsString;
   edtMae.Text            := DtmDadosEmpresa.cdsPesquisa.FieldByName('MAE').AsString;
   medtDataEmissao.Text   := DtmDadosEmpresa.cdsPesquisa.FieldByName('DATANASCIMENTO').AsString;
   edtLogradouro.Text     := DtmDadosEmpresa.cdsPesquisa.FieldByName('LOGRADOURO').AsString;
   edtNumero.Text         := DtmDadosEmpresa.cdsPesquisa.FieldByName('NUMERO').AsString;
   edtBairro.Text         := DtmDadosEmpresa.cdsPesquisa.FieldByName('BAIRRO').AsString;
   edtCidade.Text         := DtmDadosEmpresa.cdsPesquisa.FieldByName('CIDADE').AsString;
   edtRg.Text             := DtmDadosEmpresa.cdsPesquisa.FieldByName('RG').AsString;
   edtProfissao.Text      := DtmDadosEmpresa.cdsPesquisa.FieldByName('PROFISSAO').AsString;
   edtRazaoSocial.Text       := DtmDadosEmpresa.cdsPesquisa.FieldByName('RAZAO_SOCIAL').AsString;
   medtTelefoneFixo.Text     := DtmDadosEmpresa.cdsPesquisa.FieldByName('TELEFONE_FIXO').AsString;
   medtTelefoneCelular.Text  := DtmDadosEmpresa.cdsPesquisa.FieldByName('TELEFONE_CELULAR').AsString;
   if( Trim(DtmDadosEmpresa.cdsPesquisa.FieldByName('UF').AsString) <> '' )then
     cbbUF.ItemIndex := cbbUF.Items.IndexOf(DtmDadosEmpresa.cdsPesquisa.FieldByName('UF').AsString);

   if DtmDadosEmpresa.cdsPesquisa.FieldByName('logo').AsString <> '' then
   begin
     if FileExists( DtmDadosEmpresa.cdsPesquisa.FieldByName('logo').AsString )then
     begin
       imgLogoEmpresa.Picture.LoadFromFile(DtmDadosEmpresa.cdsPesquisa.FieldByName('logo').AsString);
       dlgOpenPic1.FileName := DtmDadosEmpresa.cdsPesquisa.FieldByName('logo').AsString;
     end;
   end;
end;

procedure TFrmCadastroEmpresa.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DtmDadosEmpresa);
end;

end.
