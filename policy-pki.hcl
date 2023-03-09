path "pki_root/issue/test" {
    capabilities = [ "create", "update" ]
}

path "auth/token/renew" {
  capabilities = ["update"]
}

path "auth/token/renew-self" {
  capabilities = ["update"]
}