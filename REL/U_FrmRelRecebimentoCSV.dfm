inherited FrmRelRecebimentoCSV: TFrmRelRecebimentoCSV
  Caption = 'FrmRelRecebimentoCSV'
  OnDestroy = FormDestroy
  ExplicitWidth = 1121
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLReport1: TRLReport
    Left = 8
    Transparent = False
    ExplicitLeft = 8
    inherited RLBand1: TRLBand
      Height = 122
      Borders.Sides = sdCustom
      Transparent = False
      ExplicitHeight = 122
      inherited RLImageLogoEmpresa: TRLImage
        Transparent = False
      end
      inherited RLLblNomeEmpresa: TRLLabel
        Left = 119
        Top = 24
        Transparent = False
        ExplicitLeft = 119
        ExplicitTop = 24
      end
      inherited RLSystemInfo1: TRLSystemInfo
        Transparent = False
      end
    end
    inherited RLBand2: TRLBand
      Top = 185
      Height = 22
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Transparent = False
      ExplicitTop = 185
      ExplicitHeight = 22
      object RLDraw13: TRLDraw
        Left = 23
        Top = 0
        Width = 82
        Height = 22
        Brush.Color = clBtnFace
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
      object RLDraw12: TRLDraw
        Left = 573
        Top = 0
        Width = 144
        Height = 22
        Brush.Color = clBtnFace
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
      object RLDraw11: TRLDraw
        Left = 388
        Top = 0
        Width = 186
        Height = 22
        Brush.Color = clBtnFace
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
      object RLDraw10: TRLDraw
        Left = 227
        Top = 0
        Width = 162
        Height = 22
        Brush.Color = clBtnFace
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
      object RLDraw8: TRLDraw
        Left = 187
        Top = 0
        Width = 41
        Height = 22
        Brush.Color = clBtnFace
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
      object RLDraw9: TRLDraw
        Left = 104
        Top = 0
        Width = 84
        Height = 22
        Brush.Color = clBtnFace
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
      object RLDraw7: TRLDraw
        Left = 0
        Top = 0
        Width = 24
        Height = 22
        Brush.Color = clBtnFace
        Color = clWhite
        ParentColor = False
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 634
        Top = 3
        Width = 48
        Height = 16
        Caption = 'VALOR'
      end
      object RLLabel5: TRLLabel
        Left = 401
        Top = 3
        Width = 91
        Height = 16
        Caption = 'OBS: FALTA ?'
      end
      object RLLabel4: TRLLabel
        Left = 247
        Top = 3
        Width = 126
        Height = 16
        Caption = 'MOTIVO EXIG'#202'NCIA'
      end
      object RLLabel3: TRLLabel
        Left = 196
        Top = 3
        Width = 21
        Height = 16
        Caption = 'UF'
      end
      object RLLabel2: TRLLabel
        Left = 112
        Top = 3
        Width = 69
        Height = 16
        Caption = 'RENAVAM'
      end
      object RLLabel1: TRLLabel
        Left = 41
        Top = 3
        Width = 47
        Height = 16
        Caption = 'PLACA'
      end
    end
    inherited RLBand3: TRLBand
      Top = 250
      Transparent = False
      ExplicitTop = 250
    end
    inherited RLBand4: TRLBand
      Top = 229
      Height = 21
      Transparent = False
      BeforePrint = RLBand4BeforePrint
      ExplicitTop = 229
      ExplicitHeight = 21
      object RLLabel7: TRLLabel
        Left = 489
        Top = 1
        Width = 51
        Height = 16
        Caption = 'TOTAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabelTotal: TRLLabel
        Left = 573
        Top = 1
        Width = 109
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    inherited RLBand5: TRLBand
      Top = 207
      Height = 22
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Transparent = False
      BeforePrint = RLBand5BeforePrint
      ExplicitTop = 207
      ExplicitHeight = 22
      object RLDraw6: TRLDraw
        Left = 573
        Top = 0
        Width = 144
        Height = 22
        Transparent = False
      end
      object RLDraw4: TRLDraw
        Left = 227
        Top = 0
        Width = 162
        Height = 22
        Transparent = False
      end
      object RLDraw3: TRLDraw
        Left = 187
        Top = 0
        Width = 41
        Height = 22
        Transparent = False
      end
      object RLDraw2: TRLDraw
        Left = 104
        Top = 0
        Width = 84
        Height = 22
        Transparent = False
      end
      object RLDraw1: TRLDraw
        Left = 27
        Top = 0
        Width = 78
        Height = 22
        Transparent = False
      end
      object RLDBText1: TRLDBText
        Left = 41
        Top = 2
        Width = 48
        Height = 16
        Alignment = taCenter
        DataField = 'placa'
        DataSource = ds1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBText2: TRLDBText
        Left = 111
        Top = 2
        Width = 74
        Height = 16
        Alignment = taRightJustify
        DataField = 'renavam'
        DataSource = ds1
        Text = ''
        Transparent = False
      end
      object RLDBText3: TRLDBText
        Left = 200
        Top = 2
        Width = 14
        Height = 16
        Alignment = taCenter
        DataField = 'uf'
        DataSource = ds1
        Text = ''
        Transparent = False
      end
      object RLDBText4: TRLDBText
        Left = 292
        Top = 2
        Width = 41
        Height = 16
        Alignment = taCenter
        DataField = 'motivo'
        DataSource = ds1
        Text = ''
        Transparent = False
      end
      object RLLabelValor: TRLLabel
        Left = 576
        Top = 2
        Width = 106
        Height = 16
        Alignment = taRightJustify
        Transparent = False
      end
      object RLDraw5: TRLDraw
        Left = 388
        Top = 0
        Width = 186
        Height = 22
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 5
        Top = 2
        Width = 18
        Height = 16
        Info = itRecNo
        Text = ''
        Transparent = False
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 160
      Width = 718
      Height = 25
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLLabel8: TRLLabel
        Left = 268
        Top = 4
        Width = 181
        Height = 18
        Caption = 'RECIFE - PERNAMBUCO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited ds1: TDataSource
    DataSet = DtmDadosRelRecebimentoCSV.cdsPesquisa
  end
end
