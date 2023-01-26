# linguagem HCL ( TERRAFORM )

resource "aws_s3_bucket" "datalake" {
    bucket = "$(var.base_bucket_name)-$(var.ambiente)-$(var.numero_conta)"
    acl = "private"

    server_side_encryption_configuration {
        rule {
          apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"

         }
        }
    }

    tags = {
        IES = "XPE"
        CURSO = EDC
    }
}

resource "aws_s3_bucket_object" "codigospark" {
    bucket = aws_s3_bucket.datalake.id
    key = "emar-code/pyspark/job_spark_from_tf.py"
    acl = "private"
    source = "../job_spark.py" 
    etag = filemd5("../job_spark.py")
}

provider "aws" {
    region = "us-east-1"
  
}