#  SPDX-License-Identifier: MIT

variable "fabric_asn_range" {
  type    = string
  description = "Internal Fabric ASN range, i.e. 65000-65010"

  validation {
    condition = (length(regexall("^[0-9]+-[0-9]+$", var.fabric_asn_range))==1)
    error_message = "The ASN range must be ASN1-ASN2"
  }
}

variable "external_asn_range" {
  type    = string
  description = "External Device ASN range, i.e. 65000-65010"

  validation {
    condition = (length(regexall("^[0-9]+-[0-9]+$", var.external_asn_range))==1)
    error_message = "The ASN range must be ASN1-ASN2"
  }
}

variable "ipv4_fabric_loopback_pool" {
  type    = string
  description = "IPv4 loopback address pool for the fabric, i.e. 192.168.10.0/24"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.ipv4_fabric_loopback_pool))==1)
    error_message = "The IP pool must be IP_ADDR/MASK"
  }
}

variable "ipv4_fabric_address_pool" {
  type    = string
  description = "IPv4 interface address pool for the fabric, i.e. 192.168.100.0/24"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.ipv4_fabric_address_pool))==1)
    error_message = "The IP pool must be IP_ADDR/MASK"
  }
}

variable "ipv4_external_address_pool" {
  type    = string
  description = "IPv4 interface addresses pool for the external connections, i.e. 192.168.110.0/24"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.ipv4_external_address_pool))==1)
    error_message = "The IP pool must be IP_ADDR/MASK"
  }
}

variable "ipv4_evpn_loopback_pool" {
  type    = string
  description = "IPv4 EVPN loopback address pool, i.e. 192.168.120.0/24"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.ipv4_evpn_loopback_pool))==1)
    error_message = "The IP pool must be IP_ADDR/MASK"
  }
}

variable "ipv6_fabric_loopback_pool" {
  type    = string
  description = "IPv6 loopback address pool for the fabric, i.e. fdf6:ed70:1fac:f2d1::1000/116"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.ipv6_fabric_loopback_pool))==1)
    error_message = "The IPv6 pool must be IPv6_ADDR/MASK"
  }
}

variable "ipv6_fabric_address_pool" {
  type    = string
  description = "IPv6 interface address pool for the fabric, i.e. fdf6:ed70:1fac:f2d1::/116"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.ipv6_fabric_address_pool))==1)
    error_message = "The IPv6 pool must be IPv6_ADDR/MASK"
  }
}

variable "ipv6_evpn_loopback_pool" {
  type    = string
  description = "IPv6 EVPN loopback address pool, i.e. fdf6:ed70:1fac:f2d1::2000/116"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.ipv6_evpn_loopback_pool))==1)
    error_message = "The IPv6 pool must be IPv6_ADDR/MASK"
  }
}

variable "ipv6_external_address_pool" {
  type    = string
  description = "IPv6 interface addresses pool for the external connections, i.e. 2001:db8:dc1:10:200::/80"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.ipv6_external_address_pool))==1)
    error_message = "The IPv6 pool must be IPv6_ADDR/MASK"
  }
}



variable "red_rz_vlan_id" {
  type    = number
  description = "VLAN ID used for RED routing zone"

  validation {
    condition      = var.red_rz_vlan_id < 4001
    error_message = "The VLAN ID must be between 1-4000"
  }
}

variable "blue_rz_vlan_id" {
  type    = number
  description = "VLAN ID used for BLUE routing zone"

  validation {
    condition      = var.blue_rz_vlan_id < 4001
    error_message = "The VLAN ID must be between 1-4000"
  }
}

variable "green_rz_vlan_id" {
  type    = number
  description = "VLAN ID used for GREEN routing zone"

  validation {
    condition      = var.green_rz_vlan_id < 4001
    error_message = "The VLAN ID must be between 1-4000"
  }
}

variable "yellow_rz_vlan_id" {
  type    = number
  description = "VLAN ID used for YELLOW routing zone"

  validation {
    condition      = var.yellow_rz_vlan_id < 4001
    error_message = "The VLAN ID must be between 1-4000"
  }
}

variable "purple_rz_vlan_id" {
  type    = number
  description = "VLAN ID used for PURPLE routing zone"

  validation {
    condition      = var.purple_rz_vlan_id < 4001
    error_message = "The VLAN ID must be between 1-4000"
  }
}


