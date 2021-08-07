variable "allow_ips" {
  description = "The IP addresses that will be allowed by the nsg"
  default     = ["0.0.0.0/0"]
}

variable "ansible_playbook_path" {
  description = "Path from this module to the playbook"
  default     = "../../ansible/single_node_playbook.yml"
}

variable "az_domain_name" {
  description = "Prefix to be used in the domain name"
}

variable "az_region" {
}

variable "az_resource_group" {
  description = "Which Azure resource group to deploy the HANA setup into.  i.e. <myResourceGroup>"
}

variable "email_shine" {
  description = "e-mail address for SHINE user"
  default     = "shinedemo@microsoft.com"
}

variable "install_cockpit" {
  description = "Flag that determines whether to install Cockpit on the host"
  default     = false
}

variable "install_shine" {
  description = "Flag that determines whether to install SHINE on the host"
  default     = false
}

variable "install_xsa" {
  description = "Flag that determines whether to install XSA on the host"
  default     = false
}

variable "install_webide" {
  description = "Flag that determines whether to install WebIDE on the host"
  default     = false
}

variable "private_ip_address_hdb" {
  description = "The desired private IP address of this HANA database.  If it isn't specified, a dynamic IP will be allocated."
  default     = "10.0.0.6"
}

variable "public_ip_allocation_type" {
  description = "Defines whether the IP address is static or dynamic. Options are Static or Dynamic."
  default     = "Dynamic"
}

variable "pw_db_system" {
  description = "Password for the database user SYSTEM"
}

variable "pw_os_sapadm" {
  description = "Password for the SAP admin, which is an OS user"
}

variable "pw_os_sidadm" {
  description = "Password for this specific sidadm, which is an OS user"
}

variable "pwd_db_shine" {
  description = "Password for SHINE user"
  default     = ""
}

variable "pwd_db_tenant" {
  description = "Password for SYSTEM user (tenant DB)"
  default     = ""
}

variable "pwd_db_xsaadmin" {
  description = "Password for XSAADMIN user"
  default     = ""
}

variable "sap_instancenum" {
  description = "The sap instance number which is in range 00-99"
}

variable "sap_sid" {
  default = "I20"
}

variable "sshkey_path_private" {
  description = "The path on the local machine to where the private key is"
}

variable "sshkey_path_public" {
  description = "The path on the local machine to where the public key is"
}

variable "storage_disk_sizes_gb" {
  description = "List disk sizes in GB for all disks this VM will need"
  default     = [512, 512, 512]
}

variable "url_cockpit" {
  description = "URL for HANA Cockpit"
  default     = ""
}

variable "url_di_core" {
  description = "URL for DI Core"
  default     = ""
}

variable "url_portal_services" {
  description = "URL for Portal Services"
  default     = ""
}

variable "url_sap_hdbserver" {
  type        = string
  description = "The URL that points to the HDB server 122.17 bits"
}

variable "url_sapui5" {
  description = "URL for SAPUI5"
  default     = ""
}

variable "url_shine_xsa" {
  description = "URL for SHINE XSA"
  default     = ""
}

variable "url_xs_services" {
  description = "URL for XS Services"
  default     = ""
}

variable "url_xsa_runtime" {
  description = "URL for XSA runtime"
  default     = ""
}

variable "url_xsa_hrtt" {
  description = "URL for HRTT"
  default     = ""
}

variable "url_xsa_webide" {
  description = "URL for WebIDE"
  default     = ""
}

variable "url_xsa_mta" {
  description = "URL for MTA ext"
  default     = ""
}

variable "useHana2" {
  description = "If this is set to true, then, ports specifically for HANA 2.0 will be opened."
  default     = false
}

variable "hana1_db_mode" {
  description = "The database mode to use if deploying HANA 1. The acceptable values are: single_container, multiple_containers"
  default     = "multiple_containers"
}

variable "vm_size" {
  default = "Standard_E8s_v3"
}

variable "vm_user" {
  description = "The username of your HANA database VM."
}
