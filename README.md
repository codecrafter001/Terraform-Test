# TerraAgent 🌍⚡
### *Next-Generation Multi-Agent Cloud Migration & Infrastructure Intelligence Platform*

> **Transform unmanaged AWS ClickOps environments into secure, modular, production-grade Terraform & OpenTofu architecture — 100% safely without touching live cloud state.**

---

[![Python](https://img.shields.io/badge/Python-3.11+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.111.0-009688?style=for-the-badge&logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
[![Next.js](https://img.shields.io/badge/Next.js-14_App_Router-000000?style=for-the-badge&logo=next.js&logoColor=white)](https://nextjs.org/)
[![LangGraph](https://img.shields.io/badge/LangGraph-Multi--Agent-FF6F00?style=for-the-badge&logo=langchain&logoColor=white)](https://langchain-ai.github.io/langgraph/)
[![Terraform](https://img.shields.io/badge/Terraform-1.5+-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![OpenTofu](https://img.shields.io/badge/OpenTofu-1.6+-FFAA00?style=for-the-badge&logo=opentofu&logoColor=white)](https://opentofu.org/)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=for-the-badge)](LICENSE)

---

## 🧭 Overview & Mission

**TerraAgent** bridges the gap between chaotic, manual cloud deployments ("ClickOps") and modern Infrastructure as Code (IaC) DevOps standards. 

Organizations accumulate substantial cloud debt: critical resources created via web consoles, missing state files, undocumented dependencies, and unmanaged drift. Traditional reverse-engineering is high-risk, tedious, and prone to breaking production.

TerraAgent deploys a **stateful multi-agent system** orchestrated by **LangGraph** to discover live AWS environments, uncover deep resource relationships, schedule multi-wave migration plans, generate clean and modular Terraform/OpenTofu HCL, validate against rigorous security policies, and heal syntax/validation errors automatically before human review.

---

## ✨ Key Features

- 🔍 **Safe & Read-Only Discovery**: Connects to AWS via non-destructive `Describe*`, `Get*`, and `List*` APIs or LocalStack for testing.
- 🕸️ **Deep Dependency Graph & Topology Mapping**: Discovers network topologies, security group references, IAM attachments, VPC peering, and subnet relationships.
- 🌊 **Staged Migration Wave Scheduling**: Groups resources into staged rollout waves (e.g., Network ➔ Storage & Database ➔ Compute & Application ➔ Routing & Ingress).
- 🤖 **Autonomous Multi-Agent Collaboration**: Specialized AI agents handle discovery, planning, HCL synthesis, security validation, self-healing repair, and documentation.
- 🛡️ **Autonomous Self-Healing Loop**: Runs `terraform validate`, `tfsec`, `checkov`, `trivy`, and `conftest` (OPA). If issues arise, a self-repair agent iterates to fix HCL syntax and security violations before final bundle generation.
- 📦 **Declarative `import {}` Blocks**: Generates HCL 1.5+ native `import` blocks and target resource definitions with deterministic lookup tables instead of hallucinated IDs.
- 🔒 **Zero-Trust Safety Guardrails**: Hardcoded code-level chokepoints strictly prevent execution of `terraform apply`, `terraform destroy`, or unsolicited automated imports.
- 🌐 **Interactive Next.js Dashboard**: Live D3.js infrastructure graph visualization, migration progress tracker, SSE (Server-Sent Events) live log stream, and 1-click bundle downloads.
- 💻 **Flexible Inference (Local & Cloud)**: Supports private local LLMs via **Ollama** (`llama3`, `codellama`, `deepseek-coder`, `mistral`) and cloud LLMs via **Google Gemini API** / **Anthropic** / **OpenAI**.

---

## 🏛️ Multi-Agent Architecture

```mermaid
flowchart TD
    subgraph Discovery ["1. Read-Only Discovery"]
        AWS[("AWS Cloud / LocalStack")] -->|"Read-Only APIs (Describe/Get/List)"| DiscAgent["Discovery Agent"]
        DiscAgent -->|"Resource Metadata"| TopoMapper["Topology & Dependency Mapper"]
    end

    subgraph Planning ["2. Canonical Modeling & Wave Scheduling"]
        TopoMapper -->|"Graph Data"| CIM["Canonical Infra Model (CIM)"]
        CIM --> WavePlanner["Adoption Planning Agent"]
    end

    subgraph IaCGeneration ["3. IaC Synthesis & Quality Assurance"]
        WavePlanner -->|"Staged Waves"| HCLComposer["Terraform / OpenTofu Composer"]
        HCLComposer -->|"Generated HCL & imports.tf"| Validator["IaC Verifier & Security Auditor"]
        
        Validator -->|"tfsec / Checkov / Trivy / Validate"| Gate{Passes Audits?}
        Gate -->|"❌ Errors Found"| RepairAgent["Autonomous Repair Agent"]
        RepairAgent -->|"Patched HCL (Loop <= 2)"| Validator
    end

    subgraph Delivery ["4. Final Migration Bundle"]
        Gate -->|"✅ Clean & Verified"| DocAgent["Artifact & Documentation Agent"]
        DocAgent --> Bundle[("📦 Migration Bundle<br/>• main.tf / variables.tf / outputs.tf<br/>• imports.tf<br/>• Topology & Security Audit Report<br/>• Migration Playbook")]
    end
```

---

## 🛠️ Technology Stack

| Layer | Technologies & Tools |
|---|---|
| **Frontend UI** | Next.js 14 (App Router), TypeScript, Tailwind CSS, Lucide Icons, D3.js Graph Visualizer |
| **Backend API** | FastAPI (Async Python 3.11+), Pydantic v2, Uvicorn, SSE Live Streaming |
| **Multi-Agent Orchestration** | LangGraph (StateGraph), LangChain Core |
| **LLM Inference Engines** | Google Gemini API, Ollama (Local LLMs: `llama3`, `codellama`, `deepseek-coder`) |
| **Asynchronous Worker & Queue** | Celery, Redis 7 |
| **Database & Persistence** | PostgreSQL 15, SQLAlchemy ORM |
| **IaC & Security Tools** | Terraform CLI, OpenTofu CLI, `tfsec`, `checkov`, `trivy`, `conftest` (OPA) |
| **Infrastructure & Deployment** | Docker, Docker Compose, Nginx, Render Blueprint (`render.yaml`) |

---

## 🔒 Enterprise Safety Guardrails

TerraAgent is engineered with a **Zero-Damage, Zero-Exfiltration Guarantee**:

1. **Strictly Read-Only AWS Access**: Uses exclusively non-mutating AWS SDK calls (`Describe*`, `Get*`, `List*`).
2. **Code-Level Subprocess Chokepoint**: `TerraformRunner` rigorously inspects all commands before execution. Any command matching `apply`, `destroy`, or automated `import` triggers an immediate hard exception before spawning a subprocess.
3. **No Credential Exfiltration**: AWS Access Keys, Secret Keys, and Session Tokens are stripped, never stored in databases, never output to logs, and **never sent to LLM prompt contexts**.
4. **Human-in-the-Loop Review**: TerraAgent prepares ready-to-run Terraform code and declarative `import {}` blocks for engineers to review and run in their own secure CI/CD pipelines.
5. **Non-Root Execution**: Backend and Celery containers execute as a non-privileged `agent` user.

---

## 📁 Repository Structure

```text
TerraAgent/
├── backend/                  # FastAPI Application & AI Core
│   ├── agents/               # LangGraph Agent Nodes
│   │   ├── discovery.py      # AWS Read-Only Scanning Agent
│   │   ├── dependency.py     # Topology & Dependency Graphing Agent
│   │   ├── planning.py       # Wave Scheduling & Classification Agent
│   │   ├── composer.py       # Terraform/OpenTofu HCL Synthesis Agent
│   │   ├── validation_repair.py # Autonomous Self-Repair Agent
│   │   └── documentation.py  # Report & Playbook Generation Agent
│   ├── models/               # Pydantic Schemas & DB Models
│   ├── routers/              # API Endpoints (Scans, Waves, HCL, SSE Streams)
│   ├── services/             # Background Tasks, Celery Workers, Rate Limiters
│   ├── tools/                # Terraform, OpenTofu, tfsec, checkov Runners
│   └── main.py               # FastAPI Application Entrypoint
├── frontend/                 # Next.js 14 Web Application
│   ├── app/                  # App Router Pages & Layouts
│   ├── components/           # UI Components, Topology Visualizer, Terminals
│   └── lib/                  # API Client, State Hooks & Utilities
├── docker/                   # Dockerfiles, Nginx configs, and Service Definitions
├── docs/                     # Architecture Specifications & Deployment Guides
├── docker-compose.yml        # Full-stack Container Orchestration
├── docker-compose.gpu.yml    # GPU-accelerated Ollama Setup
└── render.yaml               # 1-Click Render Cloud Deployment Blueprint
```

---

## 🚀 Quick Start Guide

### Prerequisites

- [Docker](https://www.docker.com/) & [Docker Compose](https://docs.docker.com/compose/)
- Alternatively, for local manual runs:
  - **Python 3.11+**
  - **Node.js 18+** & **npm**
  - **Terraform / OpenTofu CLI**, **tfsec** (optional for local linting)
  - **Ollama** (optional for offline/local LLMs) or a **Google Gemini API Key**

---

### Option A: Running with Docker Compose (Recommended)

1. **Clone the repository**:
   ```bash
   git clone https://github.com/codecrafter001/Terraform-Test.git
   cd Terraform-Test
   ```

2. **Configure environment variables**:
   ```bash
   cp .env.example .env
   ```
   *Edit `.env` to supply your `GEMINI_API_KEY` (or configure local Ollama).*

3. **Start all services**:
   ```bash
   docker-compose up -d --build
   ```

4. **Access the Application**:
   - **Frontend UI**: [http://localhost:3002](http://localhost:3002) (or [http://localhost](http://localhost) via Nginx)
   - **FastAPI Docs**: [http://localhost:8000/docs](http://localhost:8000/docs)
   - **LocalStack Gateway**: [http://localhost:4566](http://localhost:4566)

---

### Option B: Local Development Setup

#### 1. Backend Setup
```bash
cd backend
python -m venv venv

# Windows:
.\venv\Scripts\activate
# Linux / macOS:
source venv/bin/activate

pip install -r requirements.txt
python -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

#### 2. Frontend Setup
```bash
cd frontend
npm install
npm run dev
```
Open [http://localhost:3000](http://localhost:3000) in your browser.

---

## ⚙️ Configuration Reference (`.env`)

| Variable | Description | Default / Example |
|---|---|---|
| `LLM_PROVIDER` | Active LLM backend (`gemini` or `ollama`) | `gemini` |
| `GEMINI_API_KEY` | Google Gemini API Key | `AIzaSy...` |
| `OLLAMA_HOST` | Ollama service endpoint for local LLMs | `http://localhost:11434` |
| `OLLAMA_MODEL` | Model tag for Ollama execution | `codellama:13b` |
| `DATABASE_URL` | PostgreSQL connection string | `postgresql://terraagent:password@localhost:5432/terraagent` |
| `REDIS_URL` | Redis instance for Celery task broker & SSE | `redis://localhost:6379/0` |
| `AWS_DEFAULT_REGION` | Target AWS Region for resource discovery | `us-east-1` |
| `USE_LOCALSTACK` | Route AWS SDK calls to local LocalStack instance | `false` |
| `TERRAAGENT_MANAGE_IAM` | Include IAM policies and roles in discovery | `false` |

---

## 📦 Output Migration Bundle

When a migration job finishes, TerraAgent packages a comprehensive, production-ready bundle:

```text
migration-bundle-[scan-id].zip
├── main.tf                 # Root Terraform module with provider definitions
├── variables.tf            # Input variables with validation rules
├── outputs.tf              # Exported resource ARNs, IDs, and endpoints
├── imports.tf              # Declarative HCL import {} blocks (Terraform 1.5+)
├── modules/                # Structured sub-modules (vpc, compute, database)
├── topology.json           # Discovered resource graph and dependency mapping
├── migration_plan.md       # Step-by-step Wave Migration Runbook
└── security_audit.json     # tfsec, checkov, and trivy compliance findings
```

---

## 🛡️ Security & Privacy

- **Data Privacy**: No cloud infrastructure metadata or source code is retained or shared beyond your configured LLM provider.
- **Air-Gapped Operation**: For high-security environments, switch `LLM_PROVIDER=ollama` to run completely offline without external internet traffic.
- **Sanitized Prompts**: All sensitive values (passwords, certificates, AWS tokens) are masked before feeding context to language models.

---

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:
1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/amazing-feature`.
3. Commit your changes: `git commit -m "feat: add support for AWS EKS discovery"`.
4. Push to the branch: `git push origin feature/amazing-feature`.
5. Open a Pull Request.

---

## 📄 License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.