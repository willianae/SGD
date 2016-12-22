inherited DtmDadosSeguradora: TDtmDadosSeguradora
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
  end
  inherited QryPesquisa: TADOQuery
    SQL.Strings = (
      'select * from Seguradora')
  end
end
