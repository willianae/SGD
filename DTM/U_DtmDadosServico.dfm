inherited DtmDadosServico: TDtmDadosServico
  OldCreateOrder = True
  inherited cdsPesquisa: TClientDataSet
    PacketRecords = 30
    object cdsPesquisacodigo: TLargeintField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object cdsPesquisacod_veiculo: TIntegerField
      FieldName = 'cod_veiculo'
      ReadOnly = True
    end
    object cdsPesquisacod_tipo_servico: TIntegerField
      FieldName = 'cod_tipo_servico'
      ReadOnly = True
    end
    object cdsPesquisavalor: TBCDField
      FieldName = 'valor'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPesquisasituacao: TStringField
      FieldName = 'situacao'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsPesquisaplaca: TStringField
      FieldName = 'placa'
      ReadOnly = True
      Size = 15
    end
    object cdsPesquisatipo_servico: TStringField
      DisplayWidth = 300
      FieldName = 'tipo_servico'
      ReadOnly = True
      Size = 300
    end
    object cdsPesquisacod_usuario: TIntegerField
      FieldName = 'cod_usuario'
      ReadOnly = True
    end
    object cdsPesquisanome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Size = 80
    end
    object cdsPesquisasenha: TStringField
      FieldName = 'senha'
      ReadOnly = True
    end
    object cdsPesquisacod_situacao: TIntegerField
      FieldName = 'cod_situacao'
      ReadOnly = True
    end
    object cdsPesquisacolor: TStringField
      FieldName = 'color'
      ReadOnly = True
      Size = 25
    end
    object cdsPesquisaqtd_registros: TLargeintField
      FieldName = 'qtd_registros'
    end
  end
  inherited QryPesquisa: TADOQuery
    SQL.Strings = (
      
        'SELECT S.CODIGO, S.COD_VEICULO, S.COD_TIPO_SERVICO, S.COD_USUARI' +
        'O, S.VALOR, '
      
        'V.PLACA, TS.DESCRICAO TIPO_SERVICO, C.NOME, S.SENHA, SI.DESCRICA' +
        'O SITUACAO, '
      
        'S.COD_SITUACAO, SI.COLOR                                        ' +
        '                      '
      
        ' FROM SERVICOS S                                                ' +
        '            '
      
        ' INNER JOIN VEICULO V ON (S.COD_VEICULO = V.CODIGO)             ' +
        '            '
      
        ' INNER JOIN CLIENTE C ON (V.COD_CLIENTE = C.CODIGO)             ' +
        '            '
      
        ' INNER JOIN TIPO_SERVICO TS ON (S.COD_TIPO_SERVICO = TS.CODIGO) ' +
        '            '
      
        ' INNER JOIN SITUACAO SI ON (SI.CODIGO = S.COD_SITUACAO)         ' +
        '            '
      
        ' WHERE 1 = 1                                                    ' +
        '            ')
  end
  object QryAuxWeb: TADOQuery
    Connection = DtmConexao.AdoConnWeb
    Parameters = <>
    Left = 96
    Top = 32
  end
end
