# Diseño de Anti-Corruption Layers (ACL) del backend de Molinex

Este documento registra las decisiones y los contratos necesarios para implementar el patrón ACL de DDD en el backend. Describe **diseño**; la implementación se realiza en una tarea posterior.

## 1. Integraciones revisadas

| Consumidor | Proveedor | Necesidad | Decisión |
|---|---|---|---|
| Quality and Yield Control | Production Management | Verificar que el registro de producción existe antes de registrar calidad o merma; leer registros por lote y periodo para indicadores de rendimiento y composición. | **ACL (vigente, a implementar)** |
| Operational Intelligence | Asset and Maintenance Management | Verificar que la máquina de una lectura existe y está operativa antes de evaluar anomalías. | **ACL (planificada)** |
| Asset and Maintenance Management | Identity and Access Management | `TechnicianReference` guarda la identidad del técnico. | Sin ACL: la identidad llega en el principal autenticado; se conserva como referencia por identidad. |
| Asset and Maintenance Management | Operational Intelligence | `AnomalyReference` opcional en el mantenimiento. | Sin ACL: referencia por identidad opcional, sin consulta síncrona. Evita además una dependencia cíclica con la ACL planificada. |
| Reporting and Analytics | Contextos operativos | Proyecciones de lectura. | Sin ACL: consume eventos de dominio en `Reporting Projection Handlers`; sus read models ya aíslan el modelo. |
| Production / Quality | Shared Kernel | `Weight`, `MeasurementUnit`. | Sin ACL: Shared Kernel explícito. |
| Commercial Engagement, Identity and Access Management | — | No consumen otros contextos. | Sin ACL. |

## 2. Estado actual frente al diseño

En la referencia actual del backend (`molinex-web-backend-reference`):

- `QualityAssessmentCommandService` y `WasteRecordCommandService` consultan `db.Set<ProductionRecord>()` directamente: Quality depende del agregado y del `AppDbContext` de Production.
- `QualityIndicatorsQueryService` usa `ProductionManagement/Interfaces/Acl/IProductionQueries`, pero su implementación `ProductionQueries` vive en Infrastructure de Production y expone consultas sobre el `DbContext`; no hay adaptador ni traducción del lado consumidor.

El diseño sustituye ambos accesos por: servicio consumidor → `IExternalProductionService` (ACL) → `IProductionContextFacade` (facade publicado) → `IProductionQueryService` (interno del proveedor).

## 3. Ubicación según la referencia arquitectónica

Se sigue la convención de `learning-center-platform` (`Profiles` → `Publishing`):

| Rol | Ubicación | Referencia |
|---|---|---|
| Contrato del facade y contratos de lectura (proveedor) | `<Provider>/Interfaces/Acl` | `Profiles/Interfaces/Acl/IProfilesContextFacade` |
| Implementación del facade (proveedor) | `<Provider>/Application/Acl` | `Profiles/Application/Acl/ProfilesContextFacade` |
| Adaptador ACL (consumidor) | `<Consumer>/Application/Internal/OutboundServices/Acl` | `Publishing/Application/Internal/OutboundServices/Acl/ExternalProfileService` |
| Puerto saliente del adaptador (consumidor) | `<Consumer>/Application/OutboundServices/Acl` | Añadido en Molinex para que los servicios dependan de una interfaz, igual que con `IQualityCommandService`. |

Los diagramas usan el prefijo `Molinex.<Context>`; en el código corresponde a `Molinex.Platform.<Context>` (por ejemplo `Molinex.Platform.QualityAndYieldControl`).

## 4. Contratos

