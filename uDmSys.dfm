object DmSys: TDmSys
  Tag = 22
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 241
  Top = 113
  Height = 605
  Width = 1118
  object cdsLineMt: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineMt'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 24
    Top = 64
  end
  object ConnBrkMaster: TConnectionBroker
    Connection = shrConnMaster
    Left = 32
    Top = 10
  end
  object shrConnMaster: TSharedConnection
    ParentConnection = dmConexao.DCOMConnMaster
    ChildName = 'Mercury2_Base'
    Left = 128
    Top = 8
  end
  object dtsFarelevels: TDataSource
    AutoEdit = False
    DataSet = cdsFarelevels
    Left = 80
    Top = 112
  end
  object cdsFarelevels: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvFarelevels'
    Left = 32
    Top = 112
  end
  object cdsLineTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineTypes'
    Left = 32
    Top = 160
  end
  object dtsLineTypes: TDataSource
    AutoEdit = False
    DataSet = cdsLineTypes
    Left = 80
    Top = 160
  end
  object cdsLocations: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLocations'
    Left = 32
    Top = 208
  end
  object dtsLocations: TDataSource
    AutoEdit = False
    DataSet = cdsLocations
    Left = 80
    Top = 208
  end
  object cdsLineGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineGroups'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 136
    Top = 256
  end
  object dtsLineGroups: TDataSource
    AutoEdit = False
    DataSet = cdsLineGroups
    Left = 184
    Top = 256
  end
  object cdsPersonnelTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvPersonnelTypesCad'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnPostError = cdsPersonnelTypesPostError
    Left = 32
    Top = 256
  end
  object dtsPersonnelTypes: TDataSource
    AutoEdit = False
    DataSet = cdsPersonnelTypes
    Left = 80
    Top = 256
  end
  object cdsValidatorFunctions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftString
        Name = 'PRST_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'VEHT_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'TP_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvValidatorFunctions'
    AfterScroll = cdsLineMtAfterScroll
    Left = 376
    Top = 160
  end
  object dtsValidatorFunctions: TDataSource
    AutoEdit = False
    DataSet = cdsValidatorFunctions
    Left = 428
    Top = 160
  end
  object cdsValidatorStates: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValidatorStates'
    Left = 376
    Top = 208
  end
  object dtsValidatorStates: TDataSource
    AutoEdit = False
    DataSet = cdsValidatorStates
    Left = 428
    Top = 208
  end
  object cdsPersonneltypesXValidatorfcts: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvPersonnelTypesXValidatorFcts'
    AfterScroll = cdsLineMtAfterScroll
    Left = 32
    Top = 296
  end
  object dtsPersonnelTypesXValidatorfcts: TDataSource
    AutoEdit = False
    DataSet = cdsPersonneltypesXValidatorfcts
    Left = 80
    Top = 296
  end
  object cdsValidatorMessages: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValidatorMessages'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 740
    Top = 212
  end
  object cdsDiscountTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvDiscountTypes'
    Left = 376
    Top = 112
  end
  object cdsValidatorDisplaysMT: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValidatorDisplaysMT'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnPostError = cdsValidatorDisplaysMTPostError
    Left = 376
    Top = 392
  end
  object cdsValidatorDisplaysDT: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'VDM_CODE'
    MasterFields = 'VDM_CODE'
    MasterSource = dtsValidatorDisplaysMT
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'VDM_CODE'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvValidatorDisplaysDT'
    AfterInsert = cdsValidatorDisplaysDTAfterInsert
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnPostError = cdsValidatorDisplaysDTPostError
    Left = 376
    Top = 448
  end
  object dtsValidatorDisplaysMT: TDataSource
    AutoEdit = False
    DataSet = cdsValidatorDisplaysMT
    Left = 428
    Top = 392
  end
  object dtsValidatorDisplaysDT: TDataSource
    DataSet = cdsValidatorDisplaysDT
    Left = 428
    Top = 448
  end
  object cdsTimeLimits: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvTimeLimits'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 740
    Top = 300
  end
  object cdsGeral: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvGeral'
    Left = 240
    Top = 8
  end
  object cdsTimeGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvDtsTimeGroups'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 512
    Top = 448
  end
  object cdsLinePrices: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    Params = <>
    ProviderName = 'prvLinePrices'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnPostError = cdsLinePricesPostError
    OnReconcileError = cdsProviderTypesReconcileError
    Left = 376
    Top = 344
  end
  object dtsLineMT: TDataSource
    AutoEdit = False
    DataSet = cdsLineMt
    Left = 80
    Top = 64
  end
  object cdsLineDiscounts: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    IndexFieldNames = 'LD_ID'
    MasterFields = 'LD_ID'
    MasterSource = dtsLineDetails
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'LD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvLineDiscounts'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 32
    Top = 504
  end
  object dtsDiscountTypes: TDataSource
    AutoEdit = False
    DataSet = cdsDiscountTypes
    Left = 428
    Top = 112
  end
  object cdsMasterApp: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvMasterApp'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnPostError = cdsMasterAppPostError
    Left = 32
    Top = 344
  end
  object cdsIssuers: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvIssuers'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnPostError = cdsIssuersPostError
    Left = 20
    Top = 392
  end
  object cdsSystemParameters: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvSystemParameters'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnPostError = cdsSystemParametersPostError
    Left = 740
    Top = 156
  end
  object cdsStatisticalFamilies: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvStatisticalFamilies'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 32
    Top = 448
  end
  object cdsUserTypesCad: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvUserTypesCad'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 632
    Top = 296
  end
  object cdsCardTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvCardTypes'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 632
    Top = 392
  end
  object dtsCardTypes: TDataSource
    AutoEdit = False
    DataSet = cdsCardTypes
    Left = 678
    Top = 392
  end
  object cdsUserTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvUserTypes'
    Left = 136
    Top = 400
  end
  object dtsUserTypes: TDataSource
    AutoEdit = False
    DataSet = cdsUserTypes
    Left = 182
    Top = 400
  end
  object cdsCarddesignCad: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvCardDesignCad'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnReconcileError = cdsCarddesignCadReconcileError
    Left = 512
    Top = 392
  end
  object cdsCardTemplates: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvCardTemplatesCad'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnReconcileError = cdsCardTemplatesReconcileError
    Left = 512
    Top = 296
  end
  object cdsReloadPeriodMT: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvReloadPeriodMT'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnPostError = cdsReloadPeriodMTPostError
    Left = 376
    Top = 64
  end
  object cdsApplications: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvApplications'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    OnPostError = cdsApplicationsPostError
    Left = 376
    Top = 296
  end
  object dtsApplications: TDataSource
    AutoEdit = False
    DataSet = cdsApplications
    Left = 428
    Top = 296
  end
  object cdsReloadPeriodDT: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'RPM_YEAR;RPM_PERIOD'
    MasterFields = 'RPM_YEAR;RPM_PERIOD'
    MasterSource = dtsReloadPeriodMT
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'RPM_YEAR'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'RPM_PERIOD'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvReloadperiodDT'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnPostError = cdsReloadPeriodDTPostError
    Left = 512
    Top = 113
  end
  object dtsReloadPeriodDT: TDataSource
    AutoEdit = False
    DataSet = cdsReloadPeriodDT
    Left = 560
    Top = 112
  end
  object dtsReloadPeriodMT: TDataSource
    AutoEdit = False
    DataSet = cdsReloadPeriodMT
    Left = 428
    Top = 64
  end
  object cdsLineDT: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'LM_ID'
    MasterFields = 'LM_ID'
    MasterSource = dtsLineMT
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvLineDT'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 136
    Top = 64
  end
  object dtsLineDT: TDataSource
    AutoEdit = False
    DataSet = cdsLineDT
    Left = 182
    Top = 64
  end
  object cdsVehicleTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvVehicleTypes'
    Left = 632
    Top = 64
  end
  object dtsVehicleTypes: TDataSource
    AutoEdit = False
    DataSet = cdsVehicleTypes
    Left = 678
    Top = 64
  end
  object cdsValidatorFunctionsDisp: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValidatorFunctionsDisp'
    Left = 740
    Top = 112
  end
  object cdsHolidays: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvHolidays'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 512
    Top = 64
  end
  object dtsHolidays: TDataSource
    AutoEdit = False
    DataSet = cdsHolidays
    Left = 560
    Top = 64
  end
  object dtsIssuers: TDataSource
    AutoEdit = False
    DataSet = cdsIssuers
    Left = 80
    Top = 392
  end
  object dtsStatisticalFamilies: TDataSource
    AutoEdit = False
    DataSet = cdsStatisticalFamilies
    Left = 80
    Top = 448
  end
  object dtsMasterApplications: TDataSource
    AutoEdit = False
    DataSet = cdsMasterApp
    Left = 80
    Top = 344
  end
  object cdsApplicationFunctions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvApplicationFunctions'
    Left = 368
    Top = 504
  end
  object dtsApplicationFunctions: TDataSource
    AutoEdit = False
    DataSet = cdsApplicationFunctions
    Left = 428
    Top = 504
  end
  object cdsSubApplications: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'APP_ID;ISS_ID'
    MasterFields = 'APP_ID;ISS_ID'
    MasterSource = dtsApplications
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'APP_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ISS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvSubApplications'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 248
    Top = 64
  end
  object dtsSubApplications: TDataSource
    AutoEdit = False
    DataSet = cdsSubApplications
    Left = 296
    Top = 64
  end
  object cdsApplicationsLook: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvApplicationsLook'
    AfterScroll = cdsApplicationsAfterScroll
    Left = 248
    Top = 112
  end
  object dtsApplicationsLook: TDataSource
    AutoEdit = False
    DataSet = cdsApplicationsLook
    Left = 296
    Top = 112
  end
  object cdsValidatorActions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValidatorActions'
    BeforePost = cdsApplicationsBeforePost
    Left = 740
    Top = 504
  end
  object dtsValidatorActions: TDataSource
    AutoEdit = False
    DataSet = cdsValidatorActions
    Left = 856
    Top = 496
  end
  object cdsAppsXValidatorActions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'APP_ID;ISS_ID'
    MasterFields = 'APP_ID;ISS_ID'
    MasterSource = dtsApplications
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'APP_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ISS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvAppsXValidatorActions'
    OnPostError = cdsAppsXValidatorActionsPostError
    Left = 248
    Top = 208
  end
  object dtsAppsXValidatorActions: TDataSource
    AutoEdit = False
    DataSet = cdsAppsXValidatorActions
    Left = 296
    Top = 208
  end
  object cdsAppsXValidatorConditions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'APP_ID;ISS_ID'
    MasterFields = 'APP_ID;ISS_ID'
    MasterSource = dtsApplications
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'APP_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ISS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvAppsXValidatorConditions'
    OnPostError = cdsAppsXValidatorConditionsPostError
    Left = 248
    Top = 256
  end
  object dtsAppsXValidatorConditions: TDataSource
    AutoEdit = False
    DataSet = cdsAppsXValidatorConditions
    Left = 296
    Top = 256
  end
  object cdsValidatorConditions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValidatorConditions'
    Left = 376
    Top = 256
  end
  object dtsValidatorConditions: TDataSource
    AutoEdit = False
    DataSet = cdsValidatorConditions
    Left = 428
    Top = 256
  end
  object cdsAppsXValVisualActions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'APP_ID;ISS_ID'
    MasterFields = 'APP_ID;ISS_ID'
    MasterSource = dtsApplications
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'APP_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ISS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvAppsXValVisualActions'
    OnPostError = cdsAppsXValVisualActionsPostError
    Left = 248
    Top = 296
  end
  object dtsAppsXValVisualActions: TDataSource
    AutoEdit = False
    DataSet = cdsAppsXValVisualActions
    Left = 296
    Top = 296
  end
  object cdsValVisualActions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValVisualActions'
    Left = 248
    Top = 344
  end
  object dtsValVisualActions: TDataSource
    AutoEdit = False
    DataSet = cdsValVisualActions
    Left = 296
    Top = 344
  end
  object cdsValidatorStatesXApps: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'APP_ID;ISS_ID'
    MasterFields = 'APP_ID;ISS_ID'
    MasterSource = dtsApplications
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'APP_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ISS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvValidatorStatesXApps'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    OnPostError = cdsValidatorStatesXAppsPostError
    Left = 248
    Top = 400
  end
  object dtsValidatorStatesXApps: TDataSource
    AutoEdit = False
    DataSet = cdsValidatorStatesXApps
    Left = 296
    Top = 400
  end
  object cdsTransportProvidersXLineMT: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'TP_ID'
    MasterFields = 'TP_ID'
    MasterSource = dtsTransportProviders
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'TP_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvTransportProvidersXLineMT'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 248
    Top = 448
  end
  object dtsTransportProvidersXLineMT: TDataSource
    AutoEdit = False
    DataSet = cdsTransportProvidersXLineMT
    Left = 296
    Top = 448
  end
  object cdsProviders: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvProviders'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 248
    Top = 504
  end
  object dtsProviders: TDataSource
    AutoEdit = False
    DataSet = cdsProviders
    Left = 298
    Top = 506
  end
  object cdsProviderTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvProviderType'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    OnPostError = cdsProviderTypesPostError
    OnReconcileError = cdsProviderTypesReconcileError
    Left = 632
    Top = 504
  end
  object dtsLinePrices: TDataSource
    AutoEdit = False
    DataSet = cdsLinePrices
    Left = 428
    Top = 344
  end
  object cdsFarelevelsLinePrices: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvGeral'
    Left = 136
    Top = 448
  end
  object dtsFarelevelsLinePrices: TDataSource
    AutoEdit = False
    DataSet = cdsFarelevelsLinePrices
    Left = 182
    Top = 448
  end
  object dtsLineDiscounts: TDataSource
    AutoEdit = False
    DataSet = cdsLineDiscounts
    Left = 80
    Top = 504
  end
  object cdsCollectors: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvGeral'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 512
    Top = 160
  end
  object cdsCollectorsXTransportProviders: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'COL_ID'
    MasterFields = 'COL_ID'
    MasterSource = dtsCollectors
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'COL_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvCollectorsXTransportProviders'
    Left = 512
    Top = 208
  end
  object dtsCollectors: TDataSource
    AutoEdit = False
    DataSet = cdsCollectors
    Left = 560
    Top = 160
  end
  object dtsCollectorsXTransportProviders: TDataSource
    AutoEdit = False
    DataSet = cdsCollectorsXTransportProviders
    Left = 560
    Top = 208
  end
  object cdsCardTemplatesXApp: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'CTE_ID'
    MasterFields = 'CTE_ID'
    MasterSource = dtsCardTemplates
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'CTE_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvCardTemplatesXApp'
    AfterScroll = cdsApplicationsAfterScroll
    OnPostError = cdsCardTemplatesXAppPostError
    Left = 512
    Top = 256
  end
  object dtsCardTemplatesXApp: TDataSource
    AutoEdit = False
    DataSet = cdsCardTemplatesXApp
    Left = 560
    Top = 256
  end
  object dtsCardTemplates: TDataSource
    AutoEdit = False
    DataSet = cdsCardTemplates
    Left = 560
    Top = 296
  end
  object cdsCardDesignXApp: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'CD_ID'
    MasterFields = 'CD_ID'
    MasterSource = dtsCarddesignCad
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'CD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvCardDesignXApp'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    OnPostError = cdsCardDesignXAppPostError
    Left = 512
    Top = 344
  end
  object dtsCarddesignXApp: TDataSource
    AutoEdit = False
    DataSet = cdsCardDesignXApp
    Left = 560
    Top = 344
  end
  object dtsCarddesignCad: TDataSource
    AutoEdit = False
    DataSet = cdsCarddesignCad
    Left = 560
    Top = 392
  end
  object cdsSeries: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvSeries'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 740
    Top = 392
  end
  object cdsTransportProviders: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvTransportProvider'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 816
    Top = 64
  end
  object dtsTransportProviders: TDataSource
    AutoEdit = False
    DataSet = cdsTransportProviders
    Left = 868
    Top = 64
  end
  object cdsTimeGroupsXTimeLimits: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'TG_ID'
    MasterFields = 'TG_ID'
    MasterSource = dtsTimeGroups
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'TG_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvTimeGroupsXTimeLimits'
    BeforePost = cdsApplicationsBeforePost
    Left = 512
    Top = 504
  end
  object dtsTimeGroupsXtimeLimits: TDataSource
    DataSet = cdsTimeGroupsXTimeLimits
    Left = 560
    Top = 504
  end
  object dtsTimeGroups: TDataSource
    DataSet = cdsTimeGroups
    Left = 560
    Top = 448
  end
  object cdsStatGroupsXConditions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'SG_ID'
    MasterFields = 'SG_ID'
    MasterSource = dtsStatisticalGroups
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'SG_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvStatGroupsXConditions'
    Left = 632
    Top = 160
  end
  object dtsStatisticalGroups: TDataSource
    DataSet = cdsStatisticalGroups
    Left = 678
    Top = 112
  end
  object dtsStatGroupsXConditions: TDataSource
    DataSet = cdsStatGroupsXConditions
    Left = 678
    Top = 160
  end
  object cdsStatisticalGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvStatisticalGroups'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 632
    Top = 112
  end
  object cdsTransportProvidersXStatGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'SG_ID'
    MasterFields = 'SG_ID'
    MasterSource = dtsStatisticalGroups
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'SG_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvTransportProvidersXStatGroups'
    Left = 632
    Top = 208
  end
  object dtsTransportProvidersXStatGroups: TDataSource
    DataSet = cdsTransportProvidersXStatGroups
    Left = 678
    Top = 208
  end
  object cdsStatFamiliesXConditions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'SF_ID'
    MasterFields = 'SF_ID'
    MasterSource = dtsStatisticalFamilies
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'SF_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvStatFamiliesXConditions'
    Left = 632
    Top = 256
  end
  object cdsUserTypesXApplicationsCad: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'UT_ID'
    MasterFields = 'UT_ID'
    MasterSource = dtsUsertypesCad
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'UT_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvUsertypesXApplicationsCad'
    OnPostError = cdsUserTypesXApplicationsCadPostError
    Left = 632
    Top = 344
  end
  object dtsUsertypesCad: TDataSource
    DataSet = cdsUserTypesCad
    Left = 678
    Top = 296
  end
  object dtsUserTypesXApplicationsCad: TDataSource
    DataSet = cdsUserTypesXApplicationsCad
    Left = 678
    Top = 344
  end
  object cdsCardTypesXApplications: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'CTY_ID'
    MasterFields = 'CTY_ID'
    MasterSource = dtsCardTypes
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'CTY_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvCardTypesXApplications'
    OnPostError = cdsCardTypesXApplicationsPostError
    Left = 632
    Top = 448
  end
  object dtsCardTypesXApplications: TDataSource
    DataSet = cdsCardTypesXApplications
    Left = 686
    Top = 448
  end
  object cdsLineDetails: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'Lm_Id'
    MasterFields = 'Lm_Id'
    MasterSource = dtsLineMT
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'LM_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvLineDetails'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 136
    Top = 112
  end
  object dtsLineDetails: TDataSource
    DataSet = cdsLineDetails
    Left = 182
    Top = 112
  end
  object cdsLineDetailTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineDetailTypes'
    Left = 136
    Top = 161
  end
  object dtsLineDetailTpes: TDataSource
    DataSet = cdsLineDetailTypes
    Left = 182
    Top = 160
  end
  object dtsProviderTypes: TDataSource
    DataSet = cdsProviderTypes
    Left = 678
    Top = 504
  end
  object cdsProvidersxProviderTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'PRV_ID'
    MasterFields = 'PRV_ID'
    MasterSource = dtsProviders
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'PRV_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvProviderxProviderTypes'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    OnPostError = cdsProvidersxProviderTypesPostError
    Left = 128
    Top = 208
  end
  object dtsProvidersxProviderTypes: TDataSource
    DataSet = cdsProvidersxProviderTypes
    Left = 182
    Top = 208
  end
  object cdsProviderSubTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvSubTypes'
    Left = 128
    Top = 296
  end
  object dtsProviderSubTypes: TDataSource
    DataSet = cdsProviderSubTypes
    Left = 182
    Top = 296
  end
  object cdsApplicationStrings: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'APP_ID;ISS_ID'
    MasterFields = 'APP_ID;ISS_ID'
    MasterSource = dtsApplications
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'APP_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ISS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvApplicationStrings'
    Left = 136
    Top = 344
  end
  object dtsApplicationStrings: TDataSource
    DataSet = cdsApplicationStrings
    Left = 182
    Top = 344
  end
  object cdsOrigAppLook: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvApplicationsLook'
    Left = 248
    Top = 160
  end
  object dtsOrigAppLook: TDataSource
    AutoEdit = False
    DataSet = cdsOrigAppLook
    Left = 296
    Top = 160
  end
  object cdsHandicapTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvHandCapTypes'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsHandicapTypesAfterScroll
    Left = 740
    Top = 340
  end
  object cdsHotListReason: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvHotListReason'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 740
    Top = 448
  end
  object cdsKeyTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvKeytypes'
    BeforePost = cdsApplicationsBeforePost
    Left = 740
    Top = 256
  end
  object cdsTransportProvidersGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvTransportProvidersGroups'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 816
    Top = 112
  end
  object dtsTransportProvidersGroups: TDataSource
    DataSet = cdsTransportProvidersGroups
    Left = 908
    Top = 112
  end
  object cdsTranspGroupsXTransp: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'TPG_ID'
    MasterFields = 'TPG_ID'
    MasterSource = dtsTransportProvidersGroups
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'TPG_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvTranspGroupsXTransp'
    Left = 816
    Top = 156
  end
  object dtsTranspGroupsXTransp: TDataSource
    DataSet = cdsTranspGroupsXTransp
    Left = 868
    Top = 156
  end
  object cdsValFunc: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvValFunc'
    BeforePost = cdsApplicationsBeforePost
    AfterScroll = cdsApplicationsAfterScroll
    Left = 140
    Top = 508
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = cdsValFunc
    Left = 188
    Top = 508
  end
  object cdsStudentTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvStudentTypes'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    OnReconcileError = cdsStudentTypesReconcileError
    Left = 816
    Top = 224
  end
  object dtsStudentTypes: TDataSource
    AutoEdit = False
    DataSet = cdsStudentTypes
    Left = 868
    Top = 224
  end
  object dstApplicationFunctionVersions: TDataSource
    DataSet = cdsApplicationFunctionVersions
    Left = 472
    Top = 566
  end
  object cdsApplicationFunctionVersions: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'AF_ID'
    MasterFields = 'AF_ID'
    MasterSource = dtsApplicationFunctions
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'AF_ID'
        ParamType = ptInput
        Size = 1
        Value = '0'
      end>
    ProviderName = 'prvApplicationFunctionVersions'
    BeforePost = cdsApplicationFunctionVersionsBeforePost
    Left = 288
    Top = 570
  end
  object cdsVehTypXApp: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'APP_ID;ISS_ID'
    MasterFields = 'APP_ID;ISS_ID'
    MasterSource = dtsApplications
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'APP_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ISS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvVehTypXApp'
    OnPostError = cdsVehTypXAppPostError
    Left = 720
    Top = 600
  end
  object dtsVehTypXApp: TDataSource
    DataSet = cdsVehTypXApp
    Left = 816
    Top = 600
  end
  object ConnBrkBase: TConnectionBroker
    Connection = shrConnBase
    Left = 344
    Top = 10
  end
  object shrConnBase: TSharedConnection
    ParentConnection = dmConexao.DCOMConnMaster
    ChildName = 'Mercury2_Base'
    Left = 440
    Top = 8
  end
  object cdsTransprovXVehTypesXApps: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'APP_ID;ISS_ID'
    MasterFields = 'APP_ID;ISS_ID'
    MasterSource = dtsApplications
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'APP_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ISS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvTransprovXVehTypesXApps'
    OnPostError = cdsTransprovXVehTypesXAppsPostError
    Left = 849
    Top = 351
  end
  object dtsTransprovXVehTypesXApps: TDataSource
    AutoEdit = False
    DataSet = cdsTransprovXVehTypesXApps
    Left = 885
    Top = 351
  end
  object dtsZoneLocations: TDataSource
    DataSet = cdsZoneLocations
    Left = 80
    Top = 560
  end
  object cdsZoneLocations: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvZoneLocations'
    BeforePost = cdsLineMtBeforePost
    Left = 32
    Top = 560
  end
  object cdsZones: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvZones'
    BeforePost = cdsLineMtBeforePost
    Left = 32
    Top = 616
  end
  object dtsZones: TDataSource
    DataSet = cdsZones
    Left = 80
    Top = 616
  end
  object cdsLineDetailsXZones: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Filter = 'ldzn_status = '#39'A'#39
    Filtered = True
    IndexFieldNames = 'LD_ID'
    MasterFields = 'LD_ID'
    MasterSource = dtsLineDetails
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'LM_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvLineDetailsXZones'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 160
    Top = 560
  end
  object dtsLineDetailsXZones: TDataSource
    DataSet = cdsLineDetailsXZones
    Left = 206
    Top = 560
  end
  object dtsReceiptMt: TDataSource
    DataSet = cdsReceiptMt
    Left = 296
    Top = 632
  end
  object cdsReceiptMt: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvReceiptMt'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsReceiptMtAfterScroll
    Left = 232
    Top = 632
  end
  object cdsReceiptDt: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'RCPTMT_ID;RCPTDT_ID'
    MasterFields = 'RCPTMT_ID'
    MasterSource = dtsReceiptMt
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'RCPTMT_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvReceiptDt'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsReceiptDtAfterScroll
    Left = 384
    Top = 632
  end
  object dtsReceiptDt: TDataSource
    DataSet = cdsReceiptDt
    Left = 448
    Top = 632
  end
  object cdsLineDetailsAux: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineDetailsAux'
    BeforePost = cdsLineMtBeforePost
    Left = 528
    Top = 632
  end
  object dtsLineDetailsAux: TDataSource
    DataSet = cdsLineDetailsAux
    Left = 592
    Top = 632
  end
  object cdsReceiptFields: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvReceiptFields'
    BeforePost = cdsLineMtBeforePost
    Left = 584
    Top = 560
  end
  object dtsReceiptFields: TDataSource
    DataSet = cdsReceiptFields
    Left = 648
    Top = 560
  end
  object dtsUseRestrictionGroups: TDataSource
    DataSet = cdsUseRestrictionGroups
    Left = 990
    Top = 408
  end
  object cdsUseRestrictionGroups: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvUseRestrictionGroups'
    BeforePost = cdsLineMtBeforePost
    AfterScroll = cdsLineMtAfterScroll
    Left = 952
    Top = 408
  end
  object cdsUseRestGroupsXPerUseTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    IndexFieldNames = 'URG_ID'
    MasterFields = 'URG_ID'
    MasterSource = dtsUseRestrictionGroups
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'URG_ID'
        ParamType = ptInput
      end>
    ProviderName = 'prvUseRestGroupsXPerUseTypes'
    BeforePost = cdsLineMtBeforePost
    OnPostError = cdsUseRestGroupsXPerUseTypesPostError
    Left = 944
    Top = 456
  end
  object dtsUseRestGroupsXPerUseTypes: TDataSource
    DataSet = cdsUseRestGroupsXPerUseTypes
    Left = 990
    Top = 456
  end
  object cdsLineIntegrationTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvLineIntegrationTypes'
    BeforePost = cdsLineMtBeforePost
    Left = 32
    Top = 688
  end
  object dtsLineIntegrationTypes: TDataSource
    DataSet = cdsLineIntegrationTypes
    Left = 80
    Top = 688
  end
  object cdsCardBUType: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvCardBUType'
    BeforePost = cdsLineMtBeforePost
    Left = 224
    Top = 696
  end
  object dtsCardBUType: TDataSource
    DataSet = cdsCardBUType
    Left = 272
    Top = 696
  end
  object cdsCardBUTypeXLineintegrationtypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <
      item
        DataType = ftInteger
        Name = 'P_CBUTID'
        ParamType = ptUnknown
      end>
    ProviderName = 'prvCardBUTypeXLineintegrationtypes'
    Left = 408
    Top = 696
  end
  object dtsCardBUTypeXLineintegrationtypes: TDataSource
    DataSet = cdsCardBUTypeXLineintegrationtypes
    Left = 456
    Top = 696
  end
  object cdsReloadTypesLKP: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvReloadTypesLKP'
    BeforePost = cdsLineMtBeforePost
    Left = 40
    Top = 744
  end
  object dstReloadTypesLKP: TDataSource
    DataSet = cdsReloadTypesLKP
    Left = 88
    Top = 744
  end
  object cdsPeriodUseTypes: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'dtsPeriodUseTypes1'
    BeforePost = cdsLineMtBeforePost
    Left = 224
    Top = 744
  end
  object dtsPeriodUseTypes: TDataSource
    DataSet = cdsPeriodUseTypes
    Left = 272
    Top = 744
  end
  object cdsPersonnelFunctionsGroup: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvPersonnelFunctionsGroup'
    BeforePost = cdsLineMtBeforePost
    Left = 400
    Top = 752
  end
  object dtsPersonnelFunctionsGroup: TDataSource
    DataSet = cdsPersonnelFunctionsGroup
    Left = 448
    Top = 752
  end
  object cdsGridPeriodo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 953
    Top = 528
    object cdsGridPeriodoURGPUT_ID: TIntegerField
      FieldName = 'URGPUT_ID'
    end
    object cdsGridPeriodoURG_ID: TIntegerField
      FieldName = 'URG_ID'
    end
    object cdsGridPeriodoPUT_ID: TIntegerField
      FieldName = 'PUT_ID'
    end
    object cdsGridPeriodoURGPUT_PERUSELIMIT: TIntegerField
      FieldName = 'URGPUT_PERUSELIMIT'
    end
    object cdsGridPeriodoURGPUT_STATUS: TStringField
      FieldName = 'URGPUT_STATUS'
      Size = 1
    end
    object cdsGridPeriodoURGPUT_REGUSER: TStringField
      FieldName = 'URGPUT_REGUSER'
    end
    object cdsGridPeriodoURGPUT_REGDATE: TDateTimeField
      FieldName = 'URGPUT_REGDATE'
    end
    object cdsGridPeriodoPUT_DESC: TStringField
      FieldName = 'PUT_DESC'
      Size = 50
    end
  end
  object dtsGridPeriodo: TDataSource
    DataSet = cdsGridPeriodo
    Left = 1022
    Top = 528
  end
  object dtsAux: TDataSource
    AutoEdit = False
    DataSet = cdsAux
    Left = 576
    Top = 8
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    Params = <>
    ProviderName = 'prvApplicationsLook'
    Left = 537
    Top = 8
  end
  object dsCodTrecho: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLineDetailsXZones'
    Left = 656
    Top = 8
  end
  object dtsCodTrech: TDataSource
    DataSet = dsCodTrecho
    Left = 728
    Top = 8
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    ConnectionBroker = ConnBrkMaster
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'LM_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvLineDetailsXZones'
    Left = 816
    Top = 8
  end
  object cdsBioFacial: TClientDataSet
    Aggregates = <>
    ConnectionBroker = ConnBrkMaster
    Params = <>
    ProviderName = 'prvBioFacial'
    BeforePost = cdsApplicationsBeforePost
    OnPostError = cdsProviderTypesPostError
    OnReconcileError = cdsProviderTypesReconcileError
    Left = 992
    Top = 248
  end
end
