inherited FrmCadastroEmpresa: TFrmCadastroEmpresa
  Caption = 'Empresa'
  ClientHeight = 652
  ClientWidth = 710
  OnDestroy = FormDestroy
  ExplicitWidth = 716
  ExplicitHeight = 681
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgctrlPrincipal: TPageControl
    Width = 710
    Height = 565
    ActivePage = tbsCadastro
    ExplicitWidth = 710
    ExplicitHeight = 565
    inherited tbsCadastro: TTabSheet [0]
      Caption = 'Dados Empresa'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 702
      ExplicitHeight = 537
      inherited pnlCorpo: TPanel [0]
        Width = 616
        Height = 537
        ExplicitWidth = 616
        ExplicitHeight = 537
        object lbl1: TLabel
          Left = 32
          Top = 139
          Width = 60
          Height = 13
          Caption = 'Raz'#227'o Social'
        end
        object lbl2: TLabel
          Left = 32
          Top = 185
          Width = 61
          Height = 13
          Caption = 'Naturalidade'
        end
        object lbl3: TLabel
          Left = 32
          Top = 225
          Width = 14
          Height = 13
          Caption = 'Pai'
        end
        object lbl4: TLabel
          Left = 32
          Top = 280
          Width = 20
          Height = 13
          Caption = 'M'#227'e'
        end
        object lbl5: TLabel
          Left = 258
          Top = 184
          Width = 96
          Height = 13
          Caption = 'Data de Nascimento'
        end
        object lbl6: TLabel
          Left = 371
          Top = 181
          Width = 14
          Height = 13
          Caption = 'RG'
        end
        object lbl7: TLabel
          Left = 32
          Top = 369
          Width = 55
          Height = 13
          Caption = 'Logradouro'
        end
        object lbl8: TLabel
          Left = 469
          Top = 375
          Width = 12
          Height = 13
          Caption = 'N'#186
        end
        object lbl9: TLabel
          Left = 37
          Top = 417
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object lbl10: TLabel
          Left = 232
          Top = 417
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object lbl11: TLabel
          Left = 32
          Top = 322
          Width = 44
          Height = 13
          Caption = 'Profiss'#227'o'
        end
        object lbl12: TLabel
          Left = 32
          Top = 38
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object btnCarregarLogo: TSpeedButton
          Left = 503
          Top = 70
          Width = 23
          Height = 22
          Hint = 'Carregar logo'
          Caption = '...'
          OnClick = btnCarregarLogoClick
        end
        object lbl13: TLabel
          Left = 469
          Top = 417
          Width = 13
          Height = 13
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl14: TLabel
          Left = 32
          Top = 93
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object lbl15: TLabel
          Left = 32
          Top = 462
          Width = 63
          Height = 13
          Caption = 'Telefone fixo'
        end
        object lbl16: TLabel
          Left = 231
          Top = 463
          Width = 76
          Height = 13
          Caption = 'Telefone celular'
        end
        object edtRazaoSocial: TEdit
          Left = 32
          Top = 158
          Width = 493
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 80
          TabOrder = 1
        end
        object edtNaturalidade: TEdit
          Left = 32
          Top = 204
          Width = 201
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object edtPai: TEdit
          Left = 32
          Top = 251
          Width = 493
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
        end
        object edtMae: TEdit
          Left = 32
          Top = 299
          Width = 493
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 6
        end
        object edtRg: TEdit
          Left = 371
          Top = 200
          Width = 121
          Height = 21
          TabOrder = 4
        end
        object edtLogradouro: TEdit
          Left = 32
          Top = 394
          Width = 425
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 8
        end
        object edtNumero: TEdit
          Left = 463
          Top = 394
          Width = 58
          Height = 21
          TabOrder = 9
        end
        object edtCidade: TEdit
          Left = 33
          Top = 438
          Width = 170
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 10
        end
        object edtBairro: TEdit
          Left = 232
          Top = 436
          Width = 201
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 11
        end
        object edtProfissao: TEdit
          Left = 32
          Top = 342
          Width = 493
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 7
        end
        object edtCodigo: TEdit
          Left = 32
          Top = 57
          Width = 73
          Height = 21
          Color = clInactiveCaption
          Enabled = False
          TabOrder = 15
        end
        object cbbUF: TComboBox
          Left = 463
          Top = 436
          Width = 57
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 12
          Text = '[SELEC]'
          Items.Strings = (
            '[SELEC]'
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
        end
        object edtNome: TEdit
          Left = 32
          Top = 112
          Width = 493
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object medtDataEmissao: TMaskEdit
          Left = 258
          Top = 203
          Width = 73
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
        end
        object medtTelefoneCelular: TMaskEdit
          Left = 234
          Top = 482
          Width = 93
          Height = 21
          EditMask = '!\(99\)99999-9999;1;_'
          MaxLength = 14
          TabOrder = 14
          Text = '(  )     -    '
        end
        object medtTelefoneFixo: TMaskEdit
          Left = 34
          Top = 482
          Width = 93
          Height = 21
          EditMask = '!\(99\)9999-9999;1;_'
          MaxLength = 13
          TabOrder = 13
          Text = '(  )    -    '
        end
        object GroupBox1: TGroupBox
          Left = 378
          Top = 1
          Width = 116
          Height = 107
          Caption = 'Logo'
          TabOrder = 16
          object imgLogoEmpresa: TImage
            Left = 12
            Top = 13
            Width = 93
            Height = 92
            Hint = 'Clique aqui para carregar a imagem...'
            Stretch = True
          end
        end
      end
      inherited pnlBotoesLateral: TPanel [1]
        Left = 616
        Height = 537
        ExplicitLeft = 616
        ExplicitHeight = 537
        inherited btnSalvar: TBitBtn
          OnClick = btnSalvarClick
        end
        inherited btnCancelar: TBitBtn
          Visible = False
        end
      end
    end
    inherited tbsConsulta: TTabSheet [1]
      Enabled = False
      TabVisible = False
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 702
      ExplicitHeight = 537
      inherited pnlConsulta: TPanel
        Top = 260
        Width = 702
        ExplicitTop = 260
        ExplicitWidth = 702
        inherited dbgrdConsulta: TDBGrid
          Width = 614
        end
        inherited pnlBotoesAcoes: TPanel
          Left = 615
          ExplicitLeft = 615
        end
      end
    end
  end
  inherited pnlBotoes: TPanel
    Top = 584
    Width = 710
    ExplicitTop = 584
    ExplicitWidth = 710
    inherited btnSair: TBitBtn
      Left = 536
      Top = 8
      ExplicitLeft = 536
      ExplicitTop = 8
    end
  end
  inherited stbResumo: TStatusBar
    Top = 565
    Width = 710
    ExplicitTop = 565
    ExplicitWidth = 710
  end
  object dlgOpenPic1: TOpenPictureDialog
    Left = 356
    Top = 64
  end
end
