resource "apstra_datacenter_blueprint" "DC4-5Stage" {
    name        = "DC4-5Stage"
    template_id = apstra_template_pod_based.DC4.id
    fabric_addressing = "ipv4_ipv6"
    fabric_mtu = 9170
    ipv6_applications = true
    evpn_type_5_routes = true
}



# ASN pools, IPv4 pools and switch devices will be allocated using looping
# resources. These three `local` maps are what we'll loop over.
locals {
  asn_pools = {
    superspine_asns = [apstra_asn_pool.DC4-ASNs.id]
    spine_asns = [apstra_asn_pool.DC4-ASNs.id]
    leaf_asns  = [apstra_asn_pool.DC4-ASNs.id]
    generic_asns = [apstra_asn_pool.External-ASN.id]
  }
  ipv4_pools = {
    superspine_loopback_ips  = [apstra_ipv4_pool.DC4-Loopbacks.id]
    spine_loopback_ips  = [apstra_ipv4_pool.DC4-Loopbacks.id]
    leaf_loopback_ips   = [apstra_ipv4_pool.DC4-Loopbacks.id]
    spine_leaf_link_ips = [apstra_ipv4_pool.DC4-Fabric-IPs.id]
    spine_superspine_link_ips = [apstra_ipv4_pool.DC4-Fabric-IPs.id]

  }
  ipv6_pools = {
    superspine_loopback_ips_ipv6  = [apstra_ipv6_pool.DC4-IPv6-Loopbacks.id]
    spine_loopback_ips_ipv6  = [apstra_ipv6_pool.DC4-IPv6-Loopbacks.id]
    leaf_loopback_ips_ipv6   = [apstra_ipv6_pool.DC4-IPv6-Loopbacks.id]
    spine_leaf_link_ips_ipv6 = [apstra_ipv6_pool.DC4-Fabric-IPv6.id]
    spine_superspine_link_ips_ipv6 = [apstra_ipv6_pool.DC4-Fabric-IPv6.id]

  }
}


# Assign interface maps to fabric roles to eliminate build errors so we
# can deploy
resource "apstra_datacenter_device_allocation" "interface_map_assignment" {
  for_each         = local.devices
  blueprint_id     = apstra_datacenter_blueprint.DC4-5Stage.id
  node_name        = each.key
  initial_interface_map_id = each.value.interface_map
}


# Assign ASN pools to fabric roles to eliminate build errors so we
# can deploy
resource "apstra_datacenter_resource_pool_allocation" "asn" {
  for_each     = local.asn_pools
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  role         = each.key
  pool_ids     = each.value
}

# Assign IPv4 pools to fabric roles to eliminate build errors so we
# can deploy
resource "apstra_datacenter_resource_pool_allocation" "ipv4" {
  for_each     = local.ipv4_pools
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  role         = each.key
  pool_ids     = each.value
}

# Assign IPv6 pools to fabric roles to eliminate build errors so we
# can deploy
resource "apstra_datacenter_resource_pool_allocation" "ipv6" {
  for_each     = local.ipv6_pools
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  role         = each.key
  pool_ids     = each.value
}

