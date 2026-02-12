ui                = true
disable_mlock     = true
default_lease_ttl = "1h"
max_lease_ttl     = "24h"

api_addr          = "http://vault:8200"
cluster_addr      = "http://vault:8201"

storage "raft" {
  path = "/vault/file"
  node_id = "vault-0"
}

listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_disable   = true
  custom_response_headers {
    "default" = {
      "Content-Security-Policy" = ["connect-src http://vault.local:1080"]
    }
  }
}

