
# We will build 2 VNs per routing zone, according to the JVD documentation

data "apstra_datacenter_virtual_network_binding_constructor" "red_400" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "400"
    switch_ids   = [ 
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn1_red" {
  name                         = "dc_5stage_vn1_red"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.red.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.0.0.1"
  ipv4_subnet                  = "10.0.0.0/24"
  vni                          = "10400"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.red_400.bindings
}

data "apstra_datacenter_virtual_network_binding_constructor" "red_401" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "401"
    switch_ids   = [
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn2_red" {
  name                         = "dc_5stage_vn2_red"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.red.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.0.1.1"
  ipv4_subnet                  = "10.0.1.0/24"
  vni                          = "10401"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.red_401.bindings
}

data "apstra_datacenter_virtual_networks" "dc_5stage_vn1_red" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn1_red] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn1_red"
    },
  ]
}

data "apstra_datacenter_virtual_networks" "dc_5stage_vn2_red" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn2_red] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn2_red"
    },
  ]
}












data "apstra_datacenter_virtual_network_binding_constructor" "blue_1400" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "1400"
    switch_ids   = [
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn1_blue" {
  name                         = "dc_5stage_vn1_blue"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.blue.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.10.0.1"
  ipv4_subnet                  = "10.10.0.0/24"
  vni                          = "11400"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.blue_1400.bindings
}



data "apstra_datacenter_virtual_network_binding_constructor" "blue_1401" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "1401"
    switch_ids   = [
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_2"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn2_blue" {
  name                         = "dc_5stage_vn2_blue"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.blue.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.10.1.1"
  ipv4_subnet                  = "10.10.1.0/24"
  vni                          = "11401"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.blue_1401.bindings
}




data "apstra_datacenter_virtual_networks" "dc_5stage_vn1_blue" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn1_blue] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn1_blue"
    },
  ]
}

data "apstra_datacenter_virtual_networks" "dc_5stage_vn2_blue" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn2_blue] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn2_blue"
    },
  ]
}











data "apstra_datacenter_virtual_network_binding_constructor" "purple_2800" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "2800"
    switch_ids   = [
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn1_purple" {
  name                         = "dc_5stage_vn1_purple"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.purple.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.28.0.1"
  ipv4_subnet                  = "10.28.0.0/24"
  vni                          = "12800"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.purple_2800.bindings
}



data "apstra_datacenter_virtual_network_binding_constructor" "purple_2801" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "2801"
    switch_ids   = [
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf003_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn2_purple" {
  name                         = "dc_5stage_vn2_purple"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.purple.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.28.1.1"
  ipv4_subnet                  = "10.28.1.0/24"
  vni                          = "12801"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.purple_2801.bindings
}


data "apstra_datacenter_virtual_networks" "dc_5stage_vn1_purple" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn1_purple] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn1_purple"
    },
  ]
}

data "apstra_datacenter_virtual_networks" "dc_5stage_vn2_purple" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn2_purple] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn2_purple"
    },
  ]
}






data "apstra_datacenter_virtual_network_binding_constructor" "yellow_3100" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "3100"
    switch_ids   = [
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn1_yellow" {
  name                         = "dc_5stage_vn1_yellow"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.yellow.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.31.0.1"
  ipv4_subnet                  = "10.31.0.0/24"
  vni                          = "13100"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.yellow_3100.bindings
}



data "apstra_datacenter_virtual_network_binding_constructor" "yellow_3101" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "3101"
    switch_ids   = [
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf002_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn2_yellow" {
  name                         = "dc_5stage_vn2_yellow"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.yellow.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.31.1.1"
  ipv4_subnet                  = "10.31.1.0/24"
  vni                          = "13101"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.yellow_3101.bindings
}


data "apstra_datacenter_virtual_networks" "dc_5stage_vn1_yellow" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn1_yellow] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn1_yellow"
    },
  ]
}

data "apstra_datacenter_virtual_networks" "dc_5stage_vn2_yellow" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn2_yellow] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn2_yellow"
    },
  ]
}







data "apstra_datacenter_virtual_network_binding_constructor" "green_2500" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "2500"
    switch_ids   = [
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn1_green" {
  name                         = "dc_5stage_vn1_green"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.green.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.25.0.1"
  ipv4_subnet                  = "10.25.0.0/24"
  vni                          = "12500"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.green_2500.bindings
}



data "apstra_datacenter_virtual_network_binding_constructor" "green_2501" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
    vlan_id    = "2501"
    switch_ids   = [
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_1"].node_id,
      apstra_datacenter_device_allocation.interface_map_assignment["leaf001_001_2"].node_id
    ]
}

resource "apstra_datacenter_virtual_network" "dc_5stage_vn2_green" {
  name                         = "dc_5stage_vn2_green"
  blueprint_id                 = apstra_datacenter_blueprint.DC4-5Stage.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.green.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.25.1.1"
  ipv4_subnet                  = "10.25.1.0/24"
  vni                          = "12501"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.green_2501.bindings
}


data "apstra_datacenter_virtual_networks" "dc_5stage_vn1_green" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn1_green] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn1_green"
    },
  ]
}

data "apstra_datacenter_virtual_networks" "dc_5stage_vn2_green" {
  depends_on = [apstra_datacenter_virtual_network.dc_5stage_vn2_green] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  filters = [
    {
      name = "dc_5stage_vn2_green"
    },
  ]
}
