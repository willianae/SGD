inherited FrmRelConvocacao: TFrmRelConvocacao
  Caption = 'FrmRelConvocacao'
  ExplicitWidth = 1121
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLReport1: TRLReport
    Borders.Style = bsVertical
    inherited RLBand1: TRLBand
      inherited RLSystemInfo1: TRLSystemInfo
        Left = 602
        Top = 109
        Width = 113
        Font.Style = [fsBold]
        ParentFont = False
        Text = 'Recife, '
        ExplicitLeft = 602
        ExplicitTop = 109
        ExplicitWidth = 113
      end
    end
    inherited RLBand2: TRLBand
      Top = 220
      Height = 21
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.Width = 2
      Color = clBtnFace
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      ExplicitTop = 220
      ExplicitHeight = 21
      object RLLabel1: TRLLabel
        Left = 3
        Top = 2
        Width = 52
        Height = 16
        Caption = 'Ve'#237'culo'
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 270
        Top = 2
        Width = 40
        Height = 16
        Caption = 'Placa'
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 385
        Top = 2
        Width = 60
        Height = 16
        Caption = 'Ano/Mod'
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 337
        Top = 2
        Width = 21
        Height = 16
        Caption = 'UF'
        Transparent = False
      end
      object rlblAnoIpva: TRLLabel
        Left = 474
        Top = 2
        Width = 67
        Height = 16
        Caption = 'IPVA/2015'
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 561
        Top = 2
        Width = 63
        Height = 16
        Caption = 'Restri'#231#227'o'
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 641
        Top = 2
        Width = 75
        Height = 16
        Caption = 'Custo Total'
        Transparent = False
      end
      object RLDraw1: TRLDraw
        Left = 250
        Top = 1
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw3: TRLDraw
        Left = 325
        Top = -15
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw5: TRLDraw
        Left = 368
        Top = -17
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw7: TRLDraw
        Left = 462
        Top = -18
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw8: TRLDraw
        Left = 547
        Top = -18
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw9: TRLDraw
        Left = 636
        Top = -19
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Pen.Width = 0
        Transparent = False
      end
    end
    inherited RLBand3: TRLBand
      Top = 278
      ExplicitTop = 278
    end
    inherited RLBand4: TRLBand
      Top = 262
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      ExplicitTop = 262
      object RLDBResult1: TRLDBResult
        Left = 608
        Top = 1
        Width = 109
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_SERVICO'
        DataSource = ds1
        Info = riSum
        Text = ''
      end
    end
    inherited RLBand5: TRLBand
      Top = 241
      Height = 21
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      ExplicitTop = 241
      ExplicitHeight = 21
      object RLDBText1: TRLDBText
        Left = 3
        Top = 1
        Width = 43
        Height = 15
        DataField = 'VEICULO'
        DataSource = ds1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 269
        Top = 3
        Width = 42
        Height = 15
        Alignment = taCenter
        DataField = 'PLACA'
        DataSource = ds1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel2
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 372
        Top = 3
        Width = 86
        Height = 15
        Alignment = taCenter
        DataField = 'ANO_MODELO'
        DataSource = ds1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel3
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 337
        Top = 3
        Width = 20
        Height = 15
        Alignment = taCenter
        DataField = 'UF'
        DataSource = ds1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel4
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 493
        Top = 1
        Width = 28
        Height = 15
        Alignment = taCenter
        DataField = 'IPVA'
        DataSource = ds1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Holder = rlblAnoIpva
        ParentFont = False
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 557
        Top = 1
        Width = 72
        Height = 15
        Alignment = taCenter
        DataField = 'RESTRICAO'
        DataSource = ds1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel6
        ParentFont = False
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 614
        Top = 1
        Width = 102
        Height = 15
        Alignment = taRightJustify
        DataField = 'VALOR_SERVICO'
        DataSource = ds1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLLabel7
        ParentFont = False
        Text = ''
      end
      object RLDraw2: TRLDraw
        Left = 250
        Top = -19
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Holder = RLDraw1
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw4: TRLDraw
        Left = 325
        Top = -17
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Holder = RLDraw3
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw6: TRLDraw
        Left = 368
        Top = -19
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Holder = RLDraw5
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw10: TRLDraw
        Left = 462
        Top = -18
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Holder = RLDraw7
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw11: TRLDraw
        Left = 547
        Top = -19
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Holder = RLDraw8
        Pen.Width = 0
        Transparent = False
      end
      object RLDraw12: TRLDraw
        Left = 636
        Top = -17
        Width = 1
        Height = 38
        Borders.Style = bsVertical
        Pen.Width = 0
        Transparent = False
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 169
      Width = 718
      Height = 51
      BandType = btHeader
      object RLLblTituloSeguradora: TRLLabel
        Left = 238
        Top = 4
        Width = 222
        Height = 22
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabelCidadeUFEmp: TRLLabel
        Left = 257
        Top = 28
        Width = 176
        Height = 18
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
  end
  inherited ds1: TDataSource
    DataSet = DtmDadosConvocacao.cdsConvocacao
  end
end
