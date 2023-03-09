### Vault Agent config for PKI

This is an example on how to use the Vault agent to retrieve PKI certs from Vault.

An example on how to setup Vault PKI is provided on `vault.tf.tmp` file

How to use it

1. Setup your Vault (use the example)
2. Run the vault agent using the command `vault agent -config=vault-agent.hcl`
3. Check the certificates created on `tmp` folder
4. In case you need the certificate serial number to do any server-side related task, you can check it on the `/tmp/certs/serial.info` file.
