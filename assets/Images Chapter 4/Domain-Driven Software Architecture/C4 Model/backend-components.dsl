commercialModule = component "Commercial Engagement" "Supporting module for plan information and commercial inquiries." "ASP.NET Core Module" {
    tags "Backend Context"
}
identityModule = component "Identity and Access Management" "Generic module for authentication, users, roles, permissions and profiles." "ASP.NET Core Module" {
    tags "Backend Context"
}
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
reportingModule = component "Reporting and Analytics" "Read-side module for summaries, reports and operational trends." "ASP.NET Core Module" {
    tags "Backend Context" "Read Side"
}
sharedKernel = component "Shared Kernel" "Contains Weight and MeasurementUnit, shared by Production Management and Quality and Yield Control." "C# Value Objects" {
    tags "Shared Kernel"
}

group "Commercial Engagement" {
    group "Interfaces" {
        planCatalogInterfaces = component "Plan Catalog REST Interface" "PlanController, plan resources and assemblers expose the available plan catalog and value proposition." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
        commercialInquiryInterfaces = component "Commercial Inquiry REST Interface" "CommercialInquiryController, request resources and assemblers receive visitor contact requests." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        commercialCommandServices = component "Commercial Command Services" "SubmitCommercialInquiryService validates and coordinates commercial inquiry submission." "C# Command Services" {
            tags "Backend Application Layer"
        }
        commercialQueryServices = component "Commercial Query Services" "GetPlanCatalogService and GetValuePropositionService answer public offer queries." "C# Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        commercialDomain = component "Commercial Model" "CommercialInquiry, Plan and ValueProposition: represent the public offer and the commercial contact workflow." "C# Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        commercialInfrastructure = component "commercial/infrastructure" "CommercialDbContext configuration, inquiry and plan repository adapters, relational mappings and domain-event publication." "Entity Framework Core" {
            tags "Backend Infrastructure"
        }
    }
}

group "Identity and Access Management" {
    group "Interfaces" {
        authenticationInterfaces = component "Authentication REST Interface" "AuthenticationController, credential resources and assemblers expose sign-in and account-registration operations." "ASP.NET Core Web API and Authentication" {
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
        identityCommandServices = component "Identity Command Services" "Coordinates account registration, authentication, role assignment and profile updates." "C# Command Services" {
            tags "Backend Application Layer"
        }
        identityQueryServices = component "Identity Query Services" "Answers user, role, permission and profile queries." "C# Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        identityDomain = component "Identity Model" "User, Profile, Role, Permission and AuthenticatedPrincipal: represent accounts, authorization and published identity." "C# Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        identityInfrastructure = component "iam/infrastructure" "IdentityDbContext configuration, repository adapters, password hashing, token issuing and notification-delivery adapters." "Entity Framework Core and ASP.NET Core Authentication" {
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
        productionCommandServices = component "Production Command Services" "Coordinates commands for raw material receptions, production batches and production records." "C# Command Services" {
            tags "Backend Application Layer"
        }
        productionQueryServices = component "Production Query Services" "Answers process, available reception, available batch and production-history queries." "C# Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        productionDomain = component "Production Model" "RawMaterialReception, ProductionBatch and ProductionRecord: model reception, batching and the production process." "C# Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        productionInfrastructure = component "production/infrastructure" "ProductionDbContext configuration, reception, batch and record repository adapters, relational mappings and domain-event publication." "Entity Framework Core" {
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
        qualityCommandServices = component "Quality Command Services" "Coordinates quality assessment, waste recording and deviation-identification commands." "C# Command Services" {
            tags "Backend Application Layer"
        }
        qualityQueryServices = component "Quality Query Services" "Answers quality-result, yield-indicator and comparison queries." "C# Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        qualityDomain = component "Quality Model" "QualityAssessment, WasteRecord, QualityDeviation, YieldIndicator and RiceComposition: model quality and yield results." "C# Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        qualityInfrastructure = component "quality/infrastructure" "QualityDbContext configuration, quality and waste repository adapters, relational mappings and domain-event publication." "Entity Framework Core" {
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
        maintenanceCommandServices = component "Maintenance Command Services" "Coordinates machine registration and preventive or corrective maintenance recording." "C# Command Services" {
            tags "Backend Application Layer"
        }
        maintenanceQueryServices = component "Maintenance Query Services" "Answers machine status, inventory and maintenance-history queries." "C# Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        maintenanceDomain = component "Maintenance Model" "Machine, MaintenanceRecord, TechnicianReference and AnomalyReference: model assets and maintenance work." "C# Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        maintenanceInfrastructure = component "maintenance/infrastructure" "MaintenanceDbContext configuration, machine and maintenance repository adapters, relational mappings and domain-event publication." "Entity Framework Core" {
            tags "Backend Infrastructure"
        }
    }
}

group "Operational Intelligence" {
    group "Interfaces" {
        telemetryIngestionInterfaces = component "Telemetry Ingestion Interface" "OperationalReadingsController and ingestion resources receive planned sensor measurements." "ASP.NET Core Integration Endpoint" {
            tags "Backend Interfaces"
        }
        monitoringInterfaces = component "Monitoring REST Interface" "AnomaliesController, AlertsController, resources and assemblers expose monitoring and alert-attention operations." "ASP.NET Core Web API" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        intelligenceCommandServices = component "Operational Intelligence Command Services" "Coordinates reading registration, anomaly detection, alert generation and alert-attention commands." "C# Command Services" {
            tags "Backend Application Layer"
        }
        intelligenceQueryServices = component "Operational Intelligence Query Services" "Answers reading-history, anomaly, alert and recommendation queries." "C# Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        intelligenceDomain = component "Operational Intelligence Model" "OperationalReading, OperationalAnomaly, Alert, DetectionCriterion and AnomalyDetectionService: model monitoring and alerting." "C# Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        intelligenceInfrastructure = component "intelligence/infrastructure" "IntelligenceDbContext configuration, telemetry, repository and notification adapters, relational mappings and event publication." "Entity Framework Core and Integration Adapters" {
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
        reportingQueryServices = component "Reporting Query Services" "Answers operational summary, production report, maintenance report and trend queries." "C# Query Services" {
            tags "Backend Application Layer" "Read Side"
        }
        reportingProjectionHandlers = component "Reporting Projection Handlers" "Consumes published operational events and updates reporting projections." "C# Event Handlers" {
            tags "Backend Application Layer" "Read Side"
        }
    }
    group "Domain" {
        reportingDomain = component "Reporting Model" "OperationalSummary, ReportRow, ReportDimension, MetricValue, DateRange and TrendPoint: define read-only projections." "C# Read Models" {
            tags "Backend Domain" "Read Side"
        }
    }
    group "Infrastructure" {
        reportingInfrastructure = component "reporting/infrastructure" "ReportingDbContext configuration, projection repository adapters and denormalized relational mappings." "Entity Framework Core" {
            tags "Backend Infrastructure" "Read Side"
        }
    }
}

group "Shared Kernel" {
    group "Domain" {
        sharedKernelDomain = component "Shared Kernel Model" "Weight and MeasurementUnit: value objects shared by Production Management and Quality and Yield Control." "C# Value Objects" {
            tags "Backend Domain" "Shared Kernel"
        }
    }
}
