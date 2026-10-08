commercialFeature = component "Commercial Engagement" "Frontend module for plan discovery, the value proposition and commercial inquiries." "Vue Feature Area" {
    tags "Frontend Context"
}
identityFeature = component "Identity and Access Management" "Frontend module for sign-in, user administration, roles, permissions and profiles." "Vue Feature Area" {
    tags "Frontend Context"
}
productionFeature = component "Production Management" "Frontend module for raw material receptions, batches and production records." "Vue Feature Area" {
    tags "Frontend Context"
}
qualityFeature = component "Quality and Yield Control" "Frontend module for quality results, yield indicators, rice composition and waste." "Vue Feature Area" {
    tags "Frontend Context"
}
maintenanceFeature = component "Asset and Maintenance Management" "Frontend module for machine inventory and preventive and corrective maintenance." "Vue Feature Area" {
    tags "Frontend Context"
}
intelligenceFeature = component "Operational Intelligence" "Frontend module for operational variables, anomalies, alerts and recommendations." "Vue Feature Area" {
    tags "Frontend Context"
}
reportingFeature = component "Reporting and Analytics" "Frontend module for summaries, reports and operational trends." "Vue Feature Area" {
    tags "Frontend Context" "Read Side"
}
frontendSharedKernel = component "Shared Kernel" "Shared presentation, domain values and infrastructure reused across the frontend." "Vue and JavaScript Shared Area" {
    tags "Shared Kernel"
}