variable "sbd_vlan" {
  type    = number
  description = "VLAN ID used for OISM SBD"

  validation {
    condition      = var.sbd_vlan < 4001
    error_message = "The VLAN ID must be between 1-4000"
  }
}

variable "sbd_vni" {
  type    = number
  description = "VXLAN ID used for OISM SBD"

  validation {
    condition      = var.sbd_vni < 16777214
    error_message = "The VNI ID must be between 1-16777214"
  }
}

variable "red_rz_vni" {
  type    = number
  description = "VNI used for RED routing zone i.e. 10.10.0.200, 10.10.0.200"

  validation {
    condition      = var.red_rz_vni < 16777214
    error_message = "The VNI must be between 1-16777214"
  }
}

variable "blue_rz_vni" {
  type    = number
  description = "VNI used for BLUE routing zone"

  validation {
    condition      = var.blue_rz_vni < 16777214
    error_message = "The VNI must be between 1-16777214"
  }
}

variable "green_rz_vni" {
  type    = number
  description = "VNI used for GREEN routing zone i.e. 10.10.0.200, 10.10.0.200"

  validation {
    condition      = var.green_rz_vni < 16777214
    error_message = "The VNI must be between 1-16777214"
  }
}

variable "yellow_rz_vni" {
  type    = number
  description = "VNI used for YELLOW routing zone i.e. 10.10.0.200, 10.10.0.200"

  validation {
    condition      = var.yellow_rz_vni < 16777214
    error_message = "The VNI must be between 1-16777214"
  }
}

variable "purple_rz_vni" {
  type    = number
  description = "VNI used for PURPLE routing zone i.e. 10.10.0.200, 10.10.0.200"

  validation {
    condition      = var.purple_rz_vni < 16777214
    error_message = "The VNI must be between 1-16777214"
  }
}


variable "red_rz_dhcp" {
  type    = string
  description = "list of DHCP servers for RED routing zone, i.e. 10.10.0.200, 10.10.0.200"
}

variable "blue_rz_dhcp" {
  type    = string
  description = "list of DHCP servers for BLUE routing zone, i.e. 10.10.0.200, 10.10.0.200"
}

variable "green_rz_dhcp" {
  type    = string
  description = "list of DHCP servers for GREEN routing zone, i.e. 10.10.0.200, 10.10.0.200"
}




variable "leaf1_red_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf1 to external gateway in RED VRF, i.e. 10.1.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf1_red_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "leaf1_red_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf1 to external gateway in RED VRF, i.e. 2001:db8:dc1:10:200::0/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf1_red_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}


variable "external_to_leaf1_red_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf1 in RED VRF, i.e. 10.1.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf1_red_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf1_red_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf1 in RED VRF, i.e. 2001:db8:dc1:10:200::1/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf1_red_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}


variable "leaf2_red_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf2 in RED VRF to external gateway, i.e. 10.2.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf2_red_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "leaf2_red_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf2 to external gateway in RED VRF, i.e. 2001:db8:dc1:10:200::0/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf2_red_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}

variable "external_to_leaf2_red_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf2 in RED VRF, i.e. 10.2.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf2_red_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf2_red_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf2 in RED VRF, i.e. 2001:db8:dc1:10:200::1/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf2_red_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}

variable "leaf1_blue_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf1 in BLUE VRF to external gateway, i.e. 10.1.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf1_blue_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "leaf1_blue_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf1 to external gateway in BLUE VRF, i.e. 2001:db8:dc1:10:200::0/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf1_blue_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}

variable "external_to_leaf1_blue_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf1 in BLUE VRF, i.e. 10.1.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf1_blue_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf1_blue_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf1 in BLUE VRF, i.e. 10.1.0.1/31"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf1_blue_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}

variable "leaf2_blue_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf2 in BLUE VRF to external gateway, i.e. 10.2.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf2_blue_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "leaf2_blue_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf2 in BLUE VRF to external gateway, i.e. 10.2.0.0/31"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf2_blue_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}

variable "external_to_leaf2_blue_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf2 in BLUE VRF, i.e. 10.2.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf2_blue_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf2_blue_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf2 in BLUE VRF, i.e. 2001:db8:dc1:10:200::1/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf2_blue_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}








