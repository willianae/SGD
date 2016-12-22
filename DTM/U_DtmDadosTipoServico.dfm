inherited DtmDadosTipoServico: TDtmDadosTipoServico
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  inherited cdsPesquisa: TClientDataSet
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftLargeint
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'taxa_detran'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'CODIGO'
        Fields = 'CODIGO'
      end
      item
        Name = 'DESCRICAO'
        Fields = 'DESCRICAO'
      end>
    IndexFieldNames = 'CODIGO'
    StoreDefs = True
    object cdsPesquisacodigo: TLargeintField
      FieldName = 'codigo'
    end
    object cdsPesquisadescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object cdsPesquisataxa_detran: TBCDField
      FieldName = 'taxa_detran'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  inherited QryPesquisa: TADOQuery
    SQL.Strings = (
      'select * from Tipo_Servico')
  end
end