group "Commercial Engagement" {
    group "Presentation" {
        planCatalog = component "plan-catalog" "plan-catalog.vue: presents the available plans and their features." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        valuePropositionView = component "value-proposition" "value-proposition.vue: presents the benefits and capabilities offered by Molinex." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        commercialInquiryForm = component "commercial-inquiry-form" "commercial-inquiry-form.vue: collects and validates a visitor's contact request." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        commercialApplication = component "commercial.store.js" "useCommercialStore holds plans, the value proposition, inquiry state, loaded flags and errors." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        commercialDomain = component "commercial/domain/model" "Plan, ValueProposition and CommercialInquiry: represent the public offer and a visitor's commercial request." "Entities and Read Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        commercialInfrastructure = component "commercial/infrastructure" "CommercialApi, PlanAssembler, ValuePropositionAssembler and CommercialInquiryAssembler communicate with the API and map resources to and from models." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Identity and Access Management" {
    group "Presentation" {
        authenticationSection = component "authentication-section" "authentication-section.vue: presents the active user and authentication actions." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        signInForm = component "sign-in-form" "sign-in-form.vue: collects and validates registered-user credentials." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        userList = component "user-list" "user-list.vue: lists users and exposes administration actions." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        userForm = component "user-form" "user-form.vue: registers or updates a user and profile information." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        roleAssignmentForm = component "role-assignment-form" "role-assignment-form.vue: assigns roles and permissions to a user." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        profileView = component "profile-view" "profile-view.vue: presents and updates the current user's profile." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        identityApplication = component "iam.store.js" "useIamStore holds the authenticated user, token, users, roles, permissions, loaded flags and errors." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        identityDomain = component "iam/domain/model" "User, Profile, Role, Permission and AuthenticatedSession: represent identity, authorization and the active session." "Entities and Value Objects" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        identityInfrastructure = component "iam/infrastructure" "IamApi, authentication assemblers, TokenStorage, authenticationGuard and iamInterceptor communicate with the API and protect authenticated navigation." "HTTP, Assemblers, Storage, Guard and Interceptor" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Production Management" {
    group "Presentation" {
        rawMaterialReceptionList = component "raw-material-reception-list" "raw-material-reception-list.vue: lists registered raw material receptions and their available actions." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        rawMaterialReceptionForm = component "raw-material-reception-form" "raw-material-reception-form.vue: registers a raw material reception and validates its required information." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        productionBatchList = component "production-batch-list" "production-batch-list.vue: lists production batches and their associated receptions." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        productionBatchForm = component "production-batch-form" "production-batch-form.vue: registers a production batch for an available reception." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        productionRecordList = component "production-record-list" "production-record-list.vue: lists production records and their available update actions." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        productionRecordForm = component "production-record-form" "production-record-form.vue: registers or updates production information for a selected batch." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        productionHistoryView = component "production-history" "production-history.vue: presents production history and its available filters." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        productionApplication = component "production.store.js" "useProductionStore holds receptions, batches, production records, loaded flags and errors, and coordinates production operations." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        productionDomain = component "production/domain/model" "RawMaterialReception, ProductionBatch and ProductionRecord: represent reception, batching and the production process." "Entities" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        productionInfrastructure = component "production/infrastructure" "ProductionApi, RawMaterialReceptionAssembler, ProductionBatchAssembler and ProductionRecordAssembler communicate with the API and map resources to and from entities." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Quality and Yield Control" {
    group "Presentation" {
        qualityAssessmentList = component "quality-assessment-list" "quality-assessment-list.vue: lists quality assessments and their results." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        qualityAssessmentForm = component "quality-assessment-form" "quality-assessment-form.vue: records measurements and quality results for production." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        wasteRecordList = component "waste-record-list" "waste-record-list.vue: lists registered waste and its production references." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        wasteRecordForm = component "waste-record-form" "waste-record-form.vue: records waste and validates its measured quantity." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        yieldIndicatorDashboard = component "yield-indicator-dashboard" "yield-indicator-dashboard.vue: presents yield, composition and quality indicators." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        qualityComparisonView = component "quality-comparison" "quality-comparison.vue: compares quality results across periods or production records." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        qualityDeviationList = component "quality-deviation-list" "quality-deviation-list.vue: presents identified quality deviations." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        qualityApplication = component "quality.store.js" "useQualityStore holds assessments, waste records, indicators, comparisons, deviations, loaded flags and errors." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        qualityDomain = component "quality/domain/model" "QualityAssessment, WasteRecord, QualityDeviation, YieldIndicator and RiceComposition: represent quality and yield results." "Entities and Read Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        qualityInfrastructure = component "quality/infrastructure" "QualityApi and the assessment, waste, indicator, comparison and deviation assemblers communicate with the API and map resources to and from models." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Asset and Maintenance Management" {
    group "Presentation" {
        machineList = component "machine-list" "machine-list.vue: lists machines, their status and available actions." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        machineForm = component "machine-form" "machine-form.vue: registers or updates a machine." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        machineStatusView = component "machine-status" "machine-status.vue: presents a machine's current operational and maintenance status." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        maintenanceRecordForm = component "maintenance-record-form" "maintenance-record-form.vue: records preventive or corrective maintenance." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        maintenanceHistoryView = component "maintenance-history" "maintenance-history.vue: lists maintenance history with machine and date filters." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        maintenanceApplication = component "maintenance.store.js" "useMaintenanceStore holds machines, maintenance records, status, history, loaded flags and errors." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        maintenanceDomain = component "maintenance/domain/model" "Machine, MaintenanceRecord, TechnicianReference and AnomalyReference: represent assets and maintenance work." "Entities and Value Objects" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        maintenanceInfrastructure = component "maintenance/infrastructure" "MaintenanceApi, MachineAssembler and MaintenanceRecordAssembler communicate with the API and map resources to and from entities." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Operational Intelligence" {
    group "Presentation" {
        operationalVariableDashboard = component "operational-variable-dashboard" "operational-variable-dashboard.vue: presents current and historical operational readings." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        anomalyList = component "anomaly-list" "anomaly-list.vue: lists detected operational anomalies and their details." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        alertList = component "alert-list" "alert-list.vue: lists operational alerts and exposes attention actions." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        maintenanceRecommendationList = component "maintenance-recommendation-list" "maintenance-recommendation-list.vue: presents recommendations derived from anomalies and alerts." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        intelligenceApplication = component "intelligence.store.js" "useIntelligenceStore holds readings, anomalies, alerts, recommendations, loaded flags and errors." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        intelligenceDomain = component "intelligence/domain/model" "OperationalReading, OperationalAnomaly, Alert and MaintenanceRecommendation: represent monitoring results and required attention." "Entities and Read Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        intelligenceInfrastructure = component "intelligence/infrastructure" "IntelligenceApi and the reading, anomaly, alert and recommendation assemblers communicate with the API and map resources to and from models." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Reporting and Analytics" {
    group "Presentation" {
        operationalSummaryView = component "operational-summary" "operational-summary.vue: presents consolidated production, quality and maintenance indicators." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        productionReportView = component "production-report" "production-report.vue: presents filterable production report rows." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        maintenanceReportView = component "maintenance-report" "maintenance-report.vue: presents filterable maintenance report rows." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
        trendDashboard = component "trend-dashboard" "trend-dashboard.vue: visualizes operational metrics and trends over time." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        reportingApplication = component "reporting.store.js" "useReportingStore holds summaries, report rows, filters, trends, loaded flags and errors." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        reportingDomain = component "reporting/domain/model" "OperationalSummary, ReportRow, MetricValue, DateRange and TrendPoint: represent read-only reporting projections." "Read Models" {
            tags "Frontend Domain" "Read Side"
        }
    }
    group "Infrastructure" {
        reportingInfrastructure = component "reporting/infrastructure" "ReportingApi and the summary, report and trend assemblers query the API and map resources to read models." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Shared Kernel" {
    group "Presentation" {
        appLayout = component "app-layout" "app-layout.vue: hosts the application shell, toolbar, navigation and routed content." "Vue Component and PrimeVue" {
            tags "Frontend Presentation" "Shared Kernel"
        }
        navigationMenu = component "navigation-menu" "navigation-menu.vue: presents role-aware access to the application's feature areas." "Vue Component and PrimeVue" {
            tags "Frontend Presentation" "Shared Kernel"
        }
        sharedViews = component "shared/presentation/views" "Home, access-denied and page-not-found views that do not belong to a business bounded context." "Vue Views" {
            tags "Frontend Presentation" "Shared Kernel"
        }
        feedbackMessage = component "feedback-message" "feedback-message.vue: presents reusable success, warning and error feedback." "Vue Component and PrimeVue" {
            tags "Frontend Presentation" "Shared Kernel"
        }
    }
    group "Domain" {
        sharedKernelDomain = component "shared/domain/model" "Weight and MeasurementUnit: shared value objects used by Production Management and Quality and Yield Control." "Value Objects" {
            tags "Frontend Domain" "Shared Kernel"
        }
    }
    group "Infrastructure" {
        sharedInfrastructure = component "shared/infrastructure" "BaseApi, authenticated HTTP configuration, request interceptors and ApiErrorHandler provide common API communication and error handling." "HTTP, Base Classes and Interceptors" {
            tags "Frontend Infrastructure" "Shared Kernel"
        }
    }
}
