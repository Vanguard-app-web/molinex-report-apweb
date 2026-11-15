group "Core Bounded Contexts" {
    productionModule = component "Production Management" "Core module for raw material receptions, production batches and production records." "ASP.NET Core Module" {
        tags "Backend Context"
    }
    qualityModule = component "Quality and Yield Control" "Core module for quality assessments, waste, indicators and deviations." "ASP.NET Core Module" {
        tags "Backend Context"
    }
    maintenanceModule = component "Asset and Maintenance Management" "Core module for machines and preventive and corrective maintenance." "ASP.NET Core Module" {
        tags "Backend Context"
    }
    intelligenceModule = component "Operational Intelligence" "Core module for readings, anomaly detection and operational alerts." "ASP.NET Core Module" {
        tags "Backend Context"
    }
}
group "Supporting Bounded Contexts" {
    commercialModule = component "Commercial Engagement" "Supporting module for plan information and commercial inquiries." "ASP.NET Core Module" {
        tags "Backend Context"
    }
    reportingModule = component "Reporting and Analytics" "Supporting read-side module for summaries, reports and operational trends." "ASP.NET Core Module" {
        tags "Backend Context" "Read Side"
    }
}
group "Generic Bounded Contexts" {
    identityModule = component "Identity and Access Management" "Generic module for authentication, users, roles, permissions and profiles." "ASP.NET Core Module" {
        tags "Backend Context"
    }
}
sharedKernel = component "Shared Kernel" "Provides AggregateRoot, Result, Error, IBaseRepository, IUnitOfWork, Weight and MeasurementUnit to the backend modules." "C# Domain Building Blocks and Value Objects" {
    tags "Shared Kernel"
}

group "Commercial Engagement" {
    group "Interfaces" {
        planCatalogInterfaces = component "Plan Catalog REST Interface" "CommercialContentController, plan and value proposition resources and assemblers expose the available plan catalog and value proposition." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
        commercialInquiryInterfaces = component "Commercial Inquiry REST Interface" "CommercialInquiriesController, inquiry resources and assemblers receive and expose visitor contact requests." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        commercialCommandServices = component "Commercial Command Services" "ICommercialCommandService defines the application contract; CommercialCommandService validates and coordinates inquiry submission and status changes." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
        commercialQueryServices = component "Commercial Query Services" "ICommercialQueryService defines the query contract; CommercialQueryService answers inquiry, plan catalog and value proposition queries." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        commercialDomain = component "Commercial Model and Ports" "CommercialInquiry, PlanSummary and ValueProposition model the commercial workflow; ICommercialInquiryRepository defines its persistence port." "C# Domain Model and Repository Interfaces" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        commercialInfrastructure = component "CommercialEngagement/Infrastructure" "CommercialInquiryRepository implements ICommercialInquiryRepository with EF Core, relational mappings and domain-event dispatch on save." "Entity Framework Core Repository Implementations" {
            tags "Backend Infrastructure"
        }
    }
}

group "Identity and Access Management" {
    group "Interfaces" {
        authenticationInterfaces = component "Authentication REST Interface" "AuthenticationController, credential resources and assemblers expose sign-in and account-registration operations." "ASP.NET Core Web API and JSON Web Tokens" {
            tags "Backend Interfaces"
        }
        userAdministrationInterfaces = component "User Administration REST Interface" "UsersController, role and permission resources and assemblers expose administrative operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
        profileInterfaces = component "Profile REST Interface" "ProfileController, profile resources and assemblers expose the current user's profile operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        identityCommandServices = component "Identity Command Services" "IUserCommandService defines the application contract; UserCommandService coordinates registration, authentication, role assignment and profile updates." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
        identityQueryServices = component "Identity Query Services" "IUserQueryService defines the query contract; UserQueryService answers user, role, permission and profile queries." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        identityDomain = component "Identity Model and Ports" "User, Profile, Role, Permission and AuthenticatedPrincipal model identity; IUserRepository defines the persistence port." "C# Domain Model and Repository Interfaces" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        identityInfrastructure = component "IdentityAccessManagement/Infrastructure" "UserRepository implements IUserRepository; HashingService, TokenService, authorization middleware and notification integration implement outbound concerns." "Entity Framework Core, BCrypt and JSON Web Tokens" {
            tags "Backend Infrastructure"
        }
    }
}

group "Production Management" {
    group "Interfaces" {
        rawMaterialReceptionInterfaces = component "Raw Material Reception REST Interface" "RawMaterialReceptionsController, resources and assemblers expose reception operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
        productionBatchInterfaces = component "Production Batch REST Interface" "ProductionBatchesController, resources and assemblers expose batch operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
        productionRecordInterfaces = component "Production Record REST Interface" "ProductionRecordsController, resources and assemblers expose production-record operations and history." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        productionCommandServices = component "Production Command Services" "IProductionCommandService defines the application contract; ProductionCommandService coordinates reception, batch and production-record commands." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
        productionQueryServices = component "Production Query Services" "IProductionQueryService defines the query contract; ProductionQueryService answers process, availability and production-history queries." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        productionDomain = component "Production Model and Ports" "RawMaterialReception, ProductionBatch and ProductionRecord model the process; IRawMaterialReceptionRepository, IProductionBatchRepository and IProductionRecordRepository define persistence ports." "C# Domain Model and Repository Interfaces" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        productionInfrastructure = component "ProductionManagement/Infrastructure" "RawMaterialReceptionRepository, ProductionBatchRepository and ProductionRecordRepository implement domain ports with EF Core and relational mappings." "Entity Framework Core Repository Implementations" {
            tags "Backend Infrastructure"
        }
    }
}

