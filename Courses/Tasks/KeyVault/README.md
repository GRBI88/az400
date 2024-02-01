- Create Key vault (standard NOT PREMIUM)
- Retention 7 days

-> Goto secrets verify that you are NOT able to access it

Access Control (IAM) -> Grant yourself Key Vault Administrator access (Role Assignment)


-> Secrets -> Add secret (remember the secret name and the vault name)

Deploy pipeline

Run Pipeline -> Failing because your SERVICE CONNECTION do 
not have access

Find your service connection's Service Principal in entra
Grant Secret User access to your service principal

Pipeline should work

