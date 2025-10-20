
# Create a Connectivity Template for the RED VNs and assign to all interfaces tagged with dc_5stage_red TAG.

resource "apstra_datacenter_connectivity_template_interface" "red_ct" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  name         = "dc_5stage_red_ct"
  description  = "DC VN1 Red"
  virtual_network_multiples = {
     group1 = {
         tagged_vn_ids = [apstra_datacenter_virtual_network.dc_5stage_vn1_red.id,
                          apstra_datacenter_virtual_network.dc_5stage_vn2_red.id,
         ]
    }
  }
}

resource "apstra_datacenter_connectivity_template_assignments" "assign_ct_dc_5stage_vn_red" {
  blueprint_id              = apstra_datacenter_blueprint.DC4-5Stage.id
  application_point_ids     = data.apstra_datacenter_interfaces_by_link_tag.red_all.ids
  connectivity_template_id =  apstra_datacenter_connectivity_template_interface.red_ct.id
}




# Create a Connectivity Template for the BLUE VNs and assign to all interfaces tagged with dc_5stage_blue TAG.

resource "apstra_datacenter_connectivity_template_interface" "blue_ct" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  name         = "dc_5stage_blue_ct"
  description  = "DC VN1 Blue"
  virtual_network_multiples = {
     group1 = {
         tagged_vn_ids = [apstra_datacenter_virtual_network.dc_5stage_vn1_blue.id,
                          apstra_datacenter_virtual_network.dc_5stage_vn2_blue.id,
         ]
    }
  }
}

resource "apstra_datacenter_connectivity_template_assignments" "assign_ct_dc_5stage_vn_blue" {
  blueprint_id              = apstra_datacenter_blueprint.DC4-5Stage.id
  application_point_ids     = data.apstra_datacenter_interfaces_by_link_tag.blue_all.ids
  connectivity_template_id =  apstra_datacenter_connectivity_template_interface.blue_ct.id
}





# Create a Connectivity Template for the GREEN VNs and assign to all interfaces tagged with dc_5stage_green TAG.

resource "apstra_datacenter_connectivity_template_interface" "green_ct" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  name         = "dc_5stage_green_ct"
  description  = "DC VN1 Green"
  virtual_network_multiples = {
     group1 = {
         tagged_vn_ids = [apstra_datacenter_virtual_network.dc_5stage_vn1_green.id,
                          apstra_datacenter_virtual_network.dc_5stage_vn2_green.id,
         ]
    }
  }
}

resource "apstra_datacenter_connectivity_template_assignments" "assign_ct_dc_5stage_vn_green" {
  blueprint_id              = apstra_datacenter_blueprint.DC4-5Stage.id
  application_point_ids     = data.apstra_datacenter_interfaces_by_link_tag.green.ids
  connectivity_template_id =  apstra_datacenter_connectivity_template_interface.green_ct.id
}






# Create a Connectivity Template for the YELLOW VNs and assign to all interfaces tagged with dc_5stage_yellow TAG.

resource "apstra_datacenter_connectivity_template_interface" "yellow_ct" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  name         = "dc_5stage_yellow_ct"
  description  = "DC VN1 Yellow"
  virtual_network_multiples = {
     group1 = {
         tagged_vn_ids = [apstra_datacenter_virtual_network.dc_5stage_vn1_yellow.id,
                          apstra_datacenter_virtual_network.dc_5stage_vn2_yellow.id,
         ]
    }
  }
}

resource "apstra_datacenter_connectivity_template_assignments" "assign_ct_dc_5stage_vn_yellow" {
  blueprint_id              = apstra_datacenter_blueprint.DC4-5Stage.id
  application_point_ids     = data.apstra_datacenter_interfaces_by_link_tag.yellow.ids
  connectivity_template_id =  apstra_datacenter_connectivity_template_interface.yellow_ct.id
}



# Create a Connectivity Template for the PURPLE VNs and assign to all interfaces tagged with dc_5stage_purple TAG.

resource "apstra_datacenter_connectivity_template_interface" "purple_ct" {
  blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  name         = "dc_5stage_purple_ct"
  description  = "DC VN1 Purple"
  virtual_network_multiples = {
     group1 = {
         tagged_vn_ids = [apstra_datacenter_virtual_network.dc_5stage_vn1_purple.id,
                          apstra_datacenter_virtual_network.dc_5stage_vn2_purple.id,
         ]
    }
  }
}

resource "apstra_datacenter_connectivity_template_assignments" "assign_ct_dc_5stage_vn_purple" {
  blueprint_id              = apstra_datacenter_blueprint.DC4-5Stage.id
  application_point_ids     = data.apstra_datacenter_interfaces_by_link_tag.purple.ids
  connectivity_template_id =  apstra_datacenter_connectivity_template_interface.purple_ct.id
}




