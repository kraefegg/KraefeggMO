# Diagrama de Implantação (Deployments) — Kraefegg M.O.

Estratégia de deployments por ambiente e produto-serviço.

```mermaid
flowchart TD
    DEV[Dev - Wokwi + localhost] -->|push| CI[GitHub Actions / hook pre-commit]
    CI -->|auditor security/audit_security.py| GH[GitHub público<br/>kraefegg/KraefeggMO]
    GH --> PAGES[GitHub Pages<br/>Plataforma HQ / Dashboard]
    GH --> SUPABASE[Supabase<br/>PostgreSQL - demandas/operação]
    GH --> DATABRICKS[Databricks Delta Sharing<br/>dados analíticos ambientais]
    GH --> GATEWAY[Gateway OmniRoute daemon<br/>porta 20128 - modelos/agentes]

    subgraph EDGE["Edge Deployment"]
        FW[Firmware ESP32 MicroPython] --> OTA[OTA / recarga de campo]
        OTA --> NOS[Sensores instalados<br/>offshore + mineração]
    end
```

## Ambientes

| Ambiente | Onde roda | Propósito |
|---|---|---|
| Desenvolvimento | Local (Wokwi, gateway daemon) | Iteração de firmware e dashboard |
| CI | GitHub Actions + hook pre-commit | Auditoria de segurança, testes de simulação |
| Público | GitHub Pages (`deploy-github-pages.ps1`) | Dashboard operacional / HQ |
| Nuvem de dados | Supabase + Databricks | Armazenamento e analytics |
| Campo | ESP32 (Edge) | Coleta + inferência local de anomalia |

## Ciclo de release

1. Editar arquivos raiz do repo (`index.html`, `data.js`, `pages.js`, `style.css`, `app.js` para o AIO Observatory; ou `rd/`, `hq/`, `security/`, `db/` para KraefeggMO).
2. `git add` + `git commit` (hook roda o auditor).
3. `git push origin main` → CI/Pages/Databricks atualizam.
4. Firmware embarcado: simular no Wokwi, validar serial, então programar os dispositivos.
