# create routing zones in Apstra which translate to IP VRFs on the devices



resource "apstra_datacenter_routing_zone" "red" {
  name              = "red"
  blueprint_id      = apstra_datacenter_blueprint.DC4-5Stage.id
  vlan_id           = var.red_rz_vlan_id
  vni               = var.red_rz_vni
  junos_evpn_irb_mode   = "asymmetric"
  dhcp_servers = [var.red_rz_dhcp] 
}

resource "apstra_datacenter_routing_zone" "blue" {
  name              = "blue"
  blueprint_id      = apstra_datacenter_blueprint.DC4-5Stage.id
  vlan_id           = var.blue_rz_vlan_id
  vni               = var.blue_rz_vni
  junos_evpn_irb_mode   = "asymmetric"
  dhcp_servers = [var.blue_rz_dhcp]
}


resource "apstra_datacenter_routing_zone" "green" {
  name              = "green"
  blueprint_id      = apstra_datacenter_blueprint.DC4-5Stage.id
  vlan_id           = var.green_rz_vlan_id
  vni               = var.green_rz_vni
  junos_evpn_irb_mode   = "asymmetric"
  dhcp_servers = [var.green_rz_dhcp]
}

resource "apstra_datacenter_routing_zone" "yellow" {
  name              = "yellow"
  blueprint_id      = apstra_datacenter_blueprint.DC4-5Stage.id
  vlan_id           = var.yellow_rz_vlan_id
  vni               = var.yellow_rz_vni
  junos_evpn_irb_mode   = "asymmetric"
}

resource "apstra_datacenter_routing_zone" "purple" {
  name              = "purple"
  blueprint_id      = apstra_datacenter_blueprint.DC4-5Stage.id
  vlan_id           = var.purple_rz_vlan_id
  vni               = var.purple_rz_vni
  junos_evpn_irb_mode   = "asymmetric"
}


# assign loopbacks for each routing zone

resource "apstra_datacenter_resource_pool_allocation" "red_rz_loopback" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips"
  pool_ids     = [apstra_ipv4_pool.DC4-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.red.id // adds implicit dependency on RZ creation
}

resource "apstra_datacenter_resource_pool_allocation" "blue_rz_loopback" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips"
  pool_ids     = [apstra_ipv4_pool.DC4-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.blue.id // adds implicit dependency on RZ creation
}

resource "apstra_datacenter_resource_pool_allocation" "green_rz_loopback" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips"
  pool_ids     = [apstra_ipv4_pool.DC4-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.green.id // adds implicit dependency on RZ creation
}

resource "apstra_datacenter_resource_pool_allocation" "purple_rz_loopback" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips"
  pool_ids     = [apstra_ipv4_pool.DC4-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.purple.id // adds implicit dependency on RZ creation
}

resource "apstra_datacenter_resource_pool_allocation" "yellow_rz_loopback" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips" 
  pool_ids     = [apstra_ipv4_pool.DC4-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.yellow.id // adds implicit dependency on RZ creation
}




resource "apstra_datacenter_resource_pool_allocation" "red_rz_loopback_v6" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips_ipv6"
  pool_ids     = [apstra_ipv6_pool.DC4-IPv6-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.red.id // adds implicit dependency on RZ creation
}

resource "apstra_datacenter_resource_pool_allocation" "blue_rz_loopback_v6" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips_ipv6"
  pool_ids     = [apstra_ipv6_pool.DC4-IPv6-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.blue.id // adds implicit dependency on RZ creation
}

resource "apstra_datacenter_resource_pool_allocation" "green_rz_loopback_v6" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips_ipv6"
  pool_ids     = [apstra_ipv6_pool.DC4-IPv6-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.green.id // adds implicit dependency on RZ creation
}

resource "apstra_datacenter_resource_pool_allocation" "purple_rz_loopback_v6" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips_ipv6"
  pool_ids     = [apstra_ipv6_pool.DC4-IPv6-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.purple.id // adds implicit dependency on RZ creation
}

resource "apstra_datacenter_resource_pool_allocation" "yellow_rz_loopback_v6" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id // adds implicit dependency on blueprint creation
  role         = "leaf_loopback_ips_ipv6"
  pool_ids     = [apstra_ipv6_pool.DC4-IPv6-EVPN-Loopbacks.id]
  routing_zone_id = apstra_datacenter_routing_zone.yellow.id // adds implicit dependency on RZ creation
}






resource "apstra_datacenter_routing_policy" "external_router_mx" {
  blueprint_id  = apstra_datacenter_blueprint.DC4-5Stage.id
  name          = "external_router"
  import_policy = "default_only" // "default_only" is the default. other options: "all" "extra_only"
  extra_exports = [
    { prefix = "0.0.0.0/0", ge_mask = 1,   le_mask = 32,   action = "permit"   },
    { prefix = "::/0", ge_mask = 1,    le_mask = 32,   action = "permit"   },
  ]
  export_policy = {
    export_l2_edge_subnets        = true
    export_loopbacks              = true
    export_static_routes          = null
  }
  expect_default_ipv4 = true
  expect_default_ipv6 = true
}
