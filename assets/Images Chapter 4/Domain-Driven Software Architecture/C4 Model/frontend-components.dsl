group "Core Bounded Contexts" {
    productionFeature = component "Production Management" "Core frontend module for raw material receptions, batches and production records." "Vue Feature Area" {
        tags "Frontend Context"
    }
    qualityFeature = component "Quality and Yield Control" "Core frontend module for quality results, yield indicators, rice composition and waste." "Vue Feature Area" {
        tags "Frontend Context"
    }
    maintenanceFeature = component "Asset and Maintenance Management" "Core frontend module for machine inventory and preventive and corrective maintenance." "Vue Feature Area" {
        tags "Frontend Context"
    }
    intelligenceFeature = component "Operational Intelligence" "Core frontend module for operational variables, anomalies, alerts and recommendations." "Vue Feature Area" {
        tags "Frontend Context"
    }
}
group "Supporting Bounded Contexts" {
    commercialFeature = component "Commercial Engagement" "Supporting frontend module for plan discovery, the value proposition and commercial inquiries." "Vue Feature Area" {
        tags "Frontend Context"
    }
    reportingFeature = component "Reporting and Analytics" "Supporting read-side frontend module for summaries, reports and operational trends." "Vue Feature Area" {
        tags "Frontend Context" "Read Side"
    }
}
group "Generic Bounded Contexts" {
    identityFeature = component "Identity and Access Management" "Generic frontend module for sign-in, user administration, roles, permissions and profiles." "Vue Feature Area" {
        tags "Frontend Context"
    }
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
        productionOverview = component "production-overview" "production-overview.vue: summarizes production activity, status and traceability." "Vue View and PrimeVue" {
            tags "Frontend Presentation"
        }
        rawMaterialReceptionViews = component "Raw Material Reception Views" "raw-material-reception-list.vue and raw-material-reception-form.vue list, register and validate raw material receptions." "Vue Views and PrimeVue" {
            tags "Frontend Presentation"
        }
        productionBatchViews = component "Production Batch Views" "production-batch-list.vue and production-batch-form.vue list batches and register a batch for an available reception." "Vue Views and PrimeVue" {
            tags "Frontend Presentation"
        }
        productionRecordViews = component "Production Record Views" "production-record-list.vue, production-record-form.vue and production-history.vue manage production records and history; production-traceability.vue, production-status-tag.vue and production-process-flow.vue provide reusable visualizations." "Vue Views, Components and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        productionApplication = component "production.store.js" "useProductionStore holds receptions, batches, production records, loaded flags and errors, and coordinates production operations." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        productionDomain = component "production-management/domain/model" "RawMaterialReception, ProductionBatch and ProductionRecord: represent reception, batching and the production process." "Entities and Value Objects" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        productionInfrastructure = component "production-management/infrastructure" "ProductionApi, RawMaterialReceptionAssembler, ProductionBatchAssembler and ProductionRecordAssembler communicate with the API and map resources to and from entities." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Quality and Yield Control" {
    group "Presentation" {
        qualityAssessmentViews = component "Quality Assessment Views" "quality-assessment-list.vue and quality-assessment-form.vue list assessments and record quality measurements for production." "Vue Views and PrimeVue" {
            tags "Frontend Presentation"
        }
        wasteRecordViews = component "Waste Record Views" "waste-record-list.vue and waste-record-form.vue list waste records and register measured waste for a production record." "Vue Views and PrimeVue" {
            tags "Frontend Presentation"
        }
        yieldAnalysisViews = component "Yield Analysis Views" "yield-indicator-dashboard.vue, quality-comparison.vue and quality-deviation-list.vue present indicators, comparisons and deviations." "Vue Views and PrimeVue" {
            tags "Frontend Presentation"
        }
        productionProcessSelect = component "production-process-select" "production-process-select.vue: selects the production record associated with a quality assessment or waste record." "Vue Component and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        qualityApplication = component "quality.store.js" "useQualityStore holds assessments, waste records, indicators, comparisons, deviations, loaded flags and errors." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        qualityDomain = component "quality-yield-control/domain/model" "QualityAssessment, WasteRecord, QualityDeviation, YieldIndicator and RiceComposition: represent quality and yield results." "Entities, Value Objects and Read Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        qualityInfrastructure = component "quality-yield-control/infrastructure" "QualityApi and the assessment, waste, production-reference, indicator, comparison and deviation assemblers communicate with the API and map resources to and from models." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Asset and Maintenance Management" {
    group "Presentation" {
        machineManagementViews = component "Machine Management Views" "machine-list.vue and machine-form.vue list, register and update machines; machine-status-tag.vue presents their current status." "Vue Views, Components and PrimeVue" {
            tags "Frontend Presentation"
        }
        maintenanceManagementViews = component "Maintenance Management Views" "maintenance-record-form.vue and maintenance-history.vue register and list maintenance work; maintenance-type-tag.vue identifies preventive and corrective records." "Vue Views, Components and PrimeVue" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        maintenanceApplication = component "maintenance.store.js" "useMaintenanceStore holds machines, maintenance records, status, history, loaded flags and errors." "Pinia Setup Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        maintenanceDomain = component "asset-maintenance-management/domain/model" "Machine, MaintenanceRecord, TechnicianReference and AnomalyReference: represent assets and maintenance work." "Entities and Value Objects" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        maintenanceInfrastructure = component "asset-maintenance-management/infrastructure" "MaintenanceApi, MachineAssembler and MaintenanceRecordAssembler communicate with the API and map resources to and from entities." "HTTP and Assemblers" {
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
        applicationShell = component "Application Shell" "layout.vue hosts routed content; side-navigation.vue and top-bar.vue provide responsive navigation, the application header and language selection." "Vue Components and PrimeVue" {
            tags "Frontend Presentation" "Shared Kernel"
        }
        sharedPresentation = component "Shared Presentation Components" "page-not-found.vue handles unknown routes; feedback-message.vue, form-field.vue, empty-state.vue, link-button.vue, metric-card.vue and page-header.vue provide reusable UI elements." "Vue Views, Components and PrimeVue" {
            tags "Frontend Presentation" "Shared Kernel"
        }
    }
    group "Domain" {
        sharedKernelDomain = component "shared/domain/model" "Weight and MeasurementUnit: shared value objects used by Production Management and Quality and Yield Control." "Value Objects" {
            tags "Frontend Domain" "Shared Kernel"
        }
    }
    group "Infrastructure" {
        sharedInfrastructure = component "shared/infrastructure" "BaseApi, BaseEndpoint and ApiErrorHandler provide reusable HTTP communication, endpoint construction and error mapping." "HTTP Base Classes and Error Mapping" {
            tags "Frontend Infrastructure" "Shared Kernel"
        }
    }
}