group "Quality and Yield Control" {
    group "Interfaces" {
        qualityAssessmentInterfaces = component "Quality Assessment REST Interface" "QualityAssessmentsController, resources and assemblers expose quality-result operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
        wasteRecordInterfaces = component "Waste Record REST Interface" "WasteRecordsController, resources and assemblers expose waste-recording operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
        yieldAnalysisInterfaces = component "Yield Analysis REST Interface" "YieldIndicatorsController and comparison resources expose indicators, comparisons and deviations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        qualityCommandServices = component "Quality Command Services" "IQualityCommandService defines the application contract; QualityCommandService coordinates assessment, waste and deviation-identification commands." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
        qualityQueryServices = component "Quality Query Services" "IQualityQueryService defines the query contract; QualityQueryService answers quality-result, yield-indicator and comparison queries." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        qualityDomain = component "Quality Model and Ports" "QualityAssessment, WasteRecord, QualityDeviation, YieldIndicator and RiceComposition model quality; IQualityAssessmentRepository, IWasteRecordRepository and IQualityDeviationRepository define persistence ports." "C# Domain Model and Repository Interfaces" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        qualityInfrastructure = component "QualityYieldControl/Infrastructure" "QualityAssessmentRepository, WasteRecordRepository and QualityDeviationRepository implement domain ports with EF Core and relational mappings." "Entity Framework Core Repository Implementations" {
            tags "Backend Infrastructure"
        }
    }
}

group "Asset and Maintenance Management" {
    group "Interfaces" {
        machineInterfaces = component "Machine REST Interface" "MachinesController, machine resources and assemblers expose inventory and status operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
        maintenanceRecordInterfaces = component "Maintenance Record REST Interface" "MaintenanceRecordsController, resources and assemblers expose preventive, corrective and history operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        maintenanceCommandServices = component "Maintenance Command Services" "IMaintenanceCommandService defines the application contract; MaintenanceCommandService coordinates machine registration and maintenance recording." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
        maintenanceQueryServices = component "Maintenance Query Services" "IMaintenanceQueryService defines the query contract; MaintenanceQueryService answers machine status, inventory and maintenance-history queries." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        maintenanceDomain = component "Maintenance Model and Ports" "Machine, MaintenanceRecord, TechnicianReference and AnomalyReference model maintenance; IMachineRepository and IMaintenanceRecordRepository define persistence ports." "C# Domain Model and Repository Interfaces" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        maintenanceInfrastructure = component "AssetMaintenanceManagement/Infrastructure" "MachineRepository and MaintenanceRecordRepository implement domain ports with EF Core, relational mappings and domain-event dispatch." "Entity Framework Core Repository Implementations" {
            tags "Backend Infrastructure"
        }
    }
}

group "Operational Intelligence" {
    group "Interfaces" {
        telemetryIngestionInterfaces = component "Telemetry Ingestion Interface" "OperationalReadingsController and ingestion resources receive sensor measurements." "ASP.NET Core Integration Endpoint" {
            tags "Backend Interfaces"
        }
        monitoringInterfaces = component "Monitoring REST Interface" "AnomaliesController, AlertsController, resources and assemblers expose monitoring and alert-attention operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        intelligenceCommandServices = component "Operational Intelligence Command Services" "IIntelligenceCommandService defines the application contract; IntelligenceCommandService coordinates readings, anomaly detection and alerts." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
        intelligenceQueryServices = component "Operational Intelligence Query Services" "IIntelligenceQueryService defines the query contract; IntelligenceQueryService answers history, anomaly, alert and recommendation queries." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        intelligenceDomain = component "Operational Intelligence Model and Ports" "OperationalReading, OperationalAnomaly, Alert and DetectionCriterion model monitoring; IOperationalReadingRepository, IOperationalAnomalyRepository and IAlertRepository define persistence ports." "C# Domain Model and Repository Interfaces" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        intelligenceInfrastructure = component "OperationalIntelligence/Infrastructure" "OperationalReadingRepository, OperationalAnomalyRepository and AlertRepository implement domain ports; telemetry and notification adapters implement external integrations." "Entity Framework Core Repository Implementations and External Adapters" {
            tags "Backend Infrastructure"
        }
    }
}

group "Reporting and Analytics" {
    group "Interfaces" {
        reportingInterfaces = component "Reporting REST Interface" "ReportsController, summary, report and trend resources and assemblers expose read-only queries." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        reportingQueryServices = component "Reporting Query Services" "IReportingQueryService defines the query contract; ReportingQueryService answers operational summary, production, maintenance and trend queries." "C# Service Interface and Internal Implementation" {
            tags "Backend Application Layer" "Read Side"
        }
        reportingProjectionHandlers = component "Reporting Projection Handlers" "Consumes published operational events and updates reporting projections." "C# Event Handlers" {
            tags "Backend Application Layer" "Read Side"
        }
    }
    group "Domain" {
        reportingDomain = component "Reporting Model and Ports" "OperationalSummary, ReportRow, ReportDimension, MetricValue, DateRange and TrendPoint define read models; IReportingProjectionRepository defines the projection port." "C# Read Models and Repository Interfaces" {
            tags "Backend Domain" "Read Side"
        }
    }
    group "Infrastructure" {
        reportingInfrastructure = component "ReportingAnalytics/Infrastructure" "ReportingProjectionRepository implements IReportingProjectionRepository with EF Core and denormalized relational mappings." "Entity Framework Core Repository Implementations" {
            tags "Backend Infrastructure" "Read Side"
        }
    }
}

group "Shared Kernel" {
    group "Domain" {
        sharedKernelDomain = component "Shared Domain Building Blocks" "AggregateRoot, Result, Error, IBaseRepository and IUnitOfWork provide common domain abstractions; Weight and MeasurementUnit are shared value objects." "C# Domain Abstractions and Value Objects" {
            tags "Backend Domain" "Shared Kernel"
        }
    }
}
