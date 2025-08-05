module "virtual_network" {
  source              = "shivakpkp/network/azure"
  version             = "1.0.1"
  Vnet-name           = var.Vnet-name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefix       = var.subnet_prefix
  nsg_name            = var.nsg_name
  security_rule       = var.security_rule
}

resource "azurerm_network_interface" "network_interface" {
  name                = "${var.environment}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = module.virtual_network.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "network_interface_asg" {
  network_interface_id          = azurerm_network_interface.network_interface.id
  network_security_group_id = module.virtual_network.network_security_group_id
}

