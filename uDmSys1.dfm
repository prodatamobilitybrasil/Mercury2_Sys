object dmSys1: TdmSys1
  Tag = 23
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 241
  Top = 108
  Height = 554
  Width = 1084
  object ConnBrkMaster: TConnectionBroker
    Connection = shrConnMaster
    Left = 32
    Top = 8
  end
  object shrConnMaster: TSharedConnection
    ParentConnection = dmConexao.DCOMConnMaster
    ChildName = 'Mercury2_Base1'
    Left = 120
    Top = 8
  end
  object cdsAcceptedFct: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    Params = <>
    ProviderName = 'prvAcceptedFct'
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 32
    Top = 56
  end
  object dtsAcceptedFct: TDataSource
    AutoEdit = False
    DataSet = cdsAcceptedFct
    Left = 60
    Top = 56
  end
  object cdsAcceptedFctLista: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'TP_ID'
    MasterFields = 'TP_ID'
    MasterSource = dtsAcceptedFct
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'TP_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvAcceptedFctsLista'
    Left = 32
    Top = 112
  end
  object dtsAcceptedFctLista: TDataSource
    DataSet = cdsAcceptedFctLista
    Left = 60
    Top = 112
  end
  object cdsTransportprovidersAccepted: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvTransportProvidersAcceped'
    Left = 32
    Top = 160
  end
  object dtsTransportprovidersAccepted: TDataSource
    DataSet = cdsTransportprovidersAccepted
    Left = 60
    Top = 160
  end
  object cdsExportLocations: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvExportLocations'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 32
    Top = 272
  end
  object cdsDepots: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvDepots'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 32
    Top = 216
  end
  object dtsDepots: TDataSource
    DataSet = cdsDepots
    Left = 60
    Top = 216
  end
  object cdsDepotsXTransportProviders: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'DP_ID'
    MasterFields = 'DP_ID'
    MasterSource = dtsDepots
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'DP_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvDepotsxTransportProviders'
    Left = 32
    Top = 328
  end
  object dtsExportLocations: TDataSource
    DataSet = cdsExportLocations
    Left = 60
    Top = 272
  end
  object dtsDepotsXTransportProviders: TDataSource
    DataSet = cdsDepotsXTransportProviders
    Left = 60
    Top = 328
  end
  object cdsPeriodUseTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvPeriodUseTypes'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 108
    Top = 56
  end
  object dtsPeriodUseTypes: TDataSource
    DataSet = cdsPeriodUseTypes
    Left = 136
    Top = 56
  end
  object cdsValidationPeriods: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValidationPeriods'
    Left = 108
    Top = 112
  end
  object dtsValidationPeriods: TDataSource
    DataSet = cdsValidationPeriods
    Left = 136
    Top = 112
  end
  object cdsValidityTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValidityTypes'
    Left = 108
    Top = 160
  end
  object cdsDateStatus: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvDateStatus'
    Left = 108
    Top = 216
  end
  object dtsValidityTypes: TDataSource
    DataSet = cdsValidityTypes
    Left = 136
    Top = 160
  end
  object dtsDateStatus: TDataSource
    DataSet = cdsDateStatus
    Left = 136
    Top = 216
  end
  object cdsLineSectionsXFarelevels: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'Ld_id;Ls_id'
    MasterFields = 'Ld_Id;Ls_Id'
    MasterSource = dtsLineSections
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'LD_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'LS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvLineSectionsXFarelevels'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 183
    Top = 160
  end
  object dtsSectionsXFarelevels: TDataSource
    DataSet = cdsLineSectionsXFarelevels
    Left = 211
    Top = 160
  end
  object cdsLineSections: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'Ld_Id'
    MasterFields = 'Ld_Id'
    MasterSource = DmSys.dtsLineDetails
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'LD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvLineSections'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 108
    Top = 272
  end
  object dtsLineSections: TDataSource
    DataSet = cdsLineSections
    Left = 136
    Top = 272
  end
  object cdsLinePrices: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    IndexFieldNames = 'LD_ID'
    MasterFields = 'LD_ID'
    MasterSource = DmSys.dtsLineDetails
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'LD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvLinePrices'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    OnPostError = cdsLinePricesPostError
    Left = 183
    Top = 56
  end
  object dtsLinePrices: TDataSource
    DataSet = cdsLinePrices
    Left = 211
    Top = 56
  end
  object cdsLineDirections: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineDirections'
    Left = 183
    Top = 112
  end
  object dtsLineDirections: TDataSource
    DataSet = cdsLineDirections
    Left = 211
    Top = 112
  end
  object cdsKeyTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvKeyTypes'
    BeforePost = cdsExportLocationsBeforePost
    Left = 108
    Top = 328
  end
  object dtsKeyTypes: TDataSource
    DataSet = cdsKeyTypes
    Left = 136
    Top = 328
  end
  object cdsLineGroupsXLineMT: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'LG_ID'
    MasterFields = 'LG_ID'
    MasterSource = DmSys.dtsLineGroups
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'LG_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvLineGroupsXLineMT'
    Left = 183
    Top = 216
  end
  object dtsineGroupsXLineMT: TDataSource
    DataSet = cdsLineGroupsXLineMT
    Left = 211
    Top = 216
  end
  object cdsLineIntegration: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    Params = <>
    ProviderName = 'prvLineIntegration'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 183
    Top = 272
  end
  object cdsIntegrationClearing: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftString
        Name = 'LI_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvIntegrationClearing'
    OnReconcileError = cdsIntegrationClearingReconcileError
    Left = 183
    Top = 328
  end
  object dtsIntegrationClearing: TDataSource
    DataSet = cdsIntegrationClearing
    Left = 211
    Top = 328
  end
  object dtsLineIntegration: TDataSource
    DataSet = cdsLineIntegration
    Left = 211
    Top = 272
  end
  object cdsLineIntegrationCons: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineIntegrationCons'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 264
    Top = 56
  end
  object dtsLineIntegrationCons: TDataSource
    DataSet = cdsLineIntegrationCons
    Left = 292
    Top = 56
  end
  object cdsLineSectionsXLineDiscounts: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'LD_ID;LS_ID'
    MasterFields = 'LD_ID;LS_ID'
    MasterSource = dtsLineSections
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvLineSectionsxLineDiscounts'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    OnPostError = cdsLineSectionsXLineDiscountsPostError
    Left = 264
    Top = 112
  end
  object dtsLineSectionsXLineDiscounts: TDataSource
    DataSet = cdsLineSectionsXLineDiscounts
    Left = 292
    Top = 112
  end
  object cdsIntegrationList: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvIntegrationList'
    AfterScroll = cdsIntegrationListAfterScroll
    Left = 264
    Top = 160
  end
  object dtsIntegrationList: TDataSource
    DataSet = cdsIntegrationList
    Left = 292
    Top = 160
  end
  object cdsIntegrationSeek: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftString
        Name = 'LI_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvIntegrationSeek'
    Left = 264
    Top = 216
  end
  object dtsIntegrationSeek: TDataSource
    DataSet = cdsIntegrationSeek
    Left = 292
    Top = 216
  end
  object cdsTPxLM: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'LM_ID'
    MasterFields = 'LM_ID'
    MasterSource = DmSys.dtsLineMT
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvTPXLM'
    Left = 264
    Top = 272
  end
  object dtsTPxLM: TDataSource
    DataSet = cdsTPxLM
    Left = 292
    Top = 272
  end
  object cdsProviderDocuments: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'PRV_ID'
    MasterFields = 'PRV_ID'
    MasterSource = DmSys.dtsProviders
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'PRV_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvProviderDocuments'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 356
    Top = 56
  end
  object dtsProviderDocuments: TDataSource
    DataSet = cdsProviderDocuments
    Left = 384
    Top = 56
  end
  object cdsProviderTelephones: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'PRV_ID'
    MasterFields = 'PRV_ID'
    MasterSource = DmSys.dtsProviders
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'PRV_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvProviderTelephones'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 356
    Top = 112
  end
  object dtsProviderTelephones: TDataSource
    DataSet = cdsProviderTelephones
    Left = 384
    Top = 112
  end
  object cdsProviderEmails: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'PRV_ID'
    MasterFields = 'PRV_ID'
    MasterSource = DmSys.dtsProviders
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'PRV_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvProviderEmails'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 356
    Top = 160
  end
  object cdsProviderAddresses: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'PRV_ID'
    MasterFields = 'PRV_ID'
    MasterSource = DmSys.dtsProviders
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'PRV_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvProviderAddresses'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 356
    Top = 216
  end
  object dtsProviderEmails: TDataSource
    DataSet = cdsProviderEmails
    Left = 384
    Top = 160
  end
  object dtsProviderAddresses: TDataSource
    DataSet = cdsProviderAddresses
    Left = 384
    Top = 216
  end
  object cdsDocumentTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvDocumentTypes'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 460
    Top = 56
  end
  object dtsDocumentTypes: TDataSource
    DataSet = cdsDocumentTypes
    Left = 488
    Top = 56
  end
  object cdsAddressTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvAddressTypes'
    Left = 460
    Top = 112
  end
  object dtsAddressTypes: TDataSource
    DataSet = cdsAddressTypes
    Left = 488
    Top = 112
  end
  object cdsTelephoneTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvTelephoneTypes'
    Left = 460
    Top = 160
  end
  object dtsTelephoneTypes: TDataSource
    DataSet = cdsTelephoneTypes
    Left = 488
    Top = 160
  end
  object cdsEmailTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvEmailTypes'
    Left = 460
    Top = 216
  end
  object dtsEmailTypes: TDataSource
    DataSet = cdsEmailTypes
    Left = 488
    Top = 216
  end
  object cdsTransportProvidersXApps: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'TP_ID'
    MasterFields = 'TP_ID'
    MasterSource = DmSys.dtsTransportProviders
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'TP_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvTransportprovidersXApps'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 356
    Top = 272
  end
  object dtsTransportProvidersXApps: TDataSource
    DataSet = cdsTransportProvidersXApps
    Left = 384
    Top = 272
  end
  object cdsSoftwareTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvSoftwareTypes'
    BeforePost = cdsExportLocationsBeforePost
    Left = 264
    Top = 328
  end
  object dtsSoftwareTypes: TDataSource
    DataSet = cdsSoftwareTypes
    Left = 292
    Top = 328
  end
  object cdsSoftwares: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvSoftwares'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 356
    Top = 328
  end
  object dtsSoftwares: TDataSource
    DataSet = cdsSoftwares
    Left = 384
    Top = 328
  end
  object cdsSoftwareVersions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'SF_ID'
    MasterFields = 'SF_ID'
    MasterSource = dtsSoftwares
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'SF_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvSoftwareVersions'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 460
    Top = 280
  end
  object dtsSoftwareVersions: TDataSource
    DataSet = cdsSoftwareVersions
    Left = 488
    Top = 280
  end
  object cdsDataTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvDataTypes'
    BeforePost = cdsExportLocationsBeforePost
    Left = 32
    Top = 392
  end
  object dtsDataTypes: TDataSource
    DataSet = cdsDataTypes
    Left = 60
    Top = 392
  end
  object cdsLanguages: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLanguages'
    BeforePost = cdsExportLocationsBeforePost
    Left = 108
    Top = 392
  end
  object dtsLanguages: TDataSource
    DataSet = cdsLanguages
    Left = 136
    Top = 392
  end
  object cdsSystemUserGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    Params = <>
    ProviderName = 'prvSystemUserGroups'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsSystemUserGroupsAfterScroll
    Left = 32
    Top = 448
  end
  object dtsSystemUserGroups: TDataSource
    DataSet = cdsSystemUserGroups
    Left = 60
    Top = 448
  end
  object cdsObjects: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvObjects'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 32
    Top = 508
  end
  object dtsObjects: TDataSource
    DataSet = cdsObjects
    Left = 60
    Top = 508
  end
  object cdsModules: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvModules'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsModulesAfterScroll
    Left = 264
    Top = 392
  end
  object dtsModules: TDataSource
    DataSet = cdsModules
    Left = 292
    Top = 392
  end
  object dtsModulesXSoftwares: TDataSource
    DataSet = cdsModulesXSoftwares
    Left = 384
    Top = 392
  end
  object cdsModulesXSoftwares: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'MOD_ID'
    MasterFields = 'MOD_ID'
    MasterSource = dtsModules
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'MOD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvModulesXSoftwares'
    BeforePost = cdsExportLocationsBeforePost
    Left = 356
    Top = 392
  end
  object cdsModulesXForms: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'MOD_ID'
    MasterFields = 'MOD_ID'
    MasterSource = dtsModules
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'MOD_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
    ProviderName = 'prvModulesXForms'
    BeforePost = cdsExportLocationsBeforePost
    Left = 460
    Top = 328
  end
  object dtsModulesXForms: TDataSource
    DataSet = cdsModulesXForms
    Left = 488
    Top = 328
  end
  object cdsForms: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvForms'
    BeforePost = cdsExportLocationsBeforePost
    Left = 460
    Top = 448
  end
  object dtsForms: TDataSource
    DataSet = cdsForms
    Left = 488
    Top = 448
  end
  object cdsSystemRoles: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvSystemRoles'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 264
    Top = 448
  end
  object dtsSystemRoles: TDataSource
    DataSet = cdsSystemRoles
    Left = 292
    Top = 448
  end
  object cdsFormObjectsXSystemRoles: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'SU_ID'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'SR_ID'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'prvFormObjectsXSystemRoles'
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 356
    Top = 448
  end
  object dtsFormObjectsXSystemRoles: TDataSource
    DataSet = cdsFormObjectsXSystemRoles
    Left = 384
    Top = 448
  end
  object cdsModulesXSystemUserGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    IndexFieldNames = 'SUG_ID'
    MasterFields = 'SUG_ID'
    MasterSource = dtsSystemUserGroups
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'SUG_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvModulesXSystemUserGroups'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 108
    Top = 448
  end
  object dtsModulesXSystemUserGroups: TDataSource
    DataSet = cdsModulesXSystemUserGroups
    Left = 136
    Top = 448
  end
  object cdsModulesXFormsLkp: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftString
        Name = 'MOD_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
    ProviderName = 'prvModulesXForms'
    BeforePost = cdsExportLocationsBeforePost
    Left = 460
    Top = 392
  end
  object dtsModulesXFormsLkp: TDataSource
    DataSet = cdsModulesXFormsLkp
    Left = 488
    Top = 392
  end
  object cdsSystemUserGroupsXSystemRoles: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    IndexFieldNames = 'SUG_ID'
    MasterFields = 'SUG_ID'
    MasterSource = dtsSystemUserGroups
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'SUG_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvSystemUserGroupsXSystemRoles'
    BeforePost = cdsExportLocationsBeforePost
    Left = 32
    Top = 568
  end
  object dtsSystemUserGroupsXSystemRoles: TDataSource
    DataSet = cdsSystemUserGroupsXSystemRoles
    Left = 60
    Top = 568
  end
  object cdsObjectTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvObjectTypes'
    BeforePost = cdsExportLocationsBeforePost
    Left = 108
    Top = 508
  end
  object dtsObjectTypes: TDataSource
    DataSet = cdsObjectTypes
    Left = 136
    Top = 508
  end
  object cdsObjectTranslationMT: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvObjectTranslationMT'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsObjectTranslationMTAfterScroll
    Left = 183
    Top = 448
  end
  object dtsObjectTranslationMT: TDataSource
    DataSet = cdsObjectTranslationMT
    Left = 211
    Top = 448
  end
  object cdsObjectsXLanguages: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'OBJ_ID'
    MasterFields = 'OBJ_ID'
    MasterSource = dtsObjects
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'OBJ_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvObjectsXLanguages'
    BeforePost = cdsExportLocationsBeforePost
    Left = 264
    Top = 508
  end
  object dtsObjectsXLanguages: TDataSource
    DataSet = cdsObjectsXLanguages
    Left = 292
    Top = 508
  end
  object cdsFormsXObjects: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'OBJ_ID'
    MasterFields = 'OBJ_ID'
    MasterSource = dtsObjects
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'OBJ_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvFormsXObjects'
    BeforePost = cdsExportLocationsBeforePost
    Left = 356
    Top = 508
  end
  object dtsFormsXObjects: TDataSource
    DataSet = cdsFormsXObjects
    Left = 384
    Top = 508
  end
  object cdsObjectTranslationDT: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftString
        Name = 'OTM_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvObjectTranslationDT'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsObjectTranslationDTAfterScroll
    Left = 183
    Top = 508
  end
  object dtsObjectTranslationDT: TDataSource
    DataSet = cdsObjectTranslationDT
    Left = 211
    Top = 508
  end
  object cdsObjectTranslationDTxLanguages: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftString
        Name = 'OTM_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'OTD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvObjectTranslationDTxLanguages'
    BeforePost = cdsExportLocationsBeforePost
    Left = 264
    Top = 568
  end
  object dtsObjectTranslationDTxLanguages: TDataSource
    DataSet = cdsObjectTranslationDTxLanguages
    Left = 292
    Top = 568
  end
  object cdsRemotePrinters: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvRemotePrinters'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 560
    Top = 12
  end
  object dtsRemotePrinters: TDataSource
    DataSet = cdsRemotePrinters
    Left = 588
    Top = 12
  end
  object cdsPersonnalFunctions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvPersonnelFunctions'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 560
    Top = 56
  end
  object dtsPersonnalFunctions: TDataSource
    DataSet = cdsPersonnalFunctions
    Left = 588
    Top = 56
  end
  object cdsReports: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    FieldDefs = <
      item
        Name = 'TP_ID'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 5
        Size = 4
      end
      item
        Name = 'TP_DESC'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LM_VIADESC'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'LD_ID'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 5
        Size = 4
      end
      item
        Name = 'LD_DESC'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'LD_DESCSHORT'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'LD_SECTIONSQTY'
        DataType = ftBCD
        Precision = 2
        Size = 4
      end
      item
        Name = 'LD_REGDATE'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvReports'
    StoreDefs = True
    Left = 560
    Top = 112
  end
  object dtsReports: TDataSource
    DataSet = cdsReports
    Left = 588
    Top = 112
  end
  object cdsIntegrationDirections: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvIntegrationDirections'
    Left = 183
    Top = 392
  end
  object dtsIntegrationDirections: TDataSource
    DataSet = cdsIntegrationDirections
    Left = 211
    Top = 392
  end
  object cdsPeriodUseTypesLk: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvPeriodUseTypesLk'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 560
    Top = 160
  end
  object dtsPeriodUseTypesLk: TDataSource
    DataSet = cdsPeriodUseTypesLk
    Left = 588
    Top = 160
  end
  object cdsApplicationGroups: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT APPGRP_ID, APPGRP_DESC, APPGRP_STATUS, APPGRP_REGUSER, AP' +
      'PGRP_REGDATE From ApplicationGroups'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvApplicationGroups'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsApplicationGroupsReconcileError
    Left = 664
    Top = 56
  end
  object dtsApplicationGroups: TDataSource
    DataSet = cdsApplicationGroups
    Left = 692
    Top = 56
  end
  object cdsApplicationSubGroupsMT: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM APPLICATIONSUBGROUPSMT'
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'APPGRP_ID'
    MasterFields = 'APPGRP_ID'
    MasterSource = dtsApplicationGroups
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvApplicationSubGroupsMT'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsApplicationSubGroupsMTAfterScroll
    Left = 664
    Top = 160
  end
  object dtsApplicationSubGroupsMT: TDataSource
    DataSet = cdsApplicationSubGroupsMT
    Left = 692
    Top = 160
  end
  object dtsApplicationSubGroupsDT: TDataSource
    DataSet = cdsApplicationSubGroupsDT
    Left = 692
    Top = 112
  end
  object cdsApplicationSubGroupsDT: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT GRPD.*, APP.APP_DESCSHORT FROM APPLICATIONSUBGROUPSDT GRP' +
      'D LEFT JOIN APPLICATIONS APP ON APP.APP_ID = GRPD.APP_ID WHERE A' +
      'PPGRP_ID = :id AND APPSGRPMT_ID = :mt_id ORDER BY GRPD.APP_ID'
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mt_id'
        ParamType = ptUnknown
      end>
    ProviderName = 'prvApplicationSubGroupsDT'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsApplicationSubGroupsDTReconcileError
    Left = 664
    Top = 112
  end
  object cdsApprovationTypes: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM APPROVATIONTYPES ORDER BY APT_ID'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvApprovationTypes'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsApprovationTypesReconcileError
    Left = 664
    Top = 12
  end
  object dtsApprovationTypes: TDataSource
    DataSet = cdsApprovationTypes
    Left = 692
    Top = 12
  end
  object cdsApprovationTypesID: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT * FROM APPROVATIONTYPES WHERE APT_ID = :id ORDER BY APT_I' +
      'D'
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    ProviderName = 'prvApprovationTypesID'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsApprovationTypesReconcileError
    Left = 32
    Top = 624
  end
  object cdsCardLevelPrices: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CARDLEVELPRICES ORDER BY CLP_ID'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvCardLevelPrices'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsCardLevelPricesReconcileError
    Left = 560
    Top = 216
  end
  object dtsCardLevelPrices: TDataSource
    DataSet = cdsCardLevelPrices
    Left = 588
    Top = 216
  end
  object dtsCardLevelPricesValidity: TDataSource
    DataSet = cdsCardLevelPricesValidity
    Left = 588
    Top = 272
  end
  object cdsCardLevelPricesValidity: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CARDLEVELPRICESVALIDITY ORDER BY CLPVAL_SEQNBR'
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'CLP_ID'
    MasterFields = 'CLP_ID'
    MasterSource = dtsCardLevelPrices
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvCardLevelPricesValidity'
    BeforePost = cdsExportLocationsBeforePost
    Left = 560
    Top = 272
  end
  object dtsCardLevelPricesXCardDesign: TDataSource
    DataSet = cdsCardLevelPricesXCardDesign
    Left = 588
    Top = 328
  end
  object cdsCardLevelPricesXCardDesign: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT CLP.*, CD.CD_DESC  FROM CARDLEVELPRICESXCARDDESIGN CLP LE' +
      'FT JOIN CARDDESIGN CD ON CD.CD_ID = CLP.CD_ID ORDER BY CLP.CLPCD' +
      '_SEQNBR'
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'CLP_ID'
    MasterFields = 'CLP_ID'
    MasterSource = dtsCardLevelPrices
    Params = <>
    ProviderName = 'prvCardLevelPricexCardDesign'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsCardLevelPricesXCardDesignReconcileError
    Left = 560
    Top = 328
  end
  object dtsHotListReasonXCardLPrices: TDataSource
    DataSet = cdsHotListReasonXCardLPrices
    Left = 588
    Top = 392
  end
  object cdsHotListReasonXCardLPrices: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT HLCP.*, HLR.HLR_DESC FROM HOTLISTREASONXCARDLPRICES HLCP ' +
      'LEFT JOIN HOTLISTREASON HLR ON HLR.HLR_ID = HLCP.HLR_ID ORDER BY' +
      ' HLCP.HLRCLP_SEQNBR'
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'CLP_ID'
    MasterFields = 'CLP_ID'
    MasterSource = dtsCardLevelPrices
    Params = <>
    ProviderName = 'prvHotListReasonxCardLPrices'
    BeforePost = cdsExportLocationsBeforePost
    Left = 560
    Top = 392
  end
  object dtsCardDesign: TDataSource
    DataSet = cdsCardDesign
    Left = 588
    Top = 448
  end
  object cdsCardDesign: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CARDDESIGN'
    ConnectionBroker = DmSys.ConnBrkMaster
    Params = <>
    ProviderName = 'prvCardDesign'
    BeforePost = cdsExportLocationsBeforePost
    Left = 560
    Top = 448
  end
  object dtsHotListReasonList: TDataSource
    DataSet = cdsHotListReasonList
    Left = 588
    Top = 508
  end
  object cdsHotListReasonList: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT HLR.*, HLR.HLR_STATUS AS STATUS_ID, HLR.HLR_TYPE AS TYPE_' +
      'DESC, HLR.HLR_ACTION AS ACTION_DESC  FROM HOTLISTREASON HLR WHER' +
      'E HLR.HLR_ID < 99 AND HLR.HLR_STATUS = '#39'A'#39'ORDER BY HLR.HLR_DESC'
    ConnectionBroker = DmSys.ConnBrkMaster
    Params = <>
    ProviderName = 'prvHotListReason'
    BeforePost = cdsExportLocationsBeforePost
    Left = 560
    Top = 508
  end
  object cdsLineZonePrices: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT LZP.*, APP.APP_DESCSHORT, ISS.ISS_DESCSHORT FROM LINEZONE' +
      'PRICES LZP LEFT JOIN APPLICATIONS APP ON APP.APP_ID = LZP.APP_ID' +
      ' AND APP.ISS_ID = LZP.ISS_ID LEFT JOIN ISSUERS ISS ON ISS.ISS_ID' +
      ' = LZP.ISS_ID WHERE LZP.LZP_STATUS = '#39'A'#39' ORDER BY LZP_SEQNBR'
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'LD_ID'
    MasterFields = 'LDT_ID'
    MasterSource = DmSys.dtsLineDT
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvLineZonePrices'
    BeforeOpen = cdsLineZonePricesBeforeOpen
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsLineZonePricesAfterScroll
    OnReconcileError = cdsCardLevelPricesReconcileError
    Left = 560
    Top = 568
  end
  object dtsLineZonePrices: TDataSource
    DataSet = cdsLineZonePrices
    Left = 588
    Top = 568
  end
  object cdsLineZonePricesIndividual: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'LZPI_SECTION'
    Params = <>
    Left = 356
    Top = 568
    Data = {
      5D0000009619E0BD0100000018000000030000000000030000005D000C4C5A50
      495F53454354494F4E04000100000000000D4C5A50495F50524943455F474F08
      000400000000000F4C5A50495F50524943455F4241434B080004000000000000
      00}
    object cdsLineZonePricesIndividualLZPI_SECTION: TIntegerField
      FieldName = 'LZPI_SECTION'
    end
    object cdsLineZonePricesIndividualLZPI_PRICE_GO: TFloatField
      FieldName = 'LZPI_PRICE_GO'
    end
    object cdsLineZonePricesIndividualLZPI_PRICE_BACK: TFloatField
      FieldName = 'LZPI_PRICE_BACK'
    end
  end
  object dtsLineZonePricesIndividual: TDataSource
    DataSet = cdsLineZonePricesIndividual
    Left = 384
    Top = 568
  end
  object dtsLinePricesIndividual: TDataSource
    DataSet = cdsLinePricesIndividual
    Left = 211
    Top = 568
  end
  object cdsLineDiscountsIndividual: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'LDI_SECTION'
    Params = <>
    Left = 108
    Top = 568
    Data = {
      5A0000009619E0BD0100000018000000030000000000030000005A000B4C4449
      5F53454354494F4E04000100000000000C4C44495F50524943455F474F080004
      00000000000E4C44495F50524943455F4241434B08000400000000000000}
    object cdsLineDiscountsIndividualLDI_SECTION: TIntegerField
      FieldName = 'LDI_SECTION'
    end
    object cdsLineDiscountsIndividualLDI_PRICE_GO: TFloatField
      FieldName = 'LDI_PRICE_GO'
    end
    object cdsLineDiscountsIndividualLDI_PRICE_BACK: TFloatField
      FieldName = 'LDI_PRICE_BACK'
    end
  end
  object dtsLineDiscountsIndividual: TDataSource
    DataSet = cdsLineDiscountsIndividual
    Left = 136
    Top = 568
  end
  object cdsLinePricesIndividual: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'LPI_SECTION'
    Params = <>
    Left = 183
    Top = 568
    Data = {
      5A0000009619E0BD0100000018000000030000000000030000005A000B4C5049
      5F53454354494F4E04000100000000000C4C50495F50524943455F474F080004
      00000000000E4C50495F50524943455F4241434B08000400000000000000}
    object cdsLinePricesIndividualLPI_SECTION: TIntegerField
      FieldName = 'LPI_SECTION'
    end
    object cdsLinePricesIndividualLPI_PRICE_GO: TFloatField
      FieldName = 'LPI_PRICE_GO'
    end
    object cdsLinePricesIndividualLPI_PRICE_BACK: TFloatField
      FieldName = 'LPI_PRICE_BACK'
    end
  end
  object cdsApplicationVersions: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM APPLICATIONVERSIONS ORDER BY APPVER_VERSIONNBR'
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'ISS_ID;APP_ID'
    MasterFields = 'ISS_ID;APP_ID'
    MasterSource = DmSys.dtsApplications
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvApplicationVersions'
    BeforePost = cdsExportLocationsBeforePost
    Left = 460
    Top = 568
  end
  object dtsApplicationVersions: TDataSource
    DataSet = cdsApplicationVersions
    Left = 488
    Top = 568
  end
  object cdsApplicationVersionSeq: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT * FROM APPLICATIONVERSIONS WHERE APPVER_VERSIONNBR = :ver' +
      'sion AND ISS_ID = :iss AND APP_id = :app ORDER BY APPVER_VERSION' +
      'NBR'
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftUnknown
        Name = 'version'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'iss'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'app'
        ParamType = ptUnknown
      end>
    ProviderName = 'prvApplicationVersions'
    BeforePost = cdsExportLocationsBeforePost
    Left = 460
    Top = 508
  end
  object dtsApplicationVersionSeq: TDataSource
    DataSet = cdsApplicationVersionSeq
    Left = 488
    Top = 508
  end
  object cdsAcceptedTransportProviders: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT ATP.*, TP1.TP_DESC TP_ORIG, TP2.TP_DESC TP_DEST  FROM ACC' +
      'EPTEDTRANSPORTPROVIDERS ATP LEFT JOIN TRANSPORTPROVIDERS TP1 ON ' +
      'TP1.TP_ID = ATP.TP_ID LEFT JOIN TRANSPORTPROVIDERS TP2 ON TP2.TP' +
      '_ID = ATP.ACTP_TPID WHERE ATP.TP_ID = 1 ORDER BY TP1.TP_DESC'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvAcceptedTransportProviders'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsCardLevelPricesReconcileError
    Left = 264
    Top = 12
  end
  object dtsAcceptedTransportProviders: TDataSource
    DataSet = cdsAcceptedTransportProviders
    Left = 292
    Top = 12
  end
  object dtsTransportProvidersGroups: TDataSource
    AutoEdit = False
    DataSet = cdsTransportProvidersGroups
    Left = 384
    Top = 12
  end
  object cdsTransportProvidersGroups: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DISTINCT(ATP.TP_ID), TP1.TP_DESC  FROM ACCEPTEDTRANSPORTP' +
      'ROVIDERS ATP LEFT JOIN TRANSPORTPROVIDERS TP1 ON TP1.TP_ID = ATP' +
      '.TP_ID ORDER BY ATP.TP_ID'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvAcceptedTransportProvidersGroups'
    AfterScroll = cdsTransportProvidersGroupsAfterScroll
    Left = 356
    Top = 12
  end
  object cdsLKTransportProviders: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT TP.*, TP_STATUS AS STATUS_ID FROM TRANSPORTPROVIDERS TP W' +
      'HERE TP.TP_ID NOT IN (SELECT ATP.TP_ID FROM ACCEPTEDTRANSPORTPRO' +
      'VIDERS ATP)'
    ConnectionBroker = DmSys.ConnBrkMaster
    Params = <>
    ProviderName = 'prvTransportProvider'
    Left = 460
    Top = 12
  end
  object dtsLKTransportProviders: TDataSource
    AutoEdit = False
    DataSet = cdsLKTransportProviders
    Left = 488
    Top = 12
  end
  object cdsLisTransportProviders: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT TP.*, TP_STATUS AS STATUS_ID FROM TRANSPORTPROVIDERS TP W' +
      'HERE TP.TP_ID NOT IN (SELECT ATP.TP_ID FROM ACCEPTEDTRANSPORTPRO' +
      'VIDERS ATP WHERE ATP.TP_ID = 1)'
    ConnectionBroker = DmSys.ConnBrkMaster
    Params = <>
    ProviderName = 'prvTransportProvider'
    Left = 183
    Top = 12
  end
  object dtsLisTransportProviders: TDataSource
    AutoEdit = False
    DataSet = cdsLisTransportProviders
    Left = 211
    Top = 12
  end
  object cdsCardDesignxApps: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT CD.CD_DESC, CDXA.* FROM CARDDESIGNXAPPLICATIONS CDXA LEFT' +
      ' JOIN CARDDESIGN CD ON CD.CD_ID = CDXA.CD_ID'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvCardDesignxApp'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsIntegrationClearingReconcileError
    Left = 664
    Top = 216
  end
  object dtsCardDesignxApps: TDataSource
    AutoEdit = False
    DataSet = cdsCardDesignxApps
    Left = 692
    Top = 216
  end
  object cdsCardTemplatesxApps: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT CTE.CTE_DESC, PUT.PUT_DESC, TG.TG_DESC, VP.VP_DESC, LG.LG' +
      '_DESC, LM.LM_DESC, VT.VT_DESC, DS.DS_DESC, CTA.CTA_VALDATEQTY, C' +
      'TA.ISS_ID, CTA.APP_ID, CTA.CTE_ID, CTA.PUT_ID, CTA.TG_ID, CTA.VP' +
      '_ID, CTA.LG_ID, CTA.LM_ID, CTA.VT_ID, CTA.DS_ID FROM CARDTEMPLAT' +
      'ESXAPPLICATIONS CTA LEFT JOIN CARDTEMPLATES CTE    ON CTE.CTE_ID' +
      ' = CTA.CTE_ID LEFT JOIN PERIODUSETYPES PUT   ON PUT.PUT_ID = CTA' +
      '.PUT_ID LEFT JOIN TIMEGROUPS TG        ON TG.TG_ID   = CTA.TG_ID' +
      ' LEFT JOIN VALIDATIONPERIODS VP ON VP.VP_ID   = CTA.VP_ID LEFT J' +
      'OIN LINEGROUPS LG        ON LG.LG_ID   = CTA.LG_ID LEFT JOIN LIN' +
      'EMT LM            ON LM.LM_ID   = CTA.LM_ID LEFT JOIN VALIDITYTY' +
      'PES VT     ON VT.VT_ID   = CTA.VT_ID LEFT JOIN DATESTATUS DS    ' +
      '    ON DS.DS_ID   = CTA.DS_ID'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvCardTemplateXApps'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsIntegrationClearingReconcileError
    Left = 664
    Top = 272
  end
  object dtsCardTemplatesxApps: TDataSource
    AutoEdit = False
    DataSet = cdsCardTemplatesxApps
    Left = 692
    Top = 272
  end
  object cdsCardTypesXApps: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT CTY.CTY_DESC,CTYAPP.* FROM CARDTYPESXAPPLICATIONS CTYAPP ' +
      'LEFT JOIN CARDTYPES CTY ON CTY.CTY_ID = CTYAPP.CTY_ID'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvCardTypesXApps'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsIntegrationClearingReconcileError
    Left = 664
    Top = 328
  end
  object dtsCardTypesXApps: TDataSource
    AutoEdit = False
    DataSet = cdsCardTypesXApps
    Left = 692
    Top = 328
  end
  object cdsTPXApps: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT TP.TP_DESC, TPA.* FROM TRANSPORTPROVIDERSXAPPS TPA LEFT J' +
      'OIN TRANSPORTPROVIDERS TP ON TP.TP_ID = TPA.TP_ID'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvTPXApp'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsIntegrationClearingReconcileError
    Left = 664
    Top = 392
  end
  object dtsTPXApps: TDataSource
    AutoEdit = False
    DataSet = cdsTPXApps
    Left = 692
    Top = 392
  end
  object cdsUserTypesXApps: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT UT.UT_DESC, UTA.* FROM USERTYPESXAPPLICATIONS UTA LEFT JO' +
      'IN USERTYPES UT ON UT.UT_ID = UTA.UT_ID'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvUserTypesXApps'
    BeforePost = cdsExportLocationsBeforePost
    OnReconcileError = cdsIntegrationClearingReconcileError
    Left = 664
    Top = 448
  end
  object dtsUserTypesXApps: TDataSource
    AutoEdit = False
    DataSet = cdsUserTypesXApps
    Left = 692
    Top = 448
  end
  object cdsApplicationsXLineMT: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT APPLM.*, LM.LM_DESC, APP.APP_DESCSHORT, ISS.ISS_DESCLONG ' +
      ' FROM APPLICATIONSXLINEMT APPLM INNER JOIN APPLICATIONS APP ON (' +
      'APP.APP_ID =  APPLM.APP_ID AND APP.ISS_ID = APPLM.ISS_ID) INNER ' +
      'JOIN LINEMT LM ON (LM.LM_ID = APPLM.LM_ID) INNER JOIN ISSUERS IS' +
      'S ON (ISS.ISS_ID = APPLM.ISS_ID)'
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvApplicationsXLineMT'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    OnReconcileError = cdsCardLevelPricesReconcileError
    Left = 664
    Top = 508
  end
  object dtsApplicationsXLineMT: TDataSource
    DataSet = cdsApplicationsXLineMT
    Left = 692
    Top = 508
  end
  object cdsRelApplications: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvApplications'
    Left = 664
    Top = 568
  end
  object dtsRelApplications: TDataSource
    AutoEdit = False
    DataSet = cdsRelApplications
    Left = 692
    Top = 568
  end
  object cdsRelValidatorActions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValidatorFunctions'
    Left = 804
    Top = 12
  end
  object dtsRelValidatorActions: TDataSource
    AutoEdit = False
    DataSet = cdsRelValidatorActions
    Left = 832
    Top = 12
  end
  object cdsLineRange: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineRange'
    BeforePost = cdsExportLocationsBeforePost
    Left = 804
    Top = 56
  end
  object dtsLineRange: TDataSource
    AutoEdit = False
    DataSet = cdsLineRange
    Left = 832
    Top = 56
  end
  object cdsStates: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvStates'
    BeforePost = cdsExportLocationsBeforePost
    Left = 804
    Top = 112
  end
  object dtsStates: TDataSource
    AutoEdit = False
    DataSet = cdsStates
    Left = 832
    Top = 112
  end
  object cdsRegion: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvRegion'
    BeforePost = cdsExportLocationsBeforePost
    Left = 804
    Top = 160
  end
  object dtsRegion: TDataSource
    AutoEdit = False
    DataSet = cdsRegion
    Left = 832
    Top = 160
  end
  object cdsSubRegion: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvSubRegion'
    BeforePost = cdsExportLocationsBeforePost
    Left = 804
    Top = 216
  end
  object dtsSubRegion: TDataSource
    AutoEdit = False
    DataSet = cdsSubRegion
    Left = 832
    Top = 216
  end
  object cdsCities: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvCities'
    BeforePost = cdsExportLocationsBeforePost
    Left = 804
    Top = 272
  end
  object dtsCities: TDataSource
    AutoEdit = False
    DataSet = cdsCities
    Left = 832
    Top = 272
  end
  object cdsStatesLKP: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvStates'
    BeforePost = cdsExportLocationsBeforePost
    Left = 804
    Top = 328
  end
  object dtsStatesLKP: TDataSource
    AutoEdit = False
    DataSet = cdsStatesLKP
    Left = 832
    Top = 328
  end
  object cdsRegionLKP: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvRegion'
    BeforePost = cdsExportLocationsBeforePost
    Left = 791
    Top = 392
  end
  object dtsRegionLKP: TDataSource
    AutoEdit = False
    DataSet = cdsRegionLKP
    Left = 819
    Top = 392
  end
  object cdsSubRegionLKP: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvSubRegion'
    BeforePost = cdsExportLocationsBeforePost
    Left = 791
    Top = 448
  end
  object dtsSubRegionLKP: TDataSource
    AutoEdit = False
    DataSet = cdsSubRegionLKP
    Left = 819
    Top = 448
  end
  object cdsReasonTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvReasonTypes'
    BeforePost = cdsExportLocationsBeforePost
    Left = 791
    Top = 508
  end
  object dtsReasonTypes: TDataSource
    AutoEdit = False
    DataSet = cdsReasonTypes
    Left = 819
    Top = 508
  end
  object cdsReasons: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvReasons'
    BeforePost = cdsExportLocationsBeforePost
    Left = 791
    Top = 564
  end
  object dtsReasons: TDataSource
    AutoEdit = False
    DataSet = cdsReasons
    Left = 819
    Top = 564
  end
  object cdsReasonTypesLKP: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvReasonTypes'
    BeforePost = cdsExportLocationsBeforePost
    Left = 924
    Top = 12
  end
  object dtsReasonTypesLKP: TDataSource
    AutoEdit = False
    DataSet = cdsReasonTypesLKP
    Left = 952
    Top = 12
  end
  object dtsUserTypesLKP: TDataSource
    AutoEdit = False
    DataSet = cdsUserTypesLKP
    Left = 952
    Top = 56
  end
  object cdsUserTypesLKP: TClientDataSet
    Aggregates = <>
    ConnectionBroker = DmSys.ConnBrkMaster
    Params = <>
    ProviderName = 'prvUserTypes'
    BeforePost = cdsExportLocationsBeforePost
    Left = 924
    Top = 56
  end
  object cdsHandicapEquipment: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvHandicapEquipment'
    BeforePost = cdsExportLocationsBeforePost
    Left = 924
    Top = 112
  end
  object dtsHandicapEquipment: TDataSource
    AutoEdit = False
    DataSet = cdsHandicapEquipment
    Left = 952
    Top = 112
  end
  object cdsBanks: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvBanks'
    BeforePost = cdsExportLocationsBeforePost
    Left = 924
    Top = 160
  end
  object dtsBanks: TDataSource
    AutoEdit = False
    DataSet = cdsBanks
    Left = 952
    Top = 160
  end
  object cdsNossoNumero: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'BK_ID'
    MasterFields = 'BK_ID'
    MasterSource = dtsBanks
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvNossoNumero'
    BeforePost = cdsExportLocationsBeforePost
    Left = 924
    Top = 216
  end
  object dtsNossoNumero: TDataSource
    AutoEdit = False
    DataSet = cdsNossoNumero
    Left = 952
    Top = 216
  end
  object cdsCedente: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'BK_ID'
    MasterFields = 'BK_ID'
    MasterSource = dtsBanks
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvCedente'
    BeforePost = cdsExportLocationsBeforePost
    Left = 924
    Top = 272
  end
  object dtsCedente: TDataSource
    AutoEdit = False
    DataSet = cdsCedente
    Left = 952
    Top = 272
  end
  object cdsLineSelGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineSelGroups'
    Left = 360
    Top = 624
  end
  object cdsLineIntegTimeGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineIntegTimeGroups'
    BeforePost = cdsExportLocationsBeforePost
    Left = 928
    Top = 500
  end
  object dtsLineIntegTimeGroups: TDataSource
    AutoEdit = False
    DataSet = cdsLineIntegTimeGroups
    Left = 956
    Top = 500
  end
  object cdsLineIntegrationDT: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'LI_ID'
    MasterFields = 'LI_ID'
    MasterSource = dtsLineIntegration
    PacketRecords = 0
    Params = <
      item
        DataType = ftBCD
        Name = 'LI_ID'
        ParamType = ptInput
        Value = 0c
      end>
    ProviderName = 'prvLineIntegrationDT'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 107
    Top = 624
  end
  object dtsLineIntegrationDT: TDataSource
    DataSet = cdsLineIntegrationDT
    OnDataChange = dtsLineIntegrationDTDataChange
    Left = 135
    Top = 624
  end
  object cdsLineIntegTimeGroupsxPeriods: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftUnknown
        Name = 'LITG_ID'
        ParamType = ptInput
      end>
    ProviderName = 'prvLineIntegTimeGroupsxPeriods'
    Left = 928
    Top = 556
  end
  object dtsLineIntegTimeGroupsxPeriods: TDataSource
    AutoEdit = False
    DataSet = cdsLineIntegTimeGroupsxPeriods
    Left = 956
    Top = 556
  end
  object cdsLineIntegPeriodsxTimeLimits: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftString
        Name = 'LIP_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvLineIntegPeriodsxTimeLimits'
    Left = 928
    Top = 440
  end
  object dtsLineIntegPeriodsxTimeLimits: TDataSource
    AutoEdit = False
    DataSet = cdsLineIntegPeriodsxTimeLimits
    Left = 956
    Top = 440
  end
  object dtsLineIntegPeriods: TDataSource
    AutoEdit = False
    DataSet = cdsLineIntegPeriods
    Left = 956
    Top = 384
  end
  object cdsLineIntegPeriods: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineIntegPeriods'
    BeforePost = cdsExportLocationsBeforePost
    Left = 928
    Top = 384
  end
  object cdsLineIntegTimeLimits: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineIntegTimeLimits'
    BeforePost = cdsExportLocationsBeforePost
    Left = 924
    Top = 327
  end
  object dtsLineIntegTimeLimits: TDataSource
    DataSet = cdsLineIntegTimeLimits
    Left = 952
    Top = 327
  end
  object cdsLineIntegrationDTXApps: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftBCD
        Name = 'LI_ID'
        ParamType = ptInput
        Value = 0c
      end
      item
        DataType = ftTimeStamp
        Name = 'LID_DATE'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'prvLineIntegrationDTXApps'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 179
    Top = 624
  end
  object dtsLineIntegrationDTXApps: TDataSource
    DataSet = cdsLineIntegrationDTXApps
    Left = 207
    Top = 624
  end
  object dtsPersonnalFunctions_PFG_ID: TDataSource
    DataSet = cdsPersonnelFunctions_PFG_ID
    Left = 492
    Top = 624
  end
  object cdsPersonnelFunctions_PFG_ID: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftString
        Name = 'PFG_ID'
        ParamType = ptInput
      end>
    ProviderName = 'prvPersonnelFunctions_PFG_ID'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 464
    Top = 624
  end
  object cdsFTPExportLocations: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvFTPExportLocations'
    BeforePost = cdsExportLocationsBeforePost
    AfterScroll = cdsAcceptedFctAfterScroll
    Left = 32
    Top = 677
  end
  object dtsFTPExportLocations: TDataSource
    DataSet = cdsFTPExportLocations
    Left = 60
    Top = 677
  end
  object cdsInfoParameters: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvInfoParameters'
    BeforePost = cdsExportLocationsBeforePost
    Left = 179
    Top = 677
  end
  object dtsInfoParameters: TDataSource
    DataSet = cdsInfoParameters
    Left = 207
    Top = 677
  end
  object cdsTransportProvidersXInfoParameters: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvTransportProvidersXInfopararameters'
    BeforePost = cdsExportLocationsBeforePost
    Left = 355
    Top = 677
  end
  object dtsTransportProvidersXInfoParameters: TDataSource
    DataSet = cdsTransportProvidersXInfoParameters
    Left = 383
    Top = 677
  end
end
