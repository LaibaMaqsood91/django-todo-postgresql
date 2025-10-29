# 🧰 DevOps Report – Django Todo App

## Technologies Used
- Django 4.x
- PostgreSQL 15
- Docker & Docker Compose
- GitHub Actions
- Render Cloud
- Docker Hub Registry

## Pipeline Design
(Include your diagram here showing the 5 stages)

## Secrets Management Strategy
- Stored securely in GitHub Secrets
- Used via environment variables
- No hardcoded passwords or API keys

## Testing Process
- PostgreSQL service created during CI
- Migrations run before tests
- Django test runner used for automation

## Lessons Learned
- How to use Docker networking
- Configuring multi-stage Docker builds
- Managing secrets in CI
- Using Render deploy hooks for automation
