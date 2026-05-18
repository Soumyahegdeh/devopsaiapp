variable "repositories" {
  type = list(string)
}

resource "aws_ecr_repository" "repos" {
  for_each = toset(var.repositories)

  name = each.value
  force_delete = true  # To delete the images inside the repo
  
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

}