variable "leaf1_yellow_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf1 to external gateway in YELLOW VRF, i.e. 10.1.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf1_yellow_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}
  
variable "leaf1_yellow_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf1 to external gateway in YELLOW VRF, i.e. 2001:db8:dc1:10:200::0/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf1_yellow_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}
  
  
variable "external_to_leaf1_yellow_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf1 in YELLOW VRF, i.e. 10.1.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf1_yellow_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf1_yellow_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf1 in YELLOW VRF, i.e. 2001:db8:dc1:10:200::1/127"
  
  validation {     
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf1_yellow_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
} 

variable "leaf2_yellow_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf2 in YELLOW VRF to external gateway, i.e. 10.2.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf2_yellow_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "leaf2_yellow_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf2 to external gateway in YELLOW VRF, i.e. 2001:db8:dc1:10:200::0/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf2_yellow_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}

variable "external_to_leaf2_yellow_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf2 in YELLOW VRF, i.e. 10.2.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf2_yellow_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf2_yellow_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf2 in YELLOW VRF, i.e. 2001:db8:dc1:10:200::1/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf2_yellow_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}




variable "leaf1_green_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf1 to external gateway in GREEN VRF, i.e. 10.1.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf1_green_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}
  
variable "leaf1_green_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf1 to external gateway in GREEN VRF, i.e. 2001:db8:dc1:10:200::0/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf1_green_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}
  
  
variable "external_to_leaf1_green_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf1 in GREEN VRF, i.e. 10.1.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf1_green_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf1_green_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf1 in GREEN VRF, i.e. 2001:db8:dc1:10:200::1/127"
  
  validation {     
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf1_green_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
} 

variable "leaf2_green_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf2 in GREEN VRF to external gateway, i.e. 10.2.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf2_green_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "leaf2_green_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf2 to external gateway in GREEN VRF, i.e. 2001:db8:dc1:10:200::0/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf2_green_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}

variable "external_to_leaf2_green_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf2 in GREEN VRF, i.e. 10.2.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf2_green_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf2_green_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf2 in GREEN VRF, i.e. 2001:db8:dc1:10:200::1/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf2_green_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}


variable "leaf1_purple_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf1 to external gateway in PURPLE VRF, i.e. 10.1.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf1_purple_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}
  
variable "leaf1_purple_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf1 to external gateway in PURPLE VRF, i.e. 2001:db8:dc1:10:200::0/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf1_purple_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}
  
  
variable "external_to_leaf1_purple_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf1 in PURPLE VRF, i.e. 10.1.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf1_purple_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf1_purple_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf1 in PURPLE VRF, i.e. 2001:db8:dc1:10:200::1/127"
  
  validation {     
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf1_purple_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
} 

variable "leaf2_purple_to_external_ip" {
  type    = string
  description = "IPv4 address with subnet mask for leaf2 in PURPLE VRF to external gateway, i.e. 10.2.0.0/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.leaf2_purple_to_external_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "leaf2_purple_to_external_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for leaf2 to external gateway in PURPLE VRF, i.e. 2001:db8:dc1:10:200::0/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.leaf2_purple_to_external_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}

variable "external_to_leaf2_purple_ip" {
  type    = string
  description = "IPv4 address with subnet mask for external Gateway to leaf2 in PURPLE VRF, i.e. 10.2.0.1/31"

  validation {
    condition      = (length(regexall("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$", var.external_to_leaf2_purple_ip))==1)
    error_message = "The IP address must be IP_ADDR/MASK"
  }
}

variable "external_to_leaf2_purple_ipv6" {
  type    = string
  description = "IPv6 address with subnet mask for external Gateway to leaf2 in PURPLE VRF, i.e. 2001:db8:dc1:10:200::1/127"

  validation {
    condition      = (length(regexall("^(([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))(/[0-9]{1,3})$", var.external_to_leaf2_purple_ipv6))==1)
    error_message = "The IPv6 address must be IPv6_ADDR/MASK"
  }
}



variable "borderleaf1_pim_gw_int" {
  type    = string
  description = "Interface and unit which connects to PIM external gateway for OISM, i.e. et-0/0/7.299"
  }

variable "borderleaf2_pim_gw_int" {
  type    = string
  description = "Interface and unit which connects to PIM external gateway for OISM, i.e. et-0/0/7.299"
  }
