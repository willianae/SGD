inherited FrmHistoricoProcesso: TFrmHistoricoProcesso
  Left = 228
  Caption = 'Hist'#243'rico dos processos'
  ClientHeight = 526
  ClientWidth = 947
  FormStyle = fsMDIChild
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 953
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgctrlPrincipal: TPageControl
    Width = 947
    Height = 439
    ExplicitWidth = 947
    ExplicitHeight = 439
    inherited tbsConsulta: TTabSheet
      ExplicitWidth = 939
      ExplicitHeight = 411
      inherited lblPesquisa: TLabel
        Left = -120
        Top = 23
        Width = 32
        Caption = 'Placa: '
        Visible = False
        ExplicitLeft = -120
        ExplicitTop = 23
        ExplicitWidth = 32
      end
      object lbl1: TLabel [1]
        Left = 16
        Top = 14
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
      inherited pnlConsulta: TPanel
        Top = 41
        Width = 939
        Height = 370
        ExplicitTop = 41
        ExplicitWidth = 939
        ExplicitHeight = 370
        inherited dbgrdConsulta: TDBGrid
          Width = 930
          Height = 368
          OnDrawColumnCell = dbgrdConsultaDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'placa'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'cliente'
              Title.Caption = 'Cliente'
              Width = 238
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'processo_antigo'
              Title.Caption = 'Processo Antigo'
              Width = 167
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'processo_atual'
              Title.Caption = 'Processo Atual'
              Width = 148
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'usuario'
              Title.Caption = 'Usu'#225'rio'
              Width = 182
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_mudanca'
              Title.Caption = 'Data Mudan'#231'a'
              Width = 87
              Visible = True
            end>
        end
        inherited pnlBotoesAcoes: TPanel
          Left = 931
          Width = 7
          Height = 368
          Visible = False
          ExplicitLeft = 931
          ExplicitWidth = 7
          ExplicitHeight = 368
        end
      end
      inherited edtPesquisa: TEdit
        Left = -56
        Top = 13
        Width = 17
        CharCase = ecUpperCase
        TabOrder = 2
        Visible = False
        ExplicitLeft = -56
        ExplicitTop = 13
        ExplicitWidth = 17
      end
      object btnPesquisar: TBitBtn
        Left = 126
        Top = 2
        Width = 89
        Height = 36
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
        TabOrder = 3
        OnClick = btnPesquisarClick
      end
      object medtPlaca: TMaskEdit
        Left = 52
        Top = 11
        Width = 67
        Height = 21
        CharCase = ecUpperCase
        EditMask = 'lll-9999;1;_'
        MaxLength = 8
        TabOrder = 1
        Text = '   -    '
      end
    end
    inherited tbsCadastro: TTabSheet
      TabVisible = False
      ExplicitWidth = 939
      ExplicitHeight = 411
      inherited pnlBotoesLateral: TPanel
        Left = 853
        Height = 411
        ExplicitLeft = 853
        ExplicitHeight = 411
      end
      inherited pnlCorpo: TPanel
        Width = 853
        Height = 411
        ExplicitWidth = 853
        ExplicitHeight = 411
      end
    end
  end
  inherited pnlBotoes: TPanel
    Top = 439
    Width = 947
    ExplicitTop = 439
    ExplicitWidth = 947
    inherited btnSair: TBitBtn
      Left = 1003
      Top = 2
      ExplicitLeft = 1003
      ExplicitTop = 2
    end
  end
  inherited stbResumo: TStatusBar
    Top = 507
    Width = 947
    ExplicitTop = 507
    ExplicitWidth = 947
  end
  inherited dsConsulta: TDataSource
    DataSet = DtmDadosHistoricoProcesso.cdsPesquisa
  end
end