inherited FrmCadastroSituacao: TFrmCadastroSituacao
  Caption = 'Situa'#231#227'o'
  FormStyle = fsMDIChild
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgctrlPrincipal: TPageControl
    inherited tbsConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 846
      ExplicitHeight = 319
      inherited lblPesquisa: TLabel
        Width = 37
        Caption = 'C'#243'digo:'
        ExplicitWidth = 37
      end
      inherited pnlConsulta: TPanel
        inherited dbgrdConsulta: TDBGrid
          OnDrawColumnCell = dbgrdConsultaDrawColumnCell
          OnDblClick = dbgrdConsultaDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'codigo'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 357
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Cor'
              Visible = True
            end>
        end
        inherited pnlBotoesAcoes: TPanel
          inherited btnAlterar: TBitBtn
            OnClick = btnAlterarClick
          end
          inherited btnExcluir: TBitBtn
            OnClick = btnExcluirClick
          end
        end
      end
      inherited edtPesquisa: TEdit
        Left = 85
        CharCase = ecUpperCase
        OnChange = edtPesquisaChange
        OnKeyPress = edtPesquisaKeyPress
        ExplicitLeft = 85
      end
    end
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 846
      ExplicitHeight = 319
      inherited pnlBotoesLateral: TPanel
        ExplicitHeight = 319
        inherited btnSalvar: TBitBtn
          OnClick = btnSalvarClick
        end
        inherited btnCancelar: TBitBtn
          OnClick = btnCancelarClick
        end
      end
      inherited pnlCorpo: TPanel
        ExplicitHeight = 319
        object Label2: TLabel
          Left = 168
          Top = 72
          Width = 38
          Height = 13
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 168
          Top = 125
          Width = 55
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCodigo: TEdit
          Left = 168
          Top = 87
          Width = 46
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 0
        end
        object edtDescricao: TEdit
          Left = 168
          Top = 141
          Width = 417
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 1
          OnKeyPress = edtDescricaoKeyPress
        end
        object btnEscolheCor: TBitBtn
          Left = 207
          Top = 168
          Width = 75
          Height = 25
          Caption = 'Escolhe Cor'
          TabOrder = 2
          OnClick = btnEscolheCorClick
        end
        object pnlCor: TPanel
          Left = 168
          Top = 168
          Width = 33
          Height = 25
          Color = clWhite
          ParentBackground = False
          TabOrder = 3
        end
      end
    end
  end
  inherited dsConsulta: TDataSource
    DataSet = DtmDadosSituacao.cdsPesquisa
  end
  object dlgColor: TColorDialog
    Color = clBlue
    CustomColors.Strings = (
      'ColorA=FFFFFFFF'
      'ColorB=FFFFFFFF'
      'ColorC=FFFFFFFF'
      'ColorD=FFFFFFFF'
      'ColorE=FFFFFFFF'
      'ColorF=FFFFFFFF'
      'ColorG=FFFFFFFF'
      'ColorH=FFFFFFFF'
      'ColorI=FFFFFFFF'
      'ColorJ=FFFFFFFF'
      'ColorK=FFFFFFFF'
      'ColorL=FFFFFFFF'
      'ColorM=FFFFFFFF'
      'ColorN=FFFFFFFF'
      'ColorO=FFFFFFFF'
      'ColorP=FFFFFFFF')
    Left = 460
    Top = 216
  end
end
