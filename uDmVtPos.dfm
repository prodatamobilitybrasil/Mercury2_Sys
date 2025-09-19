object DmVtPos: TDmVtPos
  OldCreateOrder = False
  Left = 193
  Top = 118
  Height = 384
  Width = 643
  object cdsPaymentModes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'PaymentModes'
    Left = 32
    Top = 56
  end
  object dsPaymentModes: TDataSource
    DataSet = cdsPaymentModes
    Left = 124
    Top = 56
  end
  object ConnBrkMaster: TConnectionBroker
    Connection = shrConnMaster
    Left = 128
    Top = 8
  end
  object shrConnMaster: TSharedConnection
    ParentConnection = dmConexao.DCOMConnMaster
    ChildName = 'Mercury2_Base'
    Left = 32
    Top = 8
  end
  object cdsDetailsIn: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'PaymentModesXPaymentDetails'
    Left = 32
    Top = 104
  end
  object dsDetailsIn: TDataSource
    DataSet = cdsDetailsIn
    Left = 128
    Top = 104
  end
  object cdsDetailsOut: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    Params = <>
    ProviderName = 'Details'
    Left = 32
    Top = 152
  end
  object dsDetalisOut: TDataSource
    DataSet = cdsDetailsOut
    Left = 128
    Top = 152
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvGeral'
    Left = 32
    Top = 200
  end
end
