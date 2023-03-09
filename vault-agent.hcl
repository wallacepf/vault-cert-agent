vault {
    address = "https://vaultaddress:8200"
}

auto_auth {
    method {
        type = "approle"
        namespace = "admin"
        config = {
            role_id_file_path = "tmp/roleid"
            secret_id_file_path = "tmp/secretid"
            remove_secret_id_file_after_reading = false
        }
    }

    sink {
        type = "file"

        config = {
            path = "/tmp/token"
        }
    }
}

# TLS SERVER CERTIFICATE
template {
  contents = "{{ with secret \"pki_root/issue/test\" \"common_name=nginx.dev.testlab.com\" \"ttl=1m\" }}{{ .Data.certificate }}{{ end }}"
  destination = "tmp/certs/nginx.crt"
}

# TLS PRIVATE KEY
template {
  contents = "{{ with secret \"pki_root/issue/test\" \"common_name=nginx.dev.testlab.com\" \"ttl=1m\" }} {{ .Data.private_key }}{{ end }}"
  destination = "tmp/certs/nginx.key"
}

# TLS CA CERTIFICATE
template {
  contents = "{{ with secret \"pki_root/issue/test\" \"common_name=nginx.dev.testlab.com\" \"ttl=1m\" }} {{ .Data.issuing_ca }}{{ end }}"
  destination = "tmp/certs/ca.crt"
}

# CERT SERIAL
template {
  contents = "{{ with secret \"pki_root/issue/mtls\" \"common_name=nginx.dev.testlab.com\" \"ttl=1m\" }} {{ .Data.serial_number }}{{ end }}"
  destination = "tmp/certs/serial.info"
}