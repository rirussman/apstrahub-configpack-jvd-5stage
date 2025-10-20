resource "apstra_template_rack_based" "Compute-POD" {
  name                     = "5Stage-Compute-POD"
  asn_allocation_scheme    = "single"
  overlay_control_protocol = "evpn"
  spine = {
    logical_device_id = apstra_logical_device.DC4-Spine.id
    count             = 2
    super_spine_link_count     = 1
    super_spine_link_speed     = "100G" 
  }
  rack_infos = {
     (apstra_rack_type.compute.id) = { count = 1 }
  }
}

resource "apstra_template_rack_based" "Storage-POD" {
  name                     = "5Stage-Storage-POD"
  asn_allocation_scheme    = "single"
  overlay_control_protocol = "evpn"
  spine = {
    logical_device_id = apstra_logical_device.DC4-Spine.id
    count             = 2
    super_spine_link_count     = 1
    super_spine_link_speed     = "100G"
  }
  rack_infos = {
     (apstra_rack_type.storage.id) = { count = 1 }
  }
}

resource "apstra_template_rack_based" "Services-POD" {
  name                     = "5Stage-Services-POD"
  asn_allocation_scheme    = "single"
  overlay_control_protocol = "evpn"
  spine = {
    logical_device_id = apstra_logical_device.DC4-Spine.id
    count             = 2
    super_spine_link_count     = 1
    super_spine_link_speed     = "100G"
  }
  rack_infos = {
     (apstra_rack_type.services.id) = { count = 1 }
  }
}



resource "apstra_template_pod_based" "DC4" {
  name                   = "5stage"
  super_spine = {
    logical_device_id = apstra_logical_device.DC4-SuperSpine.id
    per_plane_count   = 2
    plane_count       = 1
  }
  pod_infos = {
    (apstra_template_rack_based.Compute-POD.id) = { count = 1 } 
    (apstra_template_rack_based.Storage-POD.id) = { count = 1 }
    (apstra_template_rack_based.Services-POD.id) = { count = 1 }
  }
}
