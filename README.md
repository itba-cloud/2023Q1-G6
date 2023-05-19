# repo-template

Repositorio correspondiente al Grupo 6

1. **Modulos:**

   * Cloudfront (custom-made)
   * Lambda (custom-made)
   * RDS (custom-made)
   * SNS (externo)
   * VPC (custom-made)
   * S3 Buckets (custom-made)
2. **Variables y Outputs:** en todos los modulos hay por lo menos uno.
3. **Funciones:**

   * format: web-site.tf line 10
   * ...
4. **Meta-argumentos:**

   * depends_on: (in VPC module) output.tf line 18
   * count: (in VPC module) main.tf line 12
   * for_each: (in Lambda module) main.tf line 2
