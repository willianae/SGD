unit U_BibliotecaFuncoes;

interface

uses
   Forms, Windows, SysUtils, Dialogs, StdCtrls, U_TCodDesc, Vcl.Controls;

type TPosicaoPreenchimento = (ppDireita, ppEsquerda);

type TTipoMensagem = (tmErro, tmAviso, tmInformacao, tmPergunta);

type TTipoOperacao = (toAlterar, toInserir, toConsultar, toCadastroRapido);

function exibeMensagem(AMensagem:string; ATipoMensagem: TTipoMensagem; AControlFocus: TWinControl = nil; AAbortar: Boolean = false):integer;

function  criptografar(senha:string):string;
function  descriptografar(senha:string):string;

function Cripto(pStr: String; key: Char = 'C'): string;

function completaStringCaracteres(Texto: string; Caractere: Char; TamanhoFinalString: Integer; Posicao: TPosicaoPreenchimento): string;

function teclas( key:Char):boolean;
procedure KeyPressCampoValor(var Key: Char);

procedure setDataDB(AData :TDateTime);

procedure carregaCombo(ATabela: string; var ACombo: TComboBox);
function  getDescricao(ATabela: string; ACodigo:Integer):string;
procedure selecionarCombo(ACodigo:Integer; var ACombo:TComboBox);
function gerarSenha:string;
function getSituacaoExtenso(ASituacao:string):string;
function validaCPFCNPJ(sCPFCNPJ:string):Boolean;
function IsCPF(S: string): boolean;
function IsCNPJ(S: string): boolean;
function RemoveFormatacao(const Texto: string): string;
function FormataMascaraCPForCNPJ(const S: string): string;
function ValidaMascaraData(AData:string):boolean;
Function VersaoExe: String;
var
  s: string[255];
  c: array[0..255] of Byte absolute s;
  DataDB: TDateTime;

implementation

uses
  U_DtmConexao;

function exibeMensagem(AMensagem:string; ATipoMensagem: TTipoMensagem; AControlFocus: TWinControl; AAbortar: Boolean):integer;
var
  vIcone: integer;
begin
  vIcone := MB_ICONASTERISK;
  if ATipoMensagem = tmPergunta then
  begin
    Result := Application.MessageBox(PChar(AMensagem), 'SGD', MB_ICONQUESTION + MB_YESNO);
  end
  else
  begin
    if ATipoMensagem = tmErro then
      vIcone := MB_ICONERROR
    else
    if ATipoMensagem = tmAviso then
      vIcone := MB_ICONWARNING
    else
    if ATipoMensagem = tmInformacao then
      vIcone := MB_ICONASTERISK;

    Result := Application.MessageBox(PChar(AMensagem), 'SGD', vIcone + MB_OK);
    if Assigned(AControlFocus) then
      if (AControlFocus.Visible) and (AControlFocus.Enabled) then
        AControlFocus.SetFocus;

    if AAbortar then
      Abort;

  end;
end;

function criptografar(senha:string):string;
var
  i:Integer;
begin
  S := senha;
  For i:=1 to ord(s[0]) do
    c[i] := 23 Xor c[i];

  Result := s;
end;

function descriptografar(senha:string):string;
var
  i:Integer;
begin
  S := senha;
  For i:=1 to Length(s) do
    s[i] := Ansichar(23 Xor ord(c[i]));

  Result := S;
end;

{ *
  * @description: Funcao para Codificar e Descodificar uma String
  *
  * @param:       pStr - string a ser Codificada
  * @param        key - chave = 'C' para criptografar
  e chave = 'D' para decriptografar

  * }
function Cripto(pStr: String; key: Char = 'C'): string;
var
  Index: Integer;
begin
  Result := pStr;
  if key = 'C' then
  begin
    For Index := 1 to Length(pStr) do
    begin
      Result[Index] := chr(Ord(pStr[Index]) + 5);
    end;
  end
  else if key = 'D' then
  begin
    For Index := 1 to Length(pStr) do
    begin
      Result[Index] := chr(Ord(pStr[Index]) - 5);
    end;
  end;
end;

function completaStringCaracteres(Texto: string; Caractere: Char;
                                  TamanhoFinalString: Integer; Posicao: TPosicaoPreenchimento): string;
var
  TextoAuxiliar: string;
  IndexadorTexto: Integer;
begin
  Texto := StringReplace(Texto,',','',[rfReplaceAll]);
  if TamanhoFinalString <= Length(Texto) then
    Result := Copy(Texto, 1, TamanhoFinalString)
  else
  begin
    for IndexadorTexto := 1 to TamanhoFinalString - Length(Texto) do
      TextoAuxiliar := TextoAuxiliar + Caractere;

    if Posicao = ppEsquerda then
      Result := TextoAuxiliar + Texto
    else
      Result := Texto + TextoAuxiliar;
  end;
