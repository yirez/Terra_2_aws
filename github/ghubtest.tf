provider "github" {
  token = "ghp_....C0BlNpL"
}

resource "github_repository" "test-repo2" {
  name        = "test-repo2"
  description = "What is happening"

  visibility = "public"
}

resource "github_branch" "dev" {
  repository = "test-repo2"
  branch     = "dev"
}


resource "github_repository_file" "readme" {
  repository          = "test-repo2"
  branch              = "main"
  file                = "readme.md"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terra"
  commit_email        = "Terra@example.com"
  overwrite_on_create = true
}
