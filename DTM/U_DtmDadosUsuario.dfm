inherited DtmDadosUsuario: TDtmDadosUsuario
  OldCreateOrder = True
  inherited cdsPesquisa: TClientDataSet
    object cdsPesquisacodigo: TLargeintField
      FieldName = 'codigo'
    end
    object cdsPesquisanome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object cdsPesquisalogin: TStringField
      FieldName = 'login'
      Size = 50
    end
    object cdsPesquisasenha: TStringField
      FieldName = 'senha'
      Size = 50
    end
    object cdsPesquisanivel: TIntegerField
      FieldName = 'nivel'
    end
  end
end
