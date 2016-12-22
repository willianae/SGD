unit U_DtmDadosEmpresa;

interface

uses
  System.SysUtils, System.Classes, U_DtmPadrao, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB,U_TEmpresa;

type
  TDtmDadosEmpresa = class(TDtmPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
   // procedure excluir(ICodigo:Integer);
    procedure salvar(Empresa:TEmpresa);
    procedure listar;
  end;

var
  DtmDadosEmpresa: TDtmDadosEmpresa;
const
  SQL_SELECT_EMPRESA = ' SELECT * FROM EMPRESA ';
  SQL_UPDATE_EMPRESA =
   ' UPDATE empresa                              '+#13+
   '    SET nome=:nome,                          '+#13+
   '    naturalidade=:naturalidade,              '+#13+
   '    pai=:pai,                                '+#13+
   '    mae=:mae,                                '+#13+
   '    datanascimento=:datanascimento,          '+#13+
   '    logradouro=:logradouro,                  '+#13+
   '     numero=:numero,                         '+#13+
   '     bairro=:bairro,                         '+#13+
   '     cidade=:cidade,                         '+#13+
   '     rg=:rg,                                 '+#13+
   '     profissao=:profissao,                   '+#13+
   '     logo = :logo,                           '+#13+
   '     uf = :uf,                               '+#13+
   '     telefone_celular= :telefone_celular,    '+#13+
   '     telefone_fixo= :telefone_fixo,          '+#13+
   '     razao_social= :razao_social             '+#13+
   '  WHERE codigo = :codigo                     ';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmDadosEmpresa }


{ TDtmDadosEmpresa }



procedure TDtmDadosEmpresa.listar;
begin
   try
     QryPesquisa.SQL.Text := SQL_SELECT_EMPRESA;
     cdsPesquisa.Open;
   except
     raise;
   end;
end;

procedure TDtmDadosEmpresa.salvar(Empresa: TEmpresa);
begin
  try
    QryAux.Close;
    QryAux.SQL.Text := SQL_UPDATE_EMPRESA;
    QryAux.Parameters.ParamByName('CODIGO').Value             := Empresa.id;
    QryAux.Parameters.ParamByName('nome').Value               := Empresa.nome;
    QryAux.Parameters.ParamByName('naturalidade').Value       := Empresa.naturalidade;
    QryAux.Parameters.ParamByName('pai').Value                := Empresa.pai;
    QryAux.Parameters.ParamByName('mae').Value                := Empresa.mae;
    QryAux.Parameters.ParamByName('logradouro').Value         := Empresa.endereco.rua;
    QryAux.Parameters.ParamByName('numero').Value             := Empresa.endereco.numero;
    QryAux.Parameters.ParamByName('cidade').Value             := Empresa.endereco.cidade;
    QryAux.Parameters.ParamByName('bairro').Value             := Empresa.endereco.bairro;
    QryAux.Parameters.ParamByName('uf').Value                 := Empresa.endereco.uf;
    QryAux.Parameters.ParamByName('rg').Value                 := Empresa.rg;
    QryAux.Parameters.ParamByName('profissao').Value          := Empresa.profissao;
    QryAux.Parameters.ParamByName('logo').Value               := Empresa.logo;
    QryAux.Parameters.ParamByName('razao_social').Value       := Empresa.razaoSocial;
    QryAux.Parameters.ParamByName('telefone_fixo').Value      := Empresa.telefoneFixo;
    QryAux.Parameters.ParamByName('telefone_celular').Value   := Empresa.telefoneCelular;
    QryAux.Parameters.ParamByName('datanascimento').Value     := Empresa.dataNascimento;
    QryAux.ExecSQL;
  except
    raise;
  end;
end;

end.
