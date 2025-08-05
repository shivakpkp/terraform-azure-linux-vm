Vnet-name           = "example-network"
resource_group_name = "TestRG_3"
location            = "canadacentral"
address_space       = ["10.0.0.0/16"]
subnet_name         = "example-subnet"
subnet_prefix       = ["10.0.10.0/24"]
nsg_name            = "example-nsg"
security_rule = [
  {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "AllowHTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]
environment = "Dev"
vm_size = "Standard_DS1_v2"