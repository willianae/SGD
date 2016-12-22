unit U_TEmpresa;

interface

uses
  U_TEndereco;

type TEmpresa = class
  private
    Fnaturalidade: string;
    Frg: string;
    FdataNascimento: string;
    Fpai: string;
    Fid: Integer;
    Flogo: string;
    Fnome: string;
    Fendereco: TEndereco;
    Fmae: string;
    Fprofissao: string;
    FtelefoneFixo: string;
    FrazaoSocial: string;
    FtelefoneCelular: string;
    procedure SetdataNascimento(const Value: string);
    procedure Setendereco(const Value: TEndereco);
    procedure Setid(const Value: Integer);
    procedure Setlogo(const Value: string);
    procedure Setmae(const Value: string);
    procedure Setnaturalidade(const Value: string);
    procedure Setnome(const Value: string);
    procedure Setpai(const Value: string);
    procedure Setprofissao(const Value: string);
    procedure Setrg(const Value: string);
    procedure SetrazaoSocial(const Value: string);
    procedure SettelefoneCelular(const Value: string);
    procedure SettelefoneFixo(const Value: string);
    public
      property id:Integer read Fid write Setid;
      property nome:string read Fnome write Setnome;
      property naturalidade:string read Fnaturalidade write Setnaturalidade;
      property pai:string read Fpai write Setpai;
      property mae:string read Fmae write Setmae;
      property dataNascimento:string read FdataNascimento write SetdataNascimento;
      property endereco:TEndereco read Fendereco write Setendereco;
      property rg:string read Frg write Setrg;
      property profissao:string read Fprofissao write Setprofissao;
      property logo:string read Flogo write Setlogo;
      property telefoneFixo:string read FtelefoneFixo write SettelefoneFixo;
      property telefoneCelular:string read FtelefoneCelular write SettelefoneCelular;
      property razaoSocial:string read FrazaoSocial write SetrazaoSocial;
end;

implementation

{ TEmpresa }

procedure TEmpresa.SetdataNascimento(const Value: string);
begin
  FdataNascimento := Value;
end;

procedure TEmpresa.Setendereco(const Value: TEndereco);
begin
  Fendereco := Value;
end;

procedure TEmpresa.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TEmpresa.Setlogo(const Value: string);
begin
  Flogo := Value;
end;

procedure TEmpresa.Setmae(const Value: string);
begin
  Fmae := Value;
end;

procedure TEmpresa.Setnaturalidade(const Value: string);
begin
  Fnaturalidade := Value;
end;

procedure TEmpresa.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TEmpresa.Setpai(const Value: string);
begin
  Fpai := Value;
end;

procedure TEmpresa.Setprofissao(const Value: string);
begin
  Fprofissao := Value;
end;

procedure TEmpresa.SetrazaoSocial(const Value: string);
begin
  FrazaoSocial := Value;
end;

procedure TEmpresa.Setrg(const Value: string);
begin
  Frg := Value;
end;

procedure TEmpresa.SettelefoneCelular(const Value: string);
begin
  FtelefoneCelular := Value;
end;

procedure TEmpresa.SettelefoneFixo(const Value: string);
begin
  FtelefoneFixo := Value;
end;

end.