| Consumidor | Proveedor | ACL (consumidor) | Facade (proveedor) | Contratos | Datos intercambiados | Operaciones |
|---|---|---|---|---|---|---|
| Quality and Yield Control | Production Management | `IExternalProductionService` / `ExternalProductionService` | `IProductionContextFacade` / `ProductionContextFacade` | `ProductionRecordSummary` `<<Read Contract>>` (proveedor); `ProductionRecordReference` y `ProductionRecordId` (modelo del consumidor) | `ProductionRecordId : long`, `ProductionBatchId : long`, `ProcessedWeightValue : decimal`, `ProcessedWeightUnit : string`, `StartedAt : DateTimeOffset` | Facade: `ExistsProductionRecordById`, `ExistsProductionBatchById`, `FetchProductionRecordById`, `FetchProductionRecords`. ACL: `ExistsProductionRecord`, `ExistsProductionBatch`, `FetchProductionRecord`, `FetchProductionRecords` |
| Operational Intelligence *(planificada)* | Asset and Maintenance Management | `IExternalMachineService` / `ExternalMachineService` | `IAssetMaintenanceContextFacade` / `AssetMaintenanceContextFacade` | Solo primitivos; sin contrato de lectura | `machineId : long`, estado de máquina como `string` | Facade: `ExistsMachineById`, `FetchMachineStatusById`. ACL: `ExistsMachine`, `IsMachineOperational` |

### 4.1 Quality and Yield Control → Production Management

Proveedor, `ProductionManagement/Interfaces/Acl`:

```csharp
public interface IProductionContextFacade
{
    Task<bool> ExistsProductionRecordById(long productionRecordId, CancellationToken cancellationToken);
    Task<bool> ExistsProductionBatchById(long productionBatchId, CancellationToken cancellationToken);
    Task<ProductionRecordSummary?> FetchProductionRecordById(long productionRecordId, CancellationToken cancellationToken);
    Task<IReadOnlyList<ProductionRecordSummary>> FetchProductionRecords(
        long? productionBatchId, DateTimeOffset? from, DateTimeOffset? to, CancellationToken cancellationToken);
}

public sealed record ProductionRecordSummary(
    long ProductionRecordId, long ProductionBatchId,
    decimal ProcessedWeightValue, string ProcessedWeightUnit, DateTimeOffset StartedAt);
```

Proveedor, `ProductionManagement/Application/Acl/ProductionContextFacade`: depende solo de `IProductionQueryService`; crea `GetProductionRecordByIdQuery`, `GetProductionBatchByIdQuery` y `GetProductionRecordsQuery`, y traduce `ProductionRecord` a `ProductionRecordSummary` (`ToSummary`). No devuelve agregados ni expone repositorios.

Consumidor, `QualityAndYieldControl/Application/OutboundServices/Acl`:

```csharp
public interface IExternalProductionService
{
    Task<bool> ExistsProductionRecord(ProductionRecordId productionRecordId, CancellationToken cancellationToken);
    Task<bool> ExistsProductionBatch(long productionBatchId, CancellationToken cancellationToken);
    Task<ProductionRecordReference?> FetchProductionRecord(ProductionRecordId productionRecordId, CancellationToken cancellationToken);
    Task<IReadOnlyList<ProductionRecordReference>> FetchProductionRecords(
        long? productionBatchId, DateTimeOffset? from, DateTimeOffset? to, CancellationToken cancellationToken);
}
```

Consumidor, `QualityAndYieldControl/Application/Internal/OutboundServices/Acl/ExternalProductionService`: depende solo de `IProductionContextFacade`.

Traducción realizada por la ACL:

| Contrato del proveedor | Modelo de Quality |
|---|---|
| `ProductionRecordSummary.ProductionRecordId : long` | `ProductionRecordReference.Id : ProductionRecordId` |
| `ProductionRecordSummary.ProductionBatchId : long` | `ProductionRecordReference.ProductionBatchId : long` |
| `ProcessedWeightValue` + `ProcessedWeightUnit` | `ProductionRecordReference.ProcessedWeight : Weight` (Shared Kernel) |
| `StartedAt` | `ProductionRecordReference.StartedAt` |
| `null` / lista vacía | `null` / lista vacía; el servicio de aplicación decide el error `NotFound` |

