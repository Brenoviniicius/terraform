#Especificando o serviõ
resource "aws_s3_bucket" "this" {
  #Gerando uma id randomica e concatenando com o environment(dev)
  bucket = "${random_pet.bucket.id}-${var.environment}"
  tags   = local.common_tags
}

#Adicionando um arquivo .json com o locals utilizando o recursos s3 object
resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.bucket
  key    = "config/${local.list_filepath}"
  source = local.list_filepath
  etag   = filemd5(local.list_filepath)
}