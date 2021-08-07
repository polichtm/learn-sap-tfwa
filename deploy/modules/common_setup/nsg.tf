resource "azurerm_network_security_group" "sap_nsg" {
  name                = local.new_nsg_name
  resource_group_name = azurerm_resource_group.hana-resource-group.name
  location            = azurerm_resource_group.hana-resource-group.location

  security_rule {
    name                       = "SSH"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 22
    source_address_prefixes    = var.allow_ips
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "open-hana-db-ports"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3${var.sap_instancenum}00-3${var.sap_instancenum}99"
    source_address_prefixes    = var.allow_ips
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_rule" "hana-xsc-rules" {
  count                       = var.install_xsa ? 0 : length(local.hana_xsc_rules)
  name                        = element(split(",", local.hana_xsc_rules[count.index]), 0)
  priority                    = element(split(",", local.hana_xsc_rules[count.index]), 1)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = element(split(",", local.hana_xsc_rules[count.index]), 2)
  source_address_prefixes     = local.all_ips
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hana-resource-group.name
  network_security_group_name = azurerm_network_security_group.sap_nsg.name
}

resource "azurerm_network_security_rule" "hana-xsa-rules" {
  count                       = var.install_xsa ? length(local.hana_xsa_rules) : 0
  name                        = element(split(",", local.hana_xsa_rules[count.index]), 0)
  priority                    = element(split(",", local.hana_xsa_rules[count.index]), 1)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = element(split(",", local.hana_xsa_rules[count.index]), 2)
  source_address_prefixes     = local.all_ips
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hana-resource-group.name
  network_security_group_name = azurerm_network_security_group.sap_nsg.name
}

data "azurerm_network_security_group" "nsg_info" {
  name                = azurerm_network_security_group.sap_nsg.name
  resource_group_name = azurerm_resource_group.hana-resource-group.name
}
