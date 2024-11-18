# variables.tf

# vSphere connection details variable
variable "vcenter_username" {
  type = string
}

variable "vcenter_password" {
  type = string
}

variable "vcenter_url" {
  type = string
}

# Datacenter name
variable "datacenter_name" {
  type        = string
  description = "The name of the datacenter"
  default     = "UKTME"
}

# Distributed Virtual Switch Name
variable "vds_name" {
  type        = string
  description = "The name of the distributed virtual switch"
  default     = "hx-prod-vds-01"
}

# Primary and Secondary VLANs for PVLAN mappings - need to ensure VLANs are configured in access policies
variable "primary_vlan_ids" {
  type        = list(number)
  description = "List of primary VLAN IDs for PVLAN configuration"
  # default     = [3010]
  default     = []
}

variable "secondary_vlan_ids" {
  type        = map(list(number))
  description = "Mapping of primary VLAN to secondary VLANs"
  default = {
    # 3010 = [3010, 3011] # Promiscuous, Isolated
  }
}

# PVLAN Port Groups Configuration
variable "pvlan-portgroups" {
  type        = map(number)
  description = "Port groups and their associated secondary VLAN IDs"
  default = {
# Port group name should follow the ACI structure 'tenant|application profile|epg'
    # "adealdag|network-segments|192.168.40.0_24" = 3011
  }
}

# Access Port Groups Configuration
variable "access-portgroups" {
  type        = map(number)
  description = "Access Port groups"
  default = {
    "10.237.99.32_28_nd-data-network" = 989
    "64.103.44.48_28_dmz_vlan-3001" = 3001
    "64.103.44.64_27_dmz_vlan-3001" = 3002
    "64.103.44.96_28_dmz_vlan-3001" = 3003
    "64.103.45.0_27_dmz_vlan-3001" = 3004
  }
}
