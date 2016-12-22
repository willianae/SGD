object FrmRelNegativaDeFurto: TFrmRelNegativaDeFurto
  Left = 0
  Top = 0
  Caption = 'FrmRelNegativaDeFurto'
  ClientHeight = 528
  ClientWidth = 909
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 107
    Top = -160
    Width = 794
    Height = 1123
    DataSource = DtmDadosRelatorioNegativaFurto.dsPesquisa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 233
      Width = 718
      Height = 24
      BeforePrint = RLBand1BeforePrint
      object RLMemoTextoNegativaFurto: TRLMemo
        Left = 21
        Top = 6
        Width = 679
        Height = 16
        Alignment = taJustify
        Behavior = [beSiteExpander]
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 457
      Width = 718
      Height = 368
      BandType = btFooter
      object RLLabel4: TRLLabel
        Left = 21
        Top = 173
        Width = 79
        Height = 16
        Caption = 'Sr. Delegado'
      end
      object RLLabel5: TRLLabel
        Left = 21
        Top = 195
        Width = 625
        Height = 20
        Caption = 
          'Informo que at'#233' a prsente data no Arquivo ______________________' +
          '________________ contra o ve'#237'culo '
      end
      object RLLabel6: TRLLabel
        Left = 21
        Top = 211
        Width = 110
        Height = 16
        Caption = 'supramencionado.'
      end
      object RLLabel7: TRLLabel
        Left = 324
        Top = 277
        Width = 377
        Height = 16
        Caption = 'Em,_______________ de ______________ de ______________.'
      end
      object RLLabel8: TRLLabel
        Left = 324
        Top = 311
        Width = 377
        Height = 16
        Caption = '_____________________________________________________'
      end
      object RLLabel9: TRLLabel
        Left = 398
        Top = 341
        Width = 208
        Height = 16
        Caption = 'Encarregado de Buscas - Matr'#237'cula'
      end
      object RLLabel16: TRLLabel
        Left = 324
        Top = 21
        Width = 89
        Height = 16
        Caption = 'Nestes termos'
      end
      object RLLabel17: TRLLabel
        Left = 324
        Top = 61
        Width = 105
        Height = 16
        Caption = 'Pede deferimento'
      end
      object RLLabel18: TRLLabel
        Left = 324
        Top = 90
        Width = 376
        Height = 16
        Caption = 'Recife, ____ de ___________________________ de _________.'
      end
      object RLLabel19: TRLLabel
        Left = 324
        Top = 123
        Width = 373
        Height = 16
        Caption = '_____________________________________________________'
      end
      object RLLabel20: TRLLabel
        Left = 325
        Top = 144
        Width = 70
        Height = 16
        Caption = 'Requerente'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 257
      Width = 718
      Height = 200
      BandType = btFooter
      object RLLabel10: TRLLabel
        Left = 21
        Top = 8
        Width = 79
        Height = 16
        Caption = 'Sr. Delegado'
      end
      object RLLabel11: TRLLabel
        Left = 21
        Top = 30
        Width = 625
        Height = 16
        Caption = 
          'Informo que at'#233' a presente data ________________________________' +
          '________________ contra o ve'#237'culo '
      end
      object RLLabel12: TRLLabel
        Left = 21
        Top = 46
        Width = 110
        Height = 16
        Caption = 'supramencionado.'
      end
      object RLLabel13: TRLLabel
        Left = 324
        Top = 102
        Width = 377
        Height = 16
        Caption = 'Em,_______________ de ______________ de ______________.'
      end
      object RLLabel14: TRLLabel
        Left = 324
        Top = 139
        Width = 377
        Height = 16
        Caption = '_____________________________________________________'
      end
      object RLLabel15: TRLLabel
        Left = 324
        Top = 161
        Width = 208
        Height = 16
        Caption = 'Encarregado de Buscas - Matr'#237'cula'
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 195
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 21
        Top = 8
        Width = 461
        Height = 16
        Caption = 
          'Ilm'#186'. Sr. Delegado de Repress'#227'o de Roubos e Furtos de Ve'#237'culos -' +
          ' Recife - PE'
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Title = 'Negativa de Furto'
    DocumentInfo.Creator = 'FortesReport v4.0 \251 Copyright '#169' 1999-2014 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 249
    Top = 129
  end
end
