# Changelog

Todos los cambios importantes de esta práctica de Terraform se documentan aquí.

El formato sigue el estilo de [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/) y el versionado [Semantic Versioning](https://semver.org/lang/es/).

## [v1.1] - 2026-04-30

### Añadido
- Segunda llamada al módulo `mi-recurso` creando el bucket `bucket-desde-modulo-dos`.
- Demuestra la reutilización del módulo con distinto valor en la variable `bucket_name`.

## [v1.0] - 2026-04-29

### Añadido
- Configuración inicial de Terraform con provider AWS apuntando a LocalStack.
- Recurso `aws_s3_bucket` llamado `mi-bucket-practica`.
- Recurso `aws_instance` llamado `instancia-practica` con tipo `t3.small`.
- Módulo reutilizable en `modules/mi-recurso/` para crear buckets S3.
- Llamada al módulo creando el bucket `bucket-desde-modulo`.
- Workflow de GitHub Actions `validate.yml` para validar el código en cada push.
- Workflow de GitHub Actions `deploy.yml` para desplegar la infraestructura en LocalStack.
- Badges de estado en el README.
- Archivo `REBASE.md` documentando la limpieza del historial.