end;
function teclas( key:Char):boolean;
begin
  Result := False;
  case Key of
    #13 : Result := True; // Enter
    #27 : Result := True; // Escape
    #8  : Result := True; // BackSpace
    #9  : Result := True; // Tab
  end;
end;

procedure KeyPressCampoValor(var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',',', #27, #8]))  then
    Key := #0;
end;

procedure setDataDB(AData :TDateTime);
begin
  DataDB := AData;
end;

procedure carregaCombo(ATabela: string; var ACombo: TComboBox);
var
  vCodDesc: TCodDesc;
begin
  with DtmConexao do
  begin
    ACombo.Items.Clear;
    vCodDesc := TCodDesc.Create(-1,'[SELECIONE]');
    ACombo.Items.AddObject(vCodDesc.descricao, vCodDesc);

    QryAux.Close;
    QryAux.SQL.Text := ' SELECT CODIGO, DESCRICAO FROM ' + ATabela +
                       ' ORDER BY DESCRICAO ';
    QryAux.Open;
    while not QryAux.Eof do
    begin
      vCodDesc := TCodDesc.Create(QryAux.FieldByName('CODIGO').AsInteger, QryAux.FieldByName('DESCRICAO').AsString);
      ACombo.Items.AddObject(vCodDesc.descricao, vCodDesc);
      QryAux.Next;
    end;
    ACombo.ItemIndex := 0;

  end;
end;

function getDescricao(ATabela: string; ACodigo:Integer):string;
begin
  with DtmConexao do
  begin
    QryAux.Close;
    QryAux.SQL.Text := ' SELECT DESCRICAO FROM ' + ATabela +
                       ' WHERE CODIGO = :CODIGO ';
    QryAux.Parameters.ParamByName('CODIGO').Value := ACodigo;
    QryAux.Open;
    if QryAux.IsEmpty then
      Result := ''
    else
      Result := QryAux.Fields[0].AsString;
  end;
end;

procedure selecionarCombo(ACodigo:Integer; var ACombo:TComboBox);
var
  indexOf:integer;
begin
  for indexOf := 0 to ACombo.Items.Count -1 do
  begin
    if TCodDesc(ACombo.Items.Objects[indexOf]).codigo = ACodigo then
    begin
      ACombo.ItemIndex := indexOf;
      Break;
    end;
  end;
end;

function gerarSenha:string;
var
  i: integer;
  strAux:string;
const
  str = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  qtd = 6;
begin
  for i:= 1 to qtd do
  begin
    Randomize;
    strAux := strAux + str[Random(Length(str))+1];
  end;
  Result := strAux;
end;

function getSituacaoExtenso(ASituacao:string):string;
begin
  ASituacao := Copy(ASituacao,1,1);
  if ASituacao = 'A' then
    Result := 'AGUARDANDO'
  else
  if ASituacao = 'E' then
    Result := 'EM PROCESSO'
  else
  if ASituacao = 'C' then
    Result := 'CANCELADO'
  else
  if ASituacao = 'F' then
    Result := 'FINALIZADO'
  else
    Result := '';
end;
function validaCPFCNPJ(sCPFCNPJ:string):Boolean;
begin

   Result := IsCPF(trim(RemoveFormatacao(sCPFCNPJ))) or IsCNPJ(trim(RemoveFormatacao(sCPFCNPJ)));;
end;


function IsCPF(S: string): boolean;
var
  Soma: integer;
  I, CalcDig1, CalcDig2: byte;
  tmp_cpf: string;
const
  INVALIDOS: array[0..9] of string = ('00000000000', '11111111111', '22222222222', '33333333333',
                                      '44444444444', '55555555555', '66666666666', '77777777777',
                                      '88888888888', '99999999999');
begin
  Result := false;
  tmp_cpf:= trim(RemoveFormatacao(S));

  if trim(tmp_cpf) = '' then
  begin
    result:= true;
    exit;
  end;
  try

    for I := 0 to 9 do

    begin
      if Pos(Trim(tmp_cpf),INVALIDOS[I]) <> 0 then
        Exit;
    end;

    { Obtém somente os dígitos }
//    tmp_cpf := Digits(tmp_cpf);  // função Digits... nao é biblioteca

    { Se não tiver 11 dígitos... }
    if Length(tmp_cpf) <> 11 then Exit;

    { Cálculo do 1º dígito }
    Soma := 0;
    for I := 1 to 9 do
      Soma := Soma + StrToInt(tmp_cpf[I]) * (11 - I);

    CalcDig1 := 11 - (Soma mod 11);
    if CalcDig1 in [10, 11] then
      CalcDig1 := 0;

    { Cálculo do 2º dígito }
    Soma := 0;
    for I := 1 to 10 do
      Soma := Soma + StrToInt(tmp_cpf[I]) * (12 - I);

    CalcDig2 := 11 - (Soma mod 11);
    if CalcDig2 in [10, 11] then
      CalcDig2 := 0;

    Result := (CalcDig1 = StrToInt(tmp_cpf[10])) and
      (CalcDig2 = StrToInt(tmp_cpf[11]));

  Except
    raise;
  end;

end;
function IsCNPJ(S: string): boolean;
var
  Soma: integer;
  I, CalcDig1, CalcDig2: byte;
  tmp_cnpj: string;
begin
  Result := false;
  tmp_cnpj:= trim(RemoveFormatacao(s));

  if trim(tmp_cnpj) = '' then
  begin
    result:= true;
    exit;
  end;
  try
    { Obtém somente os dígitos }
//    tmp_cnpj := Digits(tmp_cnpj);  // função Digits... nao é biblioteca

    { Se não tiver 14 dígitos... }
    if Length(tmp_cnpj) <> 14 then Exit;

    { Cálculo do 1º dígito }
    Soma := 0;
    for I := 1 to 4 do
      Soma := Soma + StrToInt(tmp_cnpj[I]) * (6 - I);
    for I := 1 to 8 do
      Soma := Soma + StrToInt(tmp_cnpj[I + 4]) * (10 - I);

    CalcDig1 := 11 - (Soma mod 11);
    if CalcDig1 in [10, 11] then
      CalcDig1 := 0;

    { Cálculo do 2º dígito }
    Soma := 0;
    for I := 1 to 5 do
      Soma := Soma + StrToInt(tmp_cnpj[I]) * (7 - I);
    for I := 1 to 8 do
      Soma := Soma + StrToInt(tmp_cnpj[I + 5]) * (10 - I);

    CalcDig2 := 11 - (Soma mod 11);
    if CalcDig2 in [10, 11] then
      CalcDig2 := 0;

    Result := (CalcDig1 = StrToInt(tmp_cnpj[13])) and
              (CalcDig2 = StrToInt(tmp_cnpj[14]));
  Except
    raise;
  end;
end;

function IsCPForCNPJ(const S: string): boolean;
begin

end;

function RemoveFormatacao(const Texto: string): string;
var
  strAux: string;
begin
  Result:= '';
  strAux:= trim(texto);
  if strAux <> '' then
  begin
    strAux := StringReplace(strAux,'-','',[rfReplaceAll]);
    strAux := StringReplace(strAux,'/','',[rfReplaceAll]);
    strAux := StringReplace(strAux,'.','',[rfReplaceAll]);
    strAux := StringReplace(strAux,'_','',[rfReplaceAll]);
    strAux := StringReplace(strAux,'(','',[rfReplaceAll]);
    strAux := StringReplace(strAux,')','',[rfReplaceAll]);

    Result:= trim(strAux);
  end;
end;
function FormataMascaraCPForCNPJ(const S: string): string;
var
  tmp_cpf_cnpj: string;
begin
  tmp_cpf_cnpj:= trim(S);

  case Length(tmp_cpf_cnpj) of
    11: Result := Copy(tmp_cpf_cnpj, 1, 3) + '.' +
                  Copy(tmp_cpf_cnpj, 4, 3) + '.' +
                  Copy(tmp_cpf_cnpj, 7, 3) + '-' +
                  Copy(tmp_cpf_cnpj, 10, 2);
    14: Result := Copy(S, 1, 2) + '.' +
                  Copy(S, 3, 3) + '.' +
                  Copy(S, 6, 3) + '/' +
                  Copy(S, 9, 4) + '-' +
                  Copy(S, 13, 2);
  else
    Result := S;
  end;
end;

function ValidaMascaraData(AData:string):boolean;
var
  dataAux:TDateTime;
begin
  Result := (Trim(StringReplace(AData,'/','',[rfReplaceAll])) = '') or (TryStrToDate(AData, dataAux));
end;

Function VersaoExe: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F : PFFI;
  Handle : Dword;
  Len : Longint;
  Data : Pchar;
  Buffer : Pointer;
  Tamanho : Dword;
  Parquivo: Pchar;
  Arquivo : String;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data:=StrAlloc(Len+1);
    if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
    begin
      VerQueryValue(Data, '\',Buffer,Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d',
      [HiWord(F^.dwFileVersionMs),
      LoWord(F^.dwFileVersionMs),
      HiWord(F^.dwFileVersionLs),
      Loword(F^.dwFileVersionLs)]
      );
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

end.