Uso: `QualityCommandService` llama `ExistsProductionRecord` antes de registrar evaluaciones y mermas; `QualityQueryService` llama `ExistsProductionBatch` y `FetchProductionRecords` para rendimiento y composición.

### 4.2 Operational Intelligence → Asset and Maintenance Management (planificada)

- `AssetAndMaintenanceManagement/Interfaces/Acl/IAssetMaintenanceContextFacade`: `ExistsMachineById(long)`, `FetchMachineStatusById(long) : string` (cadena vacía si no existe).
- `AssetAndMaintenanceManagement/Application/Acl/AssetMaintenanceContextFacade`: delega en `IMaintenanceQueryService` (`GetMachineByIdQuery`) y traduce `MachineStatus` a `string`.
- `OperationalIntelligence/Application/OutboundServices/Acl/IExternalMachineService`: `ExistsMachine(MachineId)`, `IsMachineOperational(MachineId)`.
- `OperationalIntelligence/Application/Internal/OutboundServices/Acl/ExternalMachineService`: desempaqueta su propio `MachineId` y convierte el estado recibido en una decisión booleana; Operational Intelligence no conoce `MachineStatus`.

## 5. Reglas de dependencia

1. Un contexto consumidor solo puede referenciar `<Provider>.Interfaces.Acl`.
2. Los servicios de aplicación del consumidor dependen del puerto `IExternal…Service`, nunca del facade.
3. El facade depende de los servicios de consulta/comando de su propio contexto, no de repositorios ni de `AppDbContext`.
4. Los contratos publicados usan primitivos o records planos; nunca agregados, entidades ni value objects del proveedor.
5. Registro en DI previsto: `IProductionContextFacade → ProductionContextFacade` e `IExternalProductionService → ExternalProductionService`, ambos `Scoped`.

## 6. Representación en los diagramas

- **C4 nivel 3**: componentes con tag `ACL` (color propio) en Production (`Production Context Facade Contract`, `Production Context Facade`) y Quality (`External Production Service`); los equivalentes planificados en Asset and Maintenance y Operational Intelligence llevan además el tag `Planned` (borde discontinuo). Cada vista incluye el componente del otro contexto para mostrar consumidor, proveedor y dirección.
- **Vista general del backend**: relaciones `Quality and Yield Control → Production Management` y `Operational Intelligence → Asset and Maintenance Management` (esta última rotulada *Planned*). No se crean contenedores ni sistemas nuevos.
- **Diagramas de clases**: paquetes `Interfaces.Acl`, `Application.Acl`, `Application.OutboundServices.Acl` y `Application.Internal.OutboundServices.Acl` con estereotipos `<<Facade>>`, `<<Read Contract>>` y `<<ACL>>`; el contexto externo aparece solo como paquete *reference* con su contrato publicado.

## 7. Progreso

- **Decisiones**: dos ACL (una vigente, una planificada); el resto de integraciones se mantiene sin ACL con su justificación (sección 1).
- **Archivos**: `backend-components.dsl`, `relationships.dsl`, `views.dsl`, `workspace.dsl`; SVG C4 de overview, production, quality, asset-maintenance y operational-intelligence; `.puml` y `.svg` de clases de esos cuatro contextos; párrafos afectados del `README.md`; este documento.
- **Verificaciones**: `structurizr-cli` 2025.11.09 exportó el workspace sin errores (`plantuml/structurizr`); PlantUML 1.2026.2 `-checkonly` sin errores en los cuatro `.puml`; SVG regenerados e inspeccionados visualmente.
- **Bloqueos**: ninguno. Nota: los SVG C4 regenerados muestran la descripción de la vista bajo el título porque esta versión del exportador la incluye.
- **Siguiente paso**: implementar la sección 4.1 en el backend (facade, contrato de lectura, ACL y registro en DI) y eliminar el acceso de Quality a `ProductionRecord` y `IProductionQueries`.
