resource_group_name     = "ntier-qa"
azurerm_virtual_network = "azure_ntier_vnet"
location                = "eastus"
azure_ntier_cidr        = "10.10.0.0/16"
#azure_subnet            = ["10.10.0.0/24"]
#subnet_address_prefixes = "10.10.%g.0/24" we removed this for now as we dont need now as we used cidrsubnet function in network.tf

subnet_names = ["web", "app", "db", "mgmt"]

webnsg_config = {
  name = "webnsg"
  rules = [{
    name                       = "openhttp"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "80"
    access                     = "Allow"
    priority                   = 300
    direction                  = "Inbound"
    },
    {
      name                       = "open22"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "22"
      access                     = "Allow"
      priority                   = 310
      direction                  = "Inbound"
    },
    {
      name                       = "open5000"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "5000"
      access                     = "Allow"
      priority                   = 320
      direction                  = "Inbound"
    }
  ]
}

appnsg_config = {
  name = "appnsg"
  rules = [{
    name                       = "openhttp"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "8080"
    access                     = "Allow"
    priority                   = 300
    direction                  = "Inbound"

    },
    {
      name                       = "openssh"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "22"
      access                     = "Allow"
      priority                   = 310
      direction                  = "Inbound"
    },
    {
      name                       = "open7000"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "7000"
      access                     = "Allow"
      priority                   = 320
      direction                  = "Inbound"
    }

  ]
}


db_info = {
  db_name        = "employee"
  server_name    = "mymssqlserverfromtf"
  server_version = "12.0"
  user_name      = "user"
  password       = "my@123@india"
  sku_name       = "Basic"
  max_size_gb    = 2
}