resource "apstra_rack_type" "compute" {
  name                       = "5stage_compute"
  description                = "Created by Terraform"
  fabric_connectivity_design = "l3clos"
  leaf_switches = { 
    "5stage_Compute" = { 
      logical_device_id   = apstra_logical_device.DC4-Leaf.id
      spine_link_count    = 1
      spine_link_speed    = "100G"
      redundancy_protocol = "esi"
    }
  }
  generic_systems = {
    CP_H1 = {
      count             = 1
      logical_device_id = "AOS-1x100-1"
      links = {
        CP_H1_100G = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id
                               ]
          speed              = "100G"
          target_switch_name = "5stage_Compute"
          switch_peer        = "first"
        }
      }
    },
    CP_H2 = {
      count             = 1
      logical_device_id = "AOS-1x10-1"
      links = {
        CP_H2_10G = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                                resource.apstra_tag.vntags["blue_all"].id,
                                resource.apstra_tag.vntags["green"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Compute"
          switch_peer        = "first"
        }
      }
    },
    CP_H3 = {
      count             = 1
      logical_device_id = "AOS-2x10-1"
      links = {
        CP_H3_LAG = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                                resource.apstra_tag.vntags["blue_all"].id,
                                resource.apstra_tag.vntags["green"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Compute"
          lag_mode           = "lacp_active"
        }
      }
    },
    CP_H4 = {
      count             = 1
      logical_device_id = "AOS-1x10-1"
      links = {
        CP_H4_10G = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                                resource.apstra_tag.vntags["blue_all"].id,
                                resource.apstra_tag.vntags["green"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Compute"
          switch_peer        = "second"
        }
      }
    }
  }
}







resource "apstra_rack_type" "storage" {
  name                       = "5stage_storage"
  description                = "Created by Terraform"
  fabric_connectivity_design = "l3clos"
  leaf_switches = {
    "5stage_Storage" = {
      logical_device_id   = apstra_logical_device.DC4-Leaf.id
      spine_link_count    = 1
      spine_link_speed    = "100G"
      redundancy_protocol = "esi"
    }
  }
  generic_systems = {
    ST_H1 = {
      count             = 1
      logical_device_id = "AOS-1x100-1"
      links = {
        ST_H1_100G = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                               ]
          speed              = "100G"
          target_switch_name = "5stage_Storage"
          switch_peer        = "first"
        }
      }
    },
    ST_H2 = {
      count             = 1
      logical_device_id = "AOS-1x10-1"
      links = {
        ST_H2_10G = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                                resource.apstra_tag.vntags["blue_all"].id,
                                resource.apstra_tag.vntags["purple"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Storage"
          switch_peer        = "first"
        }
      }
    },
    ST_H3 = {
      count             = 1
      logical_device_id = "AOS-2x10-1"
      links = {
        ST_H3_LAG = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                                resource.apstra_tag.vntags["blue_all"].id,
                                resource.apstra_tag.vntags["purple"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Storage"
          lag_mode           = "lacp_active"
        }
      }
    },
    ST_H4 = {
      count             = 1
      logical_device_id = "AOS-1x10-1"
      links = {
        ST_H4_10G = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                                resource.apstra_tag.vntags["blue_all"].id,
                                resource.apstra_tag.vntags["purple"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Storage"
          switch_peer        = "second"
        }
      }
    }
  }
}




resource "apstra_rack_type" "services" {
  name                       = "5stage_services"
  description                = "Created by Terraform"
  fabric_connectivity_design = "l3clos"
  leaf_switches = {
    "5stage_Services" = {
      logical_device_id   = apstra_logical_device.DC4-Leaf.id
      spine_link_count    = 1
      spine_link_speed    = "100G"
      redundancy_protocol = "esi"
    }
  }
  generic_systems = {
    SV_H1 = {
      count             = 1
      logical_device_id = "AOS-1x10-1"
      links = {
        SV_H1_10G = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                                resource.apstra_tag.vntags["blue_all"].id,
                                resource.apstra_tag.vntags["yellow"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Services"
          switch_peer        = "first"
        }
      }
    },
    SV_H2 = {
      count             = 1
      logical_device_id = "AOS-2x10-1"
      links = {
        SV_H2_LAG = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                                resource.apstra_tag.vntags["blue_all"].id,
                                resource.apstra_tag.vntags["yellow"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Services"
          lag_mode           = "lacp_active"
        }
      }
    },
    SV_H3 = {
      count             = 1
      logical_device_id = "AOS-1x10-1"
      links = {
        SV_H3_10G = {
          tag_ids            = [
                                resource.apstra_tag.vntags["red_all"].id,
                                resource.apstra_tag.vntags["blue_all"].id,
                                resource.apstra_tag.vntags["yellow"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Services"
          switch_peer        = "second"
        }
      }
    },
    SV_EXT1 = {
      count             = 1
      logical_device_id = "AOS-2x10-1"
      links = {
        SV_EXT1_10G = {
          tag_ids            = [
                                resource.apstra_tag.vntags["mx_external_link1"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Services"
          switch_peer        = "first"
        },
        SV_EXT1_10G_2 = {
          tag_ids            = [
                                resource.apstra_tag.vntags["mx_external_link2"].id
                               ]
          speed              = "10G"
          target_switch_name = "5stage_Services"
          switch_peer        = "second"
        }
      }
    }
  }
 }



data "apstra_datacenter_interfaces_by_link_tag" "red_all" {
    blueprint_id= apstra_datacenter_blueprint.DC4-5Stage.id
    tags= ["red_all"]
}

data "apstra_datacenter_interfaces_by_link_tag" "blue_all" {
    blueprint_id= apstra_datacenter_blueprint.DC4-5Stage.id
    tags= ["blue_all"]
}

data "apstra_datacenter_interfaces_by_link_tag" "green" {
    blueprint_id= apstra_datacenter_blueprint.DC4-5Stage.id
    tags= ["green"]
}

data "apstra_datacenter_interfaces_by_link_tag" "purple" {
    blueprint_id= apstra_datacenter_blueprint.DC4-5Stage.id
    tags= ["purple"]
}

data "apstra_datacenter_interfaces_by_link_tag" "yellow" {
    blueprint_id= apstra_datacenter_blueprint.DC4-5Stage.id
    tags= ["yellow"]
}

data "apstra_datacenter_interfaces_by_link_tag" "mx_external_link1" {
    blueprint_id= apstra_datacenter_blueprint.DC4-5Stage.id
    tags= ["mx_external_link1"]
}

data "apstra_datacenter_interfaces_by_link_tag" "mx_external_link2" {
    blueprint_id= apstra_datacenter_blueprint.DC4-5Stage.id
    tags= ["mx_external_link2"]
}


