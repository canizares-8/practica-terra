output "bucket_id" {
  description = "ID del bucket creado"
  value       = aws_s3_bucket.bucket_modulo.id
}
