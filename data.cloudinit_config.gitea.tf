data cloudinit_config gitea {
  gzip          = false
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = templatefile(
      "./metadata.gitea.cloud-config",
      {
        GITEA_APP_NAME        = var.gitea_app_name,
        GITEA_DB_NAME         = var.gitea_db_name,
        GITEA_DB_PASSWD       = var.gitea_db_passwd,
        GITEA_DB_ROOT_PASSWD  = var.gitea_db_root_passwd,
        GITEA_DB_USER         = var.gitea_db_user,
        GITEA_SSH_DOMAIN      = var.gitea_ssh_domain,
        GITEA_SSH_LISTEN_PORT = var.gitea_ssh_listen_port,
        GITEA_SSH_PORT        = var.gitea_ssh_port,
      }
    )
  }
  part {
    content_type = "text/x-shellscript"
    content = templatefile(
      "./metadata.gitea.sh", {
        GITEA_SSH_PORT = var.gitea_ssh_port,
      }
    )
  }
}
