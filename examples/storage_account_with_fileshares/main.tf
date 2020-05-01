module "storage" {
  source                = "github.com/tietoevry-infra-as-code/terraform-azurerm-storage?ref=v1.0.0"
  
  #Resource Group
  create_resource_group = false
  resource_group_name   = "rg-demo-westeurope-01"
  location              = "westeurope"
  storage_account_name  = "storageaccwesteupore01"

# SMB file share with quota (GB) to create
  file_shares   = [
      { name    = "smbfileshare1"
        quota   = 50 },
      { name    = "smbfileshare2"
        quota   = 50 }
  ]

  # Tags for Azure resources
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "test-user"
  }
}