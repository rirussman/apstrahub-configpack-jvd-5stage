
resource "apstra_datacenter_connectivity_template_interface" "mx-external" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  name         = "mx-external"
  ip_links = {
       red_ext = {
        vlan_id=199
        ipv4_addressing_type = "numbered"
        ipv6_addressing_type = "numbered"
        routing_zone_id = apstra_datacenter_routing_zone.red.id
        bgp_peering_generic_systems= {
            red_ext_bgp = {
                  ipv4_addressing_type = "addressed"
                  ipv6_addressing_type = "addressed"
                  bfd_enabled = false
                  neighbor_asn_dynamic = false
                  peer_from_loopback = false
                  peer_to = "interface_or_ip_endpoint"
                  ttl = 2
                  routing_policies = {
                   red_ext_policy = {
                    routing_policy_id = apstra_datacenter_routing_policy.external_router_mx.id
                    }
                  }    
             }
        }
       }
       blue_ext = {
        vlan_id=299
        ipv4_addressing_type = "numbered"
        ipv6_addressing_type = "numbered"
        routing_zone_id= apstra_datacenter_routing_zone.blue.id
        bgp_peering_generic_systems= {
             blue_ext_bgp = {
                  ipv4_addressing_type = "addressed"
                  ipv6_addressing_type = "addressed"
                  bfd_enabled = false
                  neighbor_asn_dynamic = false
                  peer_from_loopback = false
                  peer_to = "interface_or_ip_endpoint"
                  ttl=2
                  routing_policies = {
                    blue_ext_policy = {
                    routing_policy_id = apstra_datacenter_routing_policy.external_router_mx.id
                    }
                  }    
             }
          }
       }
       yellow_ext = {
        vlan_id=399
        ipv4_addressing_type = "numbered"
        ipv6_addressing_type = "numbered"
        routing_zone_id= apstra_datacenter_routing_zone.yellow.id
        bgp_peering_generic_systems= {
             yellow_ext_bgp = {
                  ipv4_addressing_type = "addressed"
                  ipv6_addressing_type = "addressed"
                  bfd_enabled = false
                  neighbor_asn_dynamic = false
                  peer_from_loopback = false
                  peer_to = "interface_or_ip_endpoint"
                  ttl=2
                  routing_policies = {
                    yellow_ext_policy = {
                    routing_policy_id = apstra_datacenter_routing_policy.external_router_mx.id
                    }
                  }    
             }
          }
       }
       green_ext = {
        vlan_id=499
        ipv4_addressing_type = "numbered"
        ipv6_addressing_type = "numbered"
        routing_zone_id= apstra_datacenter_routing_zone.green.id
        bgp_peering_generic_systems= {
             green_ext_bgp = {
                  ipv4_addressing_type = "addressed"
                  ipv6_addressing_type = "addressed"
                  bfd_enabled = false
                  neighbor_asn_dynamic = false
                  peer_from_loopback = false
                  peer_to = "interface_or_ip_endpoint"
                  ttl=2
                  routing_policies = {
                    green_ext_policy = {
                    routing_policy_id = apstra_datacenter_routing_policy.external_router_mx.id
                    }
                  }    
             }
          }
       }
       purple_ext = {
        vlan_id=599
        ipv4_addressing_type = "numbered"
        ipv6_addressing_type = "numbered"
        routing_zone_id= apstra_datacenter_routing_zone.purple.id
        bgp_peering_generic_systems= {
             purple_ext_bgp = {
                  ipv4_addressing_type = "addressed"
                  ipv6_addressing_type = "addressed"
                  bfd_enabled = false
                  neighbor_asn_dynamic = false
                  peer_from_loopback = false
                  peer_to = "interface_or_ip_endpoint"
                  ttl=2
                  routing_policies = {
                    purple_ext_policy = {
                    routing_policy_id = apstra_datacenter_routing_policy.external_router_mx.id
                    }
                  }    
             }
          }
       }

    }
}





resource "apstra_datacenter_connectivity_templates_assignment" "ext1" {
  blueprint_id             = apstra_datacenter_blueprint.DC4-5Stage.id
  connectivity_template_ids = [ apstra_datacenter_connectivity_template_interface.mx-external.id ]
  application_point_id =   one(data.apstra_datacenter_interfaces_by_link_tag.mx_external_link1.ids)
  fetch_ip_link_ids = true
}
resource "apstra_datacenter_connectivity_templates_assignment" "ext2" {
  blueprint_id             = apstra_datacenter_blueprint.DC4-5Stage.id
  connectivity_template_ids = [ apstra_datacenter_connectivity_template_interface.mx-external.id ]
  application_point_id =   one(data.apstra_datacenter_interfaces_by_link_tag.mx_external_link2.ids)
  fetch_ip_link_ids = true
}



resource "apstra_datacenter_ip_link_addressing" "ext1_red" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext1]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext1.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][199]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf1_red_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf1_red_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf1_red_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf1_red_ipv6

}

resource "apstra_datacenter_ip_link_addressing" "ext2_red" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext2]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext2.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][199]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf2_red_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf2_red_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf2_red_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf2_red_ipv6

}



resource "apstra_datacenter_ip_link_addressing" "ext1_blue" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext1]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext1.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][299]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf1_blue_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf1_blue_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf1_blue_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf1_blue_ipv6

}

resource "apstra_datacenter_ip_link_addressing" "ext2_blue" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext2]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext2.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][299]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf2_blue_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf2_blue_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf2_blue_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf2_blue_ipv6

}


resource "apstra_datacenter_ip_link_addressing" "ext1_yellow" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext1]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext1.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][399]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf1_yellow_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf1_yellow_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf1_yellow_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf1_yellow_ipv6

}

resource "apstra_datacenter_ip_link_addressing" "ext2_yellow" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext2]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext2.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][399]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf2_yellow_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf2_yellow_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf2_yellow_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf2_yellow_ipv6

}


resource "apstra_datacenter_ip_link_addressing" "ext1_green" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext1]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext1.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][499]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf1_green_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf1_green_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf1_green_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf1_green_ipv6

}

resource "apstra_datacenter_ip_link_addressing" "ext2_green" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext2]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext2.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][499]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf2_green_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf2_green_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf2_green_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf2_green_ipv6

}




resource "apstra_datacenter_ip_link_addressing" "ext1_purple" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext1]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext1.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][599]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf1_purple_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf1_purple_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf1_purple_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf1_purple_ipv6

}

resource "apstra_datacenter_ip_link_addressing" "ext2_purple" {
  depends_on = [apstra_datacenter_connectivity_templates_assignment.ext2]
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id

  link_id      = apstra_datacenter_connectivity_templates_assignment.ext2.ip_link_ids[apstra_datacenter_connectivity_template_interface.mx-external.id][599]
  switch_ipv4_address_type = "numbered"        # none | numbered
  switch_ipv4_address      = var.leaf2_purple_to_external_ip

  generic_ipv4_address_type = "numbered"       # none | numbered
  generic_ipv4_address      = var.external_to_leaf2_purple_ip

  switch_ipv6_address_type = "numbered"        # none | numbered
  switch_ipv6_address      = var.leaf2_purple_to_external_ipv6

  generic_ipv6_address_type = "numbered"       # none | numbered
  generic_ipv6_address      = var.external_to_leaf2_purple_ipv6

}











data "apstra_datacenter_virtual_network_binding_constructor" "all" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = var.sbd_vlan
    switch_ids   = [ 
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "blue-SBD" {
  name                         = "blue-SBD"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.blue.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.200.0.1"
  ipv4_subnet                  = "10.200.0.0/24"
  vni                          = var.sbd_vni
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.all.bindings
}

