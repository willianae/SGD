inherited FrmCadastroServico: TFrmCadastroServico
  Left = 199
  Caption = 'Servi'#231'o'
  ClientHeight = 465
  ClientWidth = 985
  FormStyle = fsMDIChild
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  ExplicitTop = -16
  ExplicitWidth = 991
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgctrlPrincipal: TPageControl
    Width = 985
    Height = 378
    ActivePage = tbsCadastro
    ExplicitWidth = 985
    ExplicitHeight = 378
    inherited tbsConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 977
      ExplicitHeight = 350
      inherited lblPesquisa: TLabel
        Left = 12
        Top = 8
        Width = 30
        Caption = 'Placa'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 12
        ExplicitTop = 8
        ExplicitWidth = 30
      end
      object Label2: TLabel [1]
        Left = 679
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel [2]
        Left = 384
        Top = 8
        Width = 86
        Height = 13
        Caption = 'Tipo de Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaTipoServico2: TSpeedButton [3]
        Left = 421
        Top = 22
        Width = 23
        Height = 22
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFEFEFE
          FBFBFBF7F7F7F3F3F3EFEFEFEBEBEBE8E8E8E6E6E6E5E5E5E4E4E4E4E4E4F8F8
          F8BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFAFAFAF9F9F9F7F7F7F6
          F6F6F5F5F5F5F5F5F6F6F6FFFFFF5858583C3C3C606060FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6060604141
          41646464808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF606060404040646464848484FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7F6F6D5D6D8D4D5DAD3D5DAD5D6D8FFFFFFACACAC2D2D2D6464648484
          84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D0E0E4EBEFE7D3E3D4B1E2D3B0EA
          E1CCDFE2E8BEBEBE878787878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFD0
          F7F8FBDBC492F0DDBDFAF0E2FEF9F5F9F5EADDCCA2F3F4F7D7D7D8FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF8F8F9E3E7EDDBC38EF5E0C5F2E4CBF6EAD7F9F2E8FE
          FCFAFFFFFFDDCB9FDDDFE6F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFCFD0D3F3ECD8
          EAD0A9F6E9D4F5E6D1F5EAD8F7EFE3FBF6EEFBF8F3F9F1E4EAE1CCD6D7D9FFFF
          FFFFFFFFFFFFFFFFFFFFCED1D5E8D5ACF8E9D6F6EBDAF5E8D3F5E7D4F7EBDAF7
          EEDFF8EFE0FBF3E8E2D2AFD4D6DBFFFFFFFFFFFFFFFFFFFFFFFFCED1D5E7D4AB
          F9EDDFF8F0E1F6EAD7F6E8D3F4E8D4F4E7D3F4E6D0F8EAD8E3D3AFD4D6DBFFFF
          FFFFFFFFFFFFFFFFFFFFCFD0D2F5ECD7EDD7B6FBF6EDF8EFDFF6EAD7F5E7D2F4
          E5CCF1DFC4EEDAB8EEE6D3D5D6D8FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E6E9F0
          DABF85FCF2E8FBF5EDF8F0E1F6EBD9F7E9D6F6E2C5DBC390E0E4ECF7F7F7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D1F9FAFDDBC086EDD7B7F9EEE0F8EBDAEB
          D3ACDBC38FF7F8FAD0D0D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D1D1D1E3E8EFF5EDD7E8D5ADE8D6AEF4ECD8E3E7EED0D0D1FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8CFD0D2CED0D5CED0D5CE
          D0D2F9F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = btnConsultaTipoServico2Click
      end
      object Label8: TLabel [4]
        Left = 80
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited pnlConsulta: TPanel
        Top = 74
        Width = 977
        Height = 276
        TabOrder = 6
        ExplicitTop = 74
        ExplicitWidth = 977
        ExplicitHeight = 276
        inherited dbgrdConsulta: TDBGrid
          Width = 889
          Height = 274
          OnDrawColumnCell = dbgrdConsultaDrawColumnCell
          OnDblClick = dbgrdConsultaDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'codigo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'cod_veiculo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'cod_tipo_servico'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'placa'
              Title.Caption = 'Placa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Cliente'
              Width = 238
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo_servico'
              Title.Caption = 'Tipo de Servi'#231'o'
              Width = 203
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Title.Caption = 'Valor'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'situacao'
              Title.Caption = 'Situa'#231#227'o'
              Width = 139
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cod_usuario'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'senha'
              Title.Caption = 'Senha'
              Width = 86
              Visible = True
            end>
        end
        inherited pnlBotoesAcoes: TPanel
          Left = 890
          Height = 274
          ExplicitLeft = 890
          ExplicitHeight = 274
          inherited btnAlterar: TBitBtn
            OnClick = btnAlterarClick
          end
          inherited btnExcluir: TBitBtn
            Visible = False
            OnClick = btnExcluirClick
          end
        end
      end
      inherited edtPesquisa: TEdit
        Left = 212
        Top = -76
        Width = 125
        CharCase = ecUpperCase
        TabOrder = 7
        Visible = False
        ExplicitLeft = 212
        ExplicitTop = -76
        ExplicitWidth = 125
      end
      object btnPesquisar: TBitBtn
        Left = 881
        Top = 16
        Width = 89
        Height = 40
        Caption = '&Pesquisar'
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF5F5F5F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFAFAFA75757581817FE8E8E8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7F7F7747474BEBCB9F5F4F2A1A19FE7E7E7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF5F5F5737373C3C1BEE1DFDDFFFFFDFFFFFFC9C9C8FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
          F3F3737373C5C5C2D7D5D4FCFCFAF2F2F1F3F2F2FCFCFCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F374
          7272C5C4C2CAC8C5ECEAEAEAE9E7F6F6F5FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6757575C7
          C5C4BCBAB7D7D5D5DFDDDCFDFBFBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB797979C7C7C4AC
          AAA7C0BFBDD4D2D0FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7E7EC3C1BF9D9C98A8
          A5A2C8C7C5FFFFFFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADB9B9B79794908F8D8AC5
          C4C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECECCECECEBCBCBCBBBBBBCCCC
          CCECECECFFFFFFFFFFFFFFFFFFFFFFFFC1C1C1ABABA995928F787572CDCCCAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFD6D6D68080805D5D5F8C8C8CACACACB1B1B19A9C
          9C6E6E70696969CECECEFFFFFFE5E5E59B9B99A29F9D6B6865DAD8D7FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F9F99C9C9C6B6B6BE9E5E5FFFFFFFFFDF1FFF2E1FFF1DFFFFA
          EAFFFFFFFFFFFF9999998484848E8E8ED8D5D494928FEDEBEAFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFAFAFA838383AAAAACFFFFFFFFE2CDFFC4A7FFC4A4FFCAA8FFCAAAFFC5
          A5FFC2A4FFD4BDFFFFFFDDDCDCABA8A8CFCCCAF1F0F0FFFFFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF9D9D9DB1B1B2FFFFFCFFCAAFFFCCAAFFDFBFFFECCCFFF2D0FFF2D0FFEF
          CDFFE4C4FFD0AFFFBFA0FFF4E5F5F2F2727070FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          DBDBDB7A7B7CFFFFFAFFD1B8FFE3C7FFF3D4FFFCDAFFFFE2FFFFE5FFFFE5FFFF
          E2FFFDDDFFF3D2FFDEBFFFC0A3FFF9EBC3C3C3C6C5C5FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          808080EDE6E3FFDECDFFF1DDFFFFEAFFFFEBFFFFEDFFFFEFFFFFF2FFFFF2FFFF
          F0FFFFEEFFFFE6FFF7DBFFE0C6FFCDB5FFFFFFA1A0A0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6
          777778FFEDE2FFECDCFFFFFCFFFFFAFFFFF9FFFFF6FFFFF7FFFFF8FFFFF8FFFF
          F7FFFFF5FFFFF0FFFFE8FFF2DCFFD8C2FFECE0C7C7C7E0E0DFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
          A6A4A4FFE2D7FFFFFDFFFFFFFFFFFFFFFFFFFFFFFBFFFFF9FFFFFBFFFFFBFFFF
          FAFFFFF9FFFFF7FFFFF1FFFBE7FFE8D5FFE2D3EAE1E0BDBCBCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4
          BDB7B6FEE2D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFBFFFFFCFFFFFCFFFF
          FCFFFFFBFFFFFAFFFFF6FFFFEEFFF2E2FFE6D8EFE0DCADACACFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E
          B9B3B2F9E2DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFDFFFFFDFFFFFDFFFF
          FDFFFFFCFFFFFBFFFFF8FFFFF2FFF5E9FFEBE1E2D3CFADACACFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8
          A4A4A4EDDBD4FFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFDFFFFFDFFFF
          FDFFFFFDFFFFFCFFFFF9FFFFF5FFF7EEFFEEE7C8BDBBB4B3B3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2
          919192D7C9C5FFFFFFFFFFFEFFFFFDFFFFFFFFFFFFFFFFFFFFFFFDFFFFFEFFFF
          FDFFFFFDFFFFFCFFFFFAFFFEF7FFFAF3F6EAE5A29E9ECCCBCBFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9090909E9794F6EFECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF
          FEFFFFFDFFFFFDFFFFFBFFFDF9FFFCF9CDC2BE9B9B9CF0F0F0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          CDCDCD9D9D9ED2D2D2F9F2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFFFFFEFFFFFDFFFEFDFFFFFEF6F3F2747374B8B6B5FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBFBEBE626264DEDEDEECE9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFE7E7E7EA7A7A7F1F0F0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFCFBFBBFBDBD535354D5D5D5D2D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF3F1F07A7A7A9A9A9CD6D5D5FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF8F8F8C3C1C16868688E8E8ECBCBCBD1D0D0DDDCDBE6E4E4EDEB
          EBE0DEDEA9A9A9434749ABA9A9D7D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFD4D2D1B2B1B16666684444446262626666664F4F
          4F4B4B4D939395BFBDBDEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFADEDDDDCFCDCDBFBEBDBCBABAC8C7
          C7D4D2D1EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 5
        OnClick = btnPesquisarClick
      end
      object cmbSituacaoConsulta: TComboBox
        Left = 679
        Top = 23
        Width = 196
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = '[SELECIONE]'
        Items.Strings = (
          '[SELECIONE]'
          'AGUARDANDO'
          'EM PROCESSO'
          'CANCELADO'
          'FINALIZADO')
      end
      object edtCodTipoServicoConsulta: TEdit
        Left = 384
        Top = 23
        Width = 34
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        NumbersOnly = True
        TabOrder = 2
        OnExit = edtCodTipoServicoConsultaExit
        OnKeyPress = edtDescricaoKeyPress
      end
      object edtDesTipoServicoConsulta: TEdit
        Left = 448
        Top = 23
        Width = 226
        Height = 21
        CharCase = ecUpperCase
        Color = clBtnFace
        Enabled = False
        MaxLength = 30
        TabOrder = 3
        OnKeyPress = edtDescricaoKeyPress
      end
      object edtCliente: TEdit
        Left = 80
        Top = 23
        Width = 298
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object medtPlacaPesquisa: TMaskEdit
        Left = 12
        Top = 23
        Width = 62
        Height = 21
        CharCase = ecUpperCase
        EditMask = 'lll-9999;1;_'
        MaxLength = 8
        TabOrder = 0
        Text = '   -    '
      end
    end
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 977
      ExplicitHeight = 350
      inherited pnlBotoesLateral: TPanel
        Left = 891
        Height = 350
        ExplicitLeft = 891
        ExplicitHeight = 350
        inherited btnSalvar: TBitBtn
          OnClick = btnSalvarClick
        end
        inherited btnCancelar: TBitBtn
          OnClick = btnCancelarClick
        end
      end
      inherited pnlCorpo: TPanel
        Width = 891
        Height = 350
        ExplicitWidth = 891
        ExplicitHeight = 350
        object Label1: TLabel
          Left = 148
          Top = 8
          Width = 86
          Height = 13
          Caption = 'Tipo de Servi'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 610
          Top = 7
          Width = 49
          Height = 13
          Caption = 'Situa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 9
          Top = 47
          Width = 30
          Height = 13
          Caption = 'Placa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 517
          Top = 7
          Width = 74
          Height = 13
          Caption = 'Valor Servi'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnVeiculo: TSpeedButton
          Left = 89
          Top = 61
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFEFEFE
            FBFBFBF7F7F7F3F3F3EFEFEFEBEBEBE8E8E8E6E6E6E5E5E5E4E4E4E4E4E4F8F8
            F8BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFAFAFAF9F9F9F7F7F7F6
            F6F6F5F5F5F5F5F5F6F6F6FFFFFF5858583C3C3C606060FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6060604141
            41646464808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF606060404040646464848484FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF7F6F6D5D6D8D4D5DAD3D5DAD5D6D8FFFFFFACACAC2D2D2D6464648484
            84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D0E0E4EBEFE7D3E3D4B1E2D3B0EA
            E1CCDFE2E8BEBEBE878787878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFD0
            F7F8FBDBC492F0DDBDFAF0E2FEF9F5F9F5EADDCCA2F3F4F7D7D7D8FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF8F8F9E3E7EDDBC38EF5E0C5F2E4CBF6EAD7F9F2E8FE
            FCFAFFFFFFDDCB9FDDDFE6F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFCFD0D3F3ECD8
            EAD0A9F6E9D4F5E6D1F5EAD8F7EFE3FBF6EEFBF8F3F9F1E4EAE1CCD6D7D9FFFF
            FFFFFFFFFFFFFFFFFFFFCED1D5E8D5ACF8E9D6F6EBDAF5E8D3F5E7D4F7EBDAF7
            EEDFF8EFE0FBF3E8E2D2AFD4D6DBFFFFFFFFFFFFFFFFFFFFFFFFCED1D5E7D4AB
            F9EDDFF8F0E1F6EAD7F6E8D3F4E8D4F4E7D3F4E6D0F8EAD8E3D3AFD4D6DBFFFF
            FFFFFFFFFFFFFFFFFFFFCFD0D2F5ECD7EDD7B6FBF6EDF8EFDFF6EAD7F5E7D2F4
            E5CCF1DFC4EEDAB8EEE6D3D5D6D8FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E6E9F0
            DABF85FCF2E8FBF5EDF8F0E1F6EBD9F7E9D6F6E2C5DBC390E0E4ECF7F7F7FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D1F9FAFDDBC086EDD7B7F9EEE0F8EBDAEB
            D3ACDBC38FF7F8FAD0D0D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            D1D1D1E3E8EFF5EDD7E8D5ADE8D6AEF4ECD8E3E7EED0D0D1FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8CFD0D2CED0D5CED0D5CE
            D0D2F9F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Visible = False
        end
        object btnConsultaTipoServico: TSpeedButton
          Left = 185
          Top = 22
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFEFEFE
            FBFBFBF7F7F7F3F3F3EFEFEFEBEBEBE8E8E8E6E6E6E5E5E5E4E4E4E4E4E4F8F8
            F8BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFAFAFAF9F9F9F7F7F7F6
            F6F6F5F5F5F5F5F5F6F6F6FFFFFF5858583C3C3C606060FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6060604141
            41646464808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF606060404040646464848484FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF7F6F6D5D6D8D4D5DAD3D5DAD5D6D8FFFFFFACACAC2D2D2D6464648484
            84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D0E0E4EBEFE7D3E3D4B1E2D3B0EA
            E1CCDFE2E8BEBEBE878787878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFD0
            F7F8FBDBC492F0DDBDFAF0E2FEF9F5F9F5EADDCCA2F3F4F7D7D7D8FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF8F8F9E3E7EDDBC38EF5E0C5F2E4CBF6EAD7F9F2E8FE
            FCFAFFFFFFDDCB9FDDDFE6F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFCFD0D3F3ECD8
            EAD0A9F6E9D4F5E6D1F5EAD8F7EFE3FBF6EEFBF8F3F9F1E4EAE1CCD6D7D9FFFF
            FFFFFFFFFFFFFFFFFFFFCED1D5E8D5ACF8E9D6F6EBDAF5E8D3F5E7D4F7EBDAF7
            EEDFF8EFE0FBF3E8E2D2AFD4D6DBFFFFFFFFFFFFFFFFFFFFFFFFCED1D5E7D4AB
            F9EDDFF8F0E1F6EAD7F6E8D3F4E8D4F4E7D3F4E6D0F8EAD8E3D3AFD4D6DBFFFF
            FFFFFFFFFFFFFFFFFFFFCFD0D2F5ECD7EDD7B6FBF6EDF8EFDFF6EAD7F5E7D2F4
            E5CCF1DFC4EEDAB8EEE6D3D5D6D8FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E6E9F0
            DABF85FCF2E8FBF5EDF8F0E1F6EBD9F7E9D6F6E2C5DBC390E0E4ECF7F7F7FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D1F9FAFDDBC086EDD7B7F9EEE0F8EBDAEB
            D3ACDBC38FF7F8FAD0D0D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            D1D1D1E3E8EFF5EDD7E8D5ADE8D6AEF4ECD8E3E7EED0D0D1FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8CFD0D2CED0D5CED0D5CE
            D0D2F9F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnConsultaTipoServicoClick
        end
        object Label5: TLabel
          Left = 9
          Top = 8
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
        object Label7: TLabel
          Left = 84
          Top = 48
          Width = 68
          Height = 13
          Caption = 'Propriet'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnCadSituacao: TSpeedButton
          Left = 829
          Top = 22
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFCFCFCF8D8D8DCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6464641818180C0C0C1818
            18646464FFFFFFFFFFFFFFFFFFE6E6E60F0F0F00000000000000000000000022
            2222E4E4E4181818000000FFFFFF000000181818CFCFCFFFFFFFFFFFFF878787
            717171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E0C0C0CFFFFFFFFFFFFFFFF
            FF0C0C0C8D8D8DFFFFFFFFFFFF8C8C8C969696D5D5D56E6E6EFFFFFF75757587
            8787DFDFDF181818000000FFFFFF000000181818CFCFCFFFFFFFFFFFFF8C8C8C
            989898989898000000FFFFFF000000000000E3E3E36E6E6E1818180C0C0C1818
            18666666FFFFFFFFFFFFFFFFFF8C8C8C8D8D8DFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFFFFFFE6E6E6969696DCDCDCFFFFFFFFFFFFFFFFFFFFFFFF8C8C8C
            989898979797000000FFFFFF0000000F0F0F0F0F0F0B0B0B373737CDCDCD9D9D
            9D7F7F7FFFFFFFFFFFFFFFFFFF8C8C8C929292E3E3E3969696FFFFFF9F9F9FA8
            A8A8A8A8A8A8A8A89D9D9DE0E0E09191918C8C8CFFFFFFFFFFFFFFFFFF8C8C8C
            929292E3E3E3969696FFFFFF8484848484848585858585857C7C7CDCDCDC9393
            938C8C8CFFFFFFFFFFFFFFFFFF8C8C8C9999998D8D8D000000FFFFFF0000000F
            0F0F0F0F0F0F0F0F0202029898989898988C8C8CFFFFFFFFFFFFFFFFFF8A8A8A
            959595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9595
            958A8A8AFFFFFFFFFFFFFFFFFF9C9C9C2323239595958C8C8C8C8C8C8C8C8C8C
            8C8C8C8C8C8C8C8C8C8C8C9191912323239C9C9CFFFFFFFFFFFFFFFFFFFFFFFF
            9C9C9C8A8A8A8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8B8B8B9C9C
            9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnCadSituacaoClick
        end
        object edtCodTipoServico: TEdit
          Left = 148
          Top = 23
          Width = 34
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 30
          NumbersOnly = True
          TabOrder = 1
          OnChange = edtCodTipoServicoChange
          OnExit = edtCodTipoServicoExit
          OnKeyPress = edtDescricaoKeyPress
        end
        object cmbSituacao: TComboBox
          Left = 610
          Top = 23
          Width = 216
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 5
          Text = 'AGUARDANDO'
          Items.Strings = (
            '[SELECIONE]'
            'AGUARDANDO'
            'EM PROCESSO'
            'CANCELADO'
            'FINALIZADO')
        end
        object edtValorServico: TEdit
          Left = 517
          Top = 23
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 4
          Text = '0,00'
          OnKeyPress = edtValorServicoKeyPress
        end
        object edtDesTipoServico: TEdit
          Left = 212
          Top = 23
          Width = 299
          Height = 21
          CharCase = ecUpperCase
          Color = clBtnFace
          Enabled = False
          MaxLength = 30
          TabOrder = 2
          OnKeyPress = edtDescricaoKeyPress
        end
        object pnlServicos: TPanel
          Left = 1
          Top = 102
          Width = 889
          Height = 247
          Align = alBottom
          TabOrder = 8
          object dbgrdServico: TDBGrid
            Left = 1
            Top = 1
            Width = 887
            Height = 245
            Align = alClient
            DataSource = dsServico
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = dbgrdConsultaDblClick
            OnTitleClick = dbgrdConsultaTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'codigo'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_VEICULO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_TIPO_SERVICO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PLACA'
                Title.Caption = 'Placa'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_SERVICO'
                Title.Caption = 'Tipo de Servi'#231'o'
                Width = 328
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Title.Caption = 'Valor'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SITUACAO'
                Title.Caption = 'Situa'#231#227'o'
                Width = 147
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cod_usuario'
                Visible = False
              end>
          end
        end
        object btnAdd: TBitBtn
          Left = 598
          Top = 60
          Width = 77
          Height = 25
          Caption = 'Adicionar'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF4F9EFDDE4ECD8E0ECD8E0EFDDE4FFF4F9FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FAA3B6AA329064008A4700
            8D49008D49008A47329064A3B6AAFFF3FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFECF62F8D5F009A5B34CDA539DDB23AE1B33AE1B239DDB234CDA5009A5A2F8D
            5FFFECF6FFFFFFFFFFFFFFFFFFFFF5FE1A8B550DB5833EE0B600D79700D49600
            D29100D29100D49600D7973EE0B50DB5831A8B55FFF5FEFFFFFFFFFFFF75A78C
            00A97233DFB200D29400D29900D09174E4C374E4C300D09100D29900D29533DF
            B200A97275A78CFFFFFFFFF6FE00864145DDB800D19400D19900D19900C885FF
            FFFFFFFFFF00C88500D19900D19900D19445DDB6008641FFF6FEA7C6B605AA75
            19D8A700CF9800CD9300CC9200C37DFFFFFFFFFFFF00C37D00CC9200CD9300CF
            9819D8A606AB74A7C6B678B7962EC69C00D09800CB9172E2C281E4C66FDFBBFF
            FFFFFFFFFF6FDFBB81E4C672E2C200CB9100D0982BC49979B7977CB79738D0A8
            00CC9500C385FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00C3
            8500CE982CC4997DB89A75B49250DDB900C99400C89172E0C281E2C66FDDBBFF
            FFFFFFFFFF6FDDBB81E2C672E0C200C89100CC982BC49879B897B1D2BF38C69B
            18D3A700C99700C79300C69200BB7DFFFFFFFFFFFF00BB7D00C69200C79300C9
            9819D3A604AA73B6D5C4FFFFFF07985C64F5D700BF8D00C89900C89900BD85FF
            FFFFFFFFFF00BD8500C89900C89900C69445DBB800853FFFFFFFFFFFFF81BB9C
            6FE1C12FE0B800BF8D00C79900C39174DEC374DEC300C39100C79900C49433D8
            B200A76D90C3A8FFFFFFFFFFFFFFFFFF319B66A9FFF043E8C300BA8900C09300
            BF8F00BF8F00C29500C2963ED9B708B27E2B9C68FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF41A2706ED5B49FFFF64DECCA43E2C042E1BF45E1C140D6B00094524AA8
            7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDE3D568B7913AAD7D33
            AC7B20A671109D6363B68FDCEBE1FFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 6
          OnClick = btnAddClick
        end
        object btnRemove: TBitBtn
          Left = 679
          Top = 60
          Width = 77
          Height = 25
          Caption = 'Remover'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFCFAF0E9E6D6E5E2D1E6E3D1EAE7D6FCFBF0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBEDA6A7BC515BB31E36CC17
            32D1142ED0142CC94F5AB3ABACBDFDFCEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FBF8E34B54B13652E3758FFF7D90FF7E91FF7D8FFF798BFF5A74FD1430DA4F5A
            B2FCFAE3FFFFFFFFFFFFFFFFFFFFFFED3F4BB66A88FA8195FF5C6EFD5E70FC5E
            71FC5E71FC5F72FC6173FE7B8DFF304EEE3F4BB6FFFFEDFFFFFFFFFFFF7D81BA
            6683F4798CFF5467FA5B6FFA5B6FFA5B6EFA5B6EFA5B6EFA5B6EFA586BFA7889
            FF2340E7888DBDFFFFFFFFFFEE3047D090A8FF4C5FF7566BF8566BF8566BF856
            6BF8566BF8566BF8566BF8566BF85166F7768AFF0922C5FFFFEEABAED1758EF4
            5F75F94F65F5475EF4455CF4455CF4455CF4455CF4455CF4455CF4475EF45066
            F46176FC334DE6B3B6D48288CEA2C0FF3F54F13F56F394A2F79BA8F89AA6F89A
            A6F89AA6F89AA6F89BA8F894A2F73F56F3495FF35771F88E93D08589CEA9C6FF
            384DEE223FEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF223F
            EE4158F05D77F99096D08187CEB0CCFF3148EB344DED8D9CF596A3F594A1F594
            A1F594A1F594A1F596A3F58D9CF5344DED3B53ED657FFA8D92D0B7B9E089A5F5
            4C65F13953EC324CEB304AEB304AEB304AEB304AEB304AEB304AEB324CEB3A54
            EB4F65F44862EABEC2E1FFFFFE4359D298B3FF223CE63953EA3852EA3852EA38
            52EA3852EA3852EA3852EA3852EA2843E67E95FF1D34CAFFFFFFFFFFFF9195D4
            97B4F9637DF21F39E3334DE7334DE7334DE7334DE7334DE7334DE7233EE36078
            F45571EE9CA0D6FFFFFFFFFFFFFFFFFF4F5CC9AFCCFF758FF7132FDF223DE225
            40E42541E4223EE21733E06F88F97490FA505DC9FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF5F69CB6F87E8B7D3FF7A96F86682F36681F27691F99DB7FF4B65E3646E
            CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D8EE8089D85B6FDA5F
            74DC5C70DC5366D78088D7DBDBEFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 7
          OnClick = btnRemoveClick
        end
        object edtCodigo: TEdit
          Left = 9
          Top = 23
          Width = 46
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 0
        end
        object edtProprietario: TEdit
          Left = 86
          Top = 63
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          Color = clBtnFace
          Enabled = False
          MaxLength = 30
          TabOrder = 3
          OnKeyPress = edtDescricaoKeyPress
        end
        object edtPlaca: TMaskEdit
          Left = 9
          Top = 63
          Width = 72
          Height = 21
          CharCase = ecUpperCase
          EditMask = 'lll-9999;1;_'
          MaxLength = 8
          TabOrder = 9
          Text = '   -    '
          OnExit = edtPlacaExit
        end
      end
    end
  end
  inherited pnlBotoes: TPanel
    Top = 378
    Width = 985
    ExplicitTop = 378
    ExplicitWidth = 985
    inherited btnSair: TBitBtn
      Left = 896
      ExplicitLeft = 896
    end
  end
  inherited stbResumo: TStatusBar
    Top = 446
    Width = 985
    Panels = <
      item
        Width = 350
      end
      item
        Alignment = taRightJustify
        Text = 'F8 - CONSULTAR'
        Width = 50
      end>
    ExplicitTop = 446
    ExplicitWidth = 985
  end
  inherited dsConsulta: TDataSource
    DataSet = DtmDadosServico.cdsPesquisa
  end
  object cdsServico: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 493
    Top = 242
    object cdsServicoPLACA: TStringField
      FieldName = 'PLACA'
      Size = 15
    end
    object cdsServicoTIPO_SERVICO: TStringField
      FieldName = 'TIPO_SERVICO'
      Size = 50
    end
    object cdsServicoCOD_TIPO_SERVICO: TIntegerField
      FieldName = 'COD_TIPO_SERVICO'
    end
    object cdsServicoVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsServicoSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
    object cdsServicoCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
    end
    object cdsServicoCOD_SITUACAO: TIntegerField
      FieldName = 'COD_SITUACAO'
    end
    object cdsServicoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
  end
  object dsServico: TDataSource
    DataSet = cdsServico
    Left = 421
    Top = 242
  end
end
