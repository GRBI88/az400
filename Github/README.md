{
    "clientId": "e...",
    "clientSecret": "8...",
    "subscriptionId": "9...",
    "tenantId": "5.."
}



AZURE_CREDENTIALS


.github/workflows

```yaml

on: push

jobs:
  job:
    runs-on: ubuntu-latest
    steps:
      - name: Azure Login
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
      - name: hellostep
        run: echo "Hello world!"
      - name: Azure CLI script
        uses: azure/CLI@v1
        with:
          azcliversion: 2.30.0
          inlineScript: |
            az group create --location westeurope --name az400-github-rg

```