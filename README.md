# practica-terra

![Terraform Validate](https://github.com/canizares-8/practica-terra/actions/workflows/validate.yml/badge.svg)

Práctica de Terraform con LocalStack.

## Contenido

- `main.tf` - Configuración principal con bucket S3 e instancia EC2.
- `modules/mi-recurso/` - Módulo para crear buckets S3 reutilizables.
- `.github/workflows/validate.yml` - Workflow que valida el código Terraform en cada push.
