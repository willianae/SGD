unit U_DtmConexao;

interface

uses
  SysUtils, Classes, DB, ADODB, Forms, Windows, U_FrmLogin, U_TUsuario, U_BibliotecaFuncoes,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, System.IniFiles, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client  ;

type
  TDtmConexao = class(TDataModule)
    AdoConn: TADOConnection;
    QryAux: TADOQuery;
    AdoConnWeb: TADOConnection;
    QryAuxWeb: TADOQuery;
    IdFTP1: TIdFTP;
    FDConn: TFDConnection;
    FDPhysOracleLink: TFDPhysOracleDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure setDataBanco;
    function verificarVersao: boolean;
  public
    { Public declarations }
    UsuarioLogado: TUsuario;
  end;

var
  DtmConexao: TDtmConexao;

implementation

uses
  U_FrmPrincipal;

{$R *.dfm}

procedure TDtmConexao.DataModuleCreate(Sender: TObject);
begin
  IdFTP1.AutoLogin := True;
  IdFTP1.Host := 'ftp.rwsoftware.com.br';
  IdFTP1.Username := 'rwsoft';
  IdFTP1.Password := 'V3$t!bul@r9';

  UsuarioLogado := TUsuario.Create;
  AdoConn.Connected := False;
  try
    // SQL SERVER
    {AdoConn.ConnectionString := 'Provider=SQLOLEDB.1;'+
                                'Password=POKER;'+
                                'Persist Security Info=True;'+
                                'User ID=POKER;'+
                                'Initial Catalog=SYSPOKER;'+
                                'Data Source=localhost\SQLEXPRESS';}

    AdoConn.ConnectionString := 'Provider=MSDASQL.1;'+
                                'Persist Security Info=False;'+
                                'Data Source=rwsoft_despa';

    AdoConn.Connected := True;
    setDataBanco;

    //Application.CreateForm(TFrmLogin, FrmLogin);

    {if (verificarVersao) and (exibeMensagem('Existe uma vers�o nova no servidor. Deseja Atualizar?', tmPergunta)=IDYES) then
      begin
        WinExec('UPDATER.EXE SGD',SW_NORMAL);
        Application.Terminate;
      end
      else
    }
        Application.CreateForm(TfrmPrincipal, frmPrincipal);
  except
    on E:Exception do
    begin
      exibeMensagem('Ocorreu o seguinte erro: ' + #13 + e.Message, tmErro);
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
      //Application.Terminate;
    end;
  end;

  {try
    AdoConnWeb.Connected := False;
    AdoConnWeb.ConnectionString := 'Provider=MSDASQL.1;'+
                                   'Persist Security Info=False;'+
                                   'Data Source=rwsoft_despa_w';
    AdoConnWeb.Connected := True;
  except
    //
  end;
  }
end;

procedure TDtmConexao.setDataBanco;
begin
  QryAux.Close;
  QryAux.SQL.Text := 'select current_date;';
  QryAux.Open;
  setDataDB(QryAux.Fields[0].AsDateTime);

end;

function TDtmConexao.verificarVersao: boolean;
var
  ini: TIniFile;
  strVersaoServidor, strVersaoAtual:string;
begin
  Result := False;
  Try
    Try
      DeleteFile('C:\SISTEMAS.ini');

      IdFTP1.Connect;
      IdFTP1.ChangeDir('sistemas');
      IdFTP1.Get('SISTEMAS.ini', 'C:\SISTEMAS.ini',True, False);
      ini := TIniFile.Create('C:\SISTEMAS.ini');
      strVersaoServidor := StringReplace(ini.ReadString('SGD', 'versao', ''),'.','',[rfReplaceAll]);
      strVersaoAtual := StringReplace(VersaoExe,'.','',[rfReplaceAll]);

      Result := strVersaoServidor > strVersaoAtual;
    Finally
      IdFTP1.Disconnect;
    end;
  Except
    on E : exception do
    begin
      //raise Exception.Create('Erro ao conectar FTP' + #13 + 'Mensagem : ' +E.Message + #13 + 'Classe ' + E.ClassName );
    end;
  end;
end;

end.
