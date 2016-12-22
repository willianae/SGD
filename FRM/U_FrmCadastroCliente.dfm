inherited FrmCadastroCliente: TFrmCadastroCliente
  Left = 256
  Caption = 'Cadastro de Cliente'
  FormStyle = fsMDIChild
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  ExplicitHeight = 463
  PixelsPerInch = 96
  TextHeight = 13
  object lbl3: TLabel [0]
    Left = 24
    Top = 150
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  inherited pgctrlPrincipal: TPageControl
    ActivePage = tbsCadastro
    inherited tbsConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 846
      ExplicitHeight = 319
      inherited pnlConsulta: TPanel
        TabOrder = 1
        inherited dbgrdConsulta: TDBGrid
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          OnDblClick = dbgrdConsultaDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cpf_cnpj_formatado'
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cnh'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'telefone_celular'
              Width = 64
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
        Left = 71
        Top = 13
        Width = 613
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edtPesquisaChange
        ExplicitLeft = 71
        ExplicitTop = 13
        ExplicitWidth = 613
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 846
      ExplicitHeight = 319
      inherited pnlBotoesLateral: TPanel
        inherited btnSalvar: TBitBtn
          OnClick = btnSalvarClick
        end
        inherited btnCancelar: TBitBtn
          Top = 44
          OnClick = btnCancelarClick
          ExplicitTop = 44
        end
      end
      inherited pnlCorpo: TPanel
        object Label1: TLabel
          Left = 16
          Top = 15
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object lbl1: TLabel
          Left = 18
          Top = 58
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object lblCPFCNPJ: TLabel
          Left = 21
          Top = 98
          Width = 23
          Height = 13
          Caption = 'CPF:'
        end
        object lbl4: TLabel
          Left = 165
          Top = 98
          Width = 25
          Height = 13
          Caption = 'CNH:'
        end
        object lbl5: TLabel
          Left = 317
          Top = 98
          Width = 18
          Height = 13
          Caption = 'RG:'
        end
        object lbl6: TLabel
          Left = 20
          Top = 169
          Width = 59
          Height = 13
          Caption = 'Logradouro:'
        end
        object lbl7: TLabel
          Left = 236
          Top = 208
          Width = 37
          Height = 13
          Caption = 'Cidade:'
        end
        object lbl8: TLabel
          Left = 23
          Top = 209
          Width = 32
          Height = 13
          Caption = 'Bairro:'
        end
        object lbl9: TLabel
          Left = 460
          Top = 207
          Width = 17
          Height = 13
          Caption = 'UF:'
        end
        object lbl10: TLabel
          Left = 512
          Top = 207
          Width = 23
          Height = 13
          Caption = 'CEP:'
        end
        object lbl11: TLabel
          Left = 20
          Top = 248
          Width = 69
          Height = 13
          Caption = 'Telefone Fixo:'
        end
        object lbl12: TLabel
          Left = 159
          Top = 248
          Width = 82
          Height = 13
          Caption = 'Telefone Celular:'
        end
        object lbl13: TLabel
          Left = 300
          Top = 252
          Width = 32
          Height = 13
          Caption = 'E-mail:'
        end
        object lbl14: TLabel
          Left = 510
          Top = 167
          Width = 12
          Height = 13
          Caption = 'N'#186
        end
        object edtCodigo: TEdit
          Left = 16
          Top = 32
          Width = 46
          Height = 21
          TabStop = False
          Color = clBtnFace
          Enabled = False
          TabOrder = 15
        end
        object edtNome: TEdit
          Left = 16
          Top = 71
          Width = 537
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 80
          TabOrder = 2
        end
        object edtCNH: TEdit
          Left = 163
          Top = 111
          Width = 137
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 16
          NumbersOnly = True
          TabOrder = 4
        end
        object edtRG: TEdit
          Left = 315
          Top = 111
          Width = 129
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 16
          TabOrder = 5
        end
        object edtLogradouro: TEdit
          Left = 18
          Top = 182
          Width = 479
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 6
        end
        object edtCidade: TEdit
          Left = 234
          Top = 221
          Width = 207
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 9
        end
        object edtBairro: TEdit
          Left = 21
          Top = 222
          Width = 207
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 8
        end
        object medtTelefoneFixo: TMaskEdit
          Left = 20
          Top = 267
          Width = 99
          Height = 21
          EditMask = '!\(99\)9999-9999;0;_'
          MaxLength = 13
          TabOrder = 12
          Text = ''
        end
        object medtTelefoneCelular: TMaskEdit
          Left = 159
          Top = 267
          Width = 99
          Height = 21
          EditMask = '!\(99\)99999-9999;0;_'
          MaxLength = 14
          TabOrder = 13
          Text = ''
        end
        object edtEmail: TEdit
          Left = 297
          Top = 267
          Width = 288
          Height = 21
          CharCase = ecLowerCase
          MaxLength = 50
          TabOrder = 14
        end
        object edtNumero: TEdit
          Left = 503
          Top = 182
          Width = 80
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 7
        end
        object rgTipoCliente: TRadioGroup
          Left = 83
          Top = 22
          Width = 158
          Height = 43
          Caption = 'Tipo de Cliente'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'F'#237'sica'
            'Jur'#237'dica')
          TabOrder = 0
          OnClick = rgTipoClienteClick
        end
        object medtCPFCNPJ: TMaskEdit
          Left = 20
          Top = 111
          Width = 136
          Height = 21
          EditMask = '000\.000\.000\-00;0;_'
          MaxLength = 14
          TabOrder = 3
          Text = ''
        end
        object medtCEP: TMaskEdit
          Left = 510
          Top = 222
          Width = 69
          Height = 21
          EditMask = '99999\-999;0;_'
          MaxLength = 9
          TabOrder = 11
          Text = ''
        end
        object cbbUF: TComboBox
          Left = 460
          Top = 222
          Width = 44
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 10
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
        object RdGrpClasseCliente: TRadioGroup
          Left = 267
          Top = 28
          Width = 286
          Height = 37
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Vendedor'
            'Comprador'
            'Ambos')
          TabOrder = 1
        end
      end
    end
  end
  inherited dsConsulta: TDataSource
    DataSet = DtmDadosCliente.cdsPesquisa
  end
end
