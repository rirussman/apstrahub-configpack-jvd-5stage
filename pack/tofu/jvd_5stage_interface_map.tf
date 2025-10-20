resource "apstra_interface_map" "DC4-SuperSpine_QFX5230" {
  name              = "DC4-SuperSpine_QFX5230"
  logical_device_id = apstra_logical_device.DC4-SuperSpine.id
  device_profile_id = "Juniper_QFX5230-64CD_Junos"
  interfaces = [
    {
      "logical_device_port"     = "1/1"
      "physical_interface_name" = "et-0/0/0"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/2"
      "physical_interface_name" = "et-0/0/1"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/3"
      "physical_interface_name" = "et-0/0/2"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/4"
      "physical_interface_name" = "et-0/0/3"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/5"
      "physical_interface_name" = "et-0/0/4"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/6"
      "physical_interface_name" = "et-0/0/5"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/7"
      "physical_interface_name" = "et-0/0/6"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/8"
      "physical_interface_name" = "et-0/0/7"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/9"
      "physical_interface_name" = "et-0/0/8"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/10"
      "physical_interface_name" = "et-0/0/9"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/11"
      "physical_interface_name" = "et-0/0/10"
      "transformation_id"       = 7
    },
    { 
      "logical_device_port"     = "1/12"
      "physical_interface_name" = "et-0/0/11"
      "transformation_id"       = 7
    },
  ]
}



resource "apstra_interface_map" "DC4-Spine_QFX5120" {
  name              = "DC4-Spine_QFX5120"
  logical_device_id = apstra_logical_device.DC4-Spine.id
  device_profile_id = "Juniper_QFX5120-32C_Junos"
  interfaces = [
    {
      "logical_device_port"     = "1/1"
      "physical_interface_name" = "et-0/0/0"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/2"
      "physical_interface_name" = "et-0/0/1"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/3"
      "physical_interface_name" = "et-0/0/2"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/4"
      "physical_interface_name" = "et-0/0/3"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/5"
      "physical_interface_name" = "et-0/0/4"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/6"
      "physical_interface_name" = "et-0/0/5"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/7"
      "physical_interface_name" = "et-0/0/6"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/8"
      "physical_interface_name" = "et-0/0/7"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/9"
      "physical_interface_name" = "et-0/0/8"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/10"
      "physical_interface_name" = "et-0/0/9"
      "transformation_id"       = 1
    }, 
    {
      "logical_device_port"     = "1/11"
      "physical_interface_name" = "et-0/0/10"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/12"
      "physical_interface_name" = "et-0/0/11"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/13"
      "physical_interface_name" = "et-0/0/12"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/14"
      "physical_interface_name" = "et-0/0/13"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/15"
      "physical_interface_name" = "et-0/0/14"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/16"
      "physical_interface_name" = "et-0/0/15"
      "transformation_id"       = 1
    },
  ]
}




resource "apstra_interface_map" "DC4-Spine_QFX5210" {
  name              = "DC4-Spine_QFX5210"
  logical_device_id = apstra_logical_device.DC4-Spine.id
  device_profile_id = "Juniper_QFX5210-64C_Junos"
  interfaces = [
    {
      "logical_device_port"     = "1/1"
      "physical_interface_name" = "et-0/0/0"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/2"
      "physical_interface_name" = "et-0/0/1"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/3"
      "physical_interface_name" = "et-0/0/2"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/4"
      "physical_interface_name" = "et-0/0/3"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/5"
      "physical_interface_name" = "et-0/0/4"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/6"
      "physical_interface_name" = "et-0/0/5"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/7"
      "physical_interface_name" = "et-0/0/6"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/8"
      "physical_interface_name" = "et-0/0/7"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/9"
      "physical_interface_name" = "et-0/0/8"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/10"
      "physical_interface_name" = "et-0/0/9"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/11"
      "physical_interface_name" = "et-0/0/10"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/12"
      "physical_interface_name" = "et-0/0/11"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/13"
      "physical_interface_name" = "et-0/0/12"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/14"
      "physical_interface_name" = "et-0/0/13"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/15"
      "physical_interface_name" = "et-0/0/14"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "1/16"
      "physical_interface_name" = "et-0/0/15"
      "transformation_id"       = 1
    },
  ]
}




resource "apstra_interface_map" "DC4-Spine_QFX5220" {
  name              = "DC4-Spine_QFX5220"
  logical_device_id = apstra_logical_device.DC4-Spine.id
  device_profile_id = "Juniper_QFX5220-32CD_Junos"
  interfaces = [
    {
      "logical_device_port"     = "1/1"
      "physical_interface_name" = "et-0/0/0"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/2"
      "physical_interface_name" = "et-0/0/1"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/3"
      "physical_interface_name" = "et-0/0/2"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/4"
      "physical_interface_name" = "et-0/0/3"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/5"
      "physical_interface_name" = "et-0/0/4"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/6"
      "physical_interface_name" = "et-0/0/5"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/7"
      "physical_interface_name" = "et-0/0/6"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/8"
      "physical_interface_name" = "et-0/0/7"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/9"
      "physical_interface_name" = "et-0/0/8"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/10"
      "physical_interface_name" = "et-0/0/9"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/11"
      "physical_interface_name" = "et-0/0/10"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/12"
      "physical_interface_name" = "et-0/0/11"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/13"
      "physical_interface_name" = "et-0/0/12"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/14"
      "physical_interface_name" = "et-0/0/13"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/15"
      "physical_interface_name" = "et-0/0/14"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "1/16"
      "physical_interface_name" = "et-0/0/15"
      "transformation_id"       = 3
    },
  ]
}




resource "apstra_interface_map" "DC4-Leaf_QFX5120" {
  name              = "DC4-Leaf_QFX5120"
  logical_device_id = apstra_logical_device.DC4-Leaf.id
  device_profile_id = "Juniper_QFX5120-48YM_Junos"
  interfaces = [
    {
      "logical_device_port"     = "1/1"
      "physical_interface_name" = "xe-0/0/0"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/2"
      "physical_interface_name" = "xe-0/0/1"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/3"
      "physical_interface_name" = "xe-0/0/2"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/4"
      "physical_interface_name" = "xe-0/0/3"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/5"
      "physical_interface_name" = "xe-0/0/4"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/6"
      "physical_interface_name" = "xe-0/0/5"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/7"
      "physical_interface_name" = "xe-0/0/6"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/8"
      "physical_interface_name" = "xe-0/0/7"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/9"
      "physical_interface_name" = "xe-0/0/8"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/10"
      "physical_interface_name" = "xe-0/0/9"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/11"
      "physical_interface_name" = "xe-0/0/10"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/12"
      "physical_interface_name" = "xe-0/0/11"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/13"
      "physical_interface_name" = "xe-0/0/12"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/14"
      "physical_interface_name" = "xe-0/0/13"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/15"
      "physical_interface_name" = "xe-0/0/14"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/16"
      "physical_interface_name" = "xe-0/0/15"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/17"
      "physical_interface_name" = "xe-0/0/16"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/18"
      "physical_interface_name" = "xe-0/0/17"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/19"
      "physical_interface_name" = "xe-0/0/18"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/20"
      "physical_interface_name" = "xe-0/0/19"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/21"
      "physical_interface_name" = "xe-0/0/20"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/22"
      "physical_interface_name" = "xe-0/0/21"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/23"
      "physical_interface_name" = "xe-0/0/22"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/24"
      "physical_interface_name" = "xe-0/0/23"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/25"
      "physical_interface_name" = "xe-0/0/24"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/26"
      "physical_interface_name" = "xe-0/0/25"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/27"
      "physical_interface_name" = "xe-0/0/26"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/28"
      "physical_interface_name" = "xe-0/0/27"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/29"
      "physical_interface_name" = "xe-0/0/28"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/30"
      "physical_interface_name" = "xe-0/0/29"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/31"
      "physical_interface_name" = "xe-0/0/30"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/32"
      "physical_interface_name" = "xe-0/0/31"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/33"
      "physical_interface_name" = "xe-0/0/32"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/34"
      "physical_interface_name" = "xe-0/0/33"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/35"
      "physical_interface_name" = "xe-0/0/34"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/36"
      "physical_interface_name" = "xe-0/0/35"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/37"
      "physical_interface_name" = "xe-0/0/36"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/38"
      "physical_interface_name" = "xe-0/0/37"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/39"
      "physical_interface_name" = "xe-0/0/38"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/40"
      "physical_interface_name" = "xe-0/0/39"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/41"
      "physical_interface_name" = "xe-0/0/40"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/42"
      "physical_interface_name" = "xe-0/0/41"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/43"
      "physical_interface_name" = "xe-0/0/42"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/44"
      "physical_interface_name" = "xe-0/0/43"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/45"
      "physical_interface_name" = "xe-0/0/44"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/46"
      "physical_interface_name" = "xe-0/0/45"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/47"
      "physical_interface_name" = "xe-0/0/46"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "1/48"
      "physical_interface_name" = "xe-0/0/47"
      "transformation_id"       = 2
    },
    {
      "logical_device_port"     = "2/1"
      "physical_interface_name" = "et-0/0/48"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "2/2"
      "physical_interface_name" = "et-0/0/49"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "2/3"
      "physical_interface_name" = "et-0/0/50"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "2/4"
      "physical_interface_name" = "et-0/0/51"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "2/5"
      "physical_interface_name" = "et-0/0/52"
      "transformation_id"       = 1
    },
    {
      "logical_device_port"     = "2/6"
      "physical_interface_name" = "et-0/0/53"
      "transformation_id"       = 1
    },
  ]
}




resource "apstra_interface_map" "DC4-Leaf_QFX5130_32CD" {
  name              = "DC4-Leaf_QFX5130_32CD"
  logical_device_id = apstra_logical_device.DC4-Leaf.id
  device_profile_id = "Juniper_QFX5130-32CD_Junos"
  interfaces = [
    {
      "logical_device_port"     = "1/1"
      "physical_interface_name" = "et-0/0/6:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/2"
      "physical_interface_name" = "et-0/0/6:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/3"
      "physical_interface_name" = "et-0/0/6:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/4"
      "physical_interface_name" = "et-0/0/6:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/5"
      "physical_interface_name" = "et-0/0/7:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/6"
      "physical_interface_name" = "et-0/0/7:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/7"
      "physical_interface_name" = "et-0/0/7:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/8"
      "physical_interface_name" = "et-0/0/7:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/9"
      "physical_interface_name" = "et-0/0/8:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/10"
      "physical_interface_name" = "et-0/0/8:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/11"
      "physical_interface_name" = "et-0/0/8:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/12"
      "physical_interface_name" = "et-0/0/8:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/13"
      "physical_interface_name" = "et-0/0/9:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/14"
      "physical_interface_name" = "et-0/0/9:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/15"
      "physical_interface_name" = "et-0/0/9:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/16"
      "physical_interface_name" = "et-0/0/9:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/17"
      "physical_interface_name" = "et-0/0/10:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/18"
      "physical_interface_name" = "et-0/0/10:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/19"
      "physical_interface_name" = "et-0/0/10:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/20"
      "physical_interface_name" = "et-0/0/10:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/21"
      "physical_interface_name" = "et-0/0/13:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/22"
      "physical_interface_name" = "et-0/0/13:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/23"
      "physical_interface_name" = "et-0/0/13:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/24"
      "physical_interface_name" = "et-0/0/13:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/25"
      "physical_interface_name" = "et-0/0/14:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/26"
      "physical_interface_name" = "et-0/0/14:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/27"
      "physical_interface_name" = "et-0/0/14:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/28"
      "physical_interface_name" = "et-0/0/14:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/29"
      "physical_interface_name" = "et-0/0/15:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/30"
      "physical_interface_name" = "et-0/0/15:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/31"
      "physical_interface_name" = "et-0/0/15:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/32"
      "physical_interface_name" = "et-0/0/15:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/33"
      "physical_interface_name" = "et-0/0/16:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/34"
      "physical_interface_name" = "et-0/0/16:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/35"
      "physical_interface_name" = "et-0/0/16:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/36"
      "physical_interface_name" = "et-0/0/16:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/37"
      "physical_interface_name" = "et-0/0/17:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/38"
      "physical_interface_name" = "et-0/0/17:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/39"
      "physical_interface_name" = "et-0/0/17:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/40"
      "physical_interface_name" = "et-0/0/17:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/41"
      "physical_interface_name" = "et-0/0/18:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/42"
      "physical_interface_name" = "et-0/0/18:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/43"
      "physical_interface_name" = "et-0/0/18:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/44"
      "physical_interface_name" = "et-0/0/18:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/45"
      "physical_interface_name" = "et-0/0/19:0"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/46"
      "physical_interface_name" = "et-0/0/19:1"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/47"
      "physical_interface_name" = "et-0/0/19:2"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "1/48"
      "physical_interface_name" = "et-0/0/19:3"
      "transformation_id"       = 6
    },
    {
      "logical_device_port"     = "2/1"
      "physical_interface_name" = "et-0/0/0"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "2/2"
      "physical_interface_name" = "et-0/0/1"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "2/3"
      "physical_interface_name" = "et-0/0/2"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "2/4"
      "physical_interface_name" = "et-0/0/3"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "2/5"
      "physical_interface_name" = "et-0/0/11"
      "transformation_id"       = 3
    },
    {
      "logical_device_port"     = "2/6"
      "physical_interface_name" = "et-0/0/12"
      "transformation_id"       = 3
    },
  ]
}

resource "apstra_interface_map" "DC4-Leaf_QFX5130_48C" {
  name              = "DC4-Leaf_QFX5130_48C"
  logical_device_id = apstra_logical_device.DC4-Leaf.id
  device_profile_id = "Juniper_QFX5130-48C_Junos"
  interfaces = [
    {
      "logical_device_port"     = "1/1"
      "physical_interface_name" = "et-0/0/0"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/2"
      "physical_interface_name" = "et-0/0/1"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/3"
      "physical_interface_name" = "et-0/0/2"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/4"
      "physical_interface_name" = "et-0/0/3"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/5"
      "physical_interface_name" = "et-0/0/4"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/6"
      "physical_interface_name" = "et-0/0/5"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/7"
      "physical_interface_name" = "et-0/0/6"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/8"
      "physical_interface_name" = "et-0/0/7"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/9"
      "physical_interface_name" = "et-0/0/8"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/10"
      "physical_interface_name" = "et-0/0/9"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/11"
      "physical_interface_name" = "et-0/0/10"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/12"
      "physical_interface_name" = "et-0/0/11"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/13"
      "physical_interface_name" = "et-0/0/12"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/14"
      "physical_interface_name" = "et-0/0/13"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/15"
      "physical_interface_name" = "et-0/0/14"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/16"
      "physical_interface_name" = "et-0/0/15"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/17"
      "physical_interface_name" = "et-0/0/16"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/18"
      "physical_interface_name" = "et-0/0/17"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/19"
      "physical_interface_name" = "et-0/0/18"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/20"
      "physical_interface_name" = "et-0/0/19"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/21"
      "physical_interface_name" = "et-0/0/20"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/22"
      "physical_interface_name" = "et-0/0/21"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/23"
      "physical_interface_name" = "et-0/0/22"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/24"
      "physical_interface_name" = "et-0/0/23"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/25"
      "physical_interface_name" = "et-0/0/24"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/26"
      "physical_interface_name" = "et-0/0/25"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/27"
      "physical_interface_name" = "et-0/0/26"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/28"
      "physical_interface_name" = "et-0/0/27"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/29"
      "physical_interface_name" = "et-0/0/28"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/30"
      "physical_interface_name" = "et-0/0/29"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/31"
      "physical_interface_name" = "et-0/0/30"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/32"
      "physical_interface_name" = "et-0/0/31"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/33"
      "physical_interface_name" = "et-0/0/32"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/34"
      "physical_interface_name" = "et-0/0/33"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/35"
      "physical_interface_name" = "et-0/0/34"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/36"
      "physical_interface_name" = "et-0/0/35"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/37"
      "physical_interface_name" = "et-0/0/36"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/38"
      "physical_interface_name" = "et-0/0/37"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/39"
      "physical_interface_name" = "et-0/0/38"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/40"
      "physical_interface_name" = "et-0/0/39"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/41"
      "physical_interface_name" = "et-0/0/40"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/42"
      "physical_interface_name" = "et-0/0/41"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/43"
      "physical_interface_name" = "et-0/0/42"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/44"
      "physical_interface_name" = "et-0/0/43"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/45"
      "physical_interface_name" = "et-0/0/44"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/46"
      "physical_interface_name" = "et-0/0/45"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/47"
      "physical_interface_name" = "et-0/0/46"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "1/48"
      "physical_interface_name" = "et-0/0/47"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "2/1"
      "physical_interface_name" = "et-0/0/48"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "2/2"
      "physical_interface_name" = "et-0/0/49"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "2/3"
      "physical_interface_name" = "et-0/0/50"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "2/4"
      "physical_interface_name" = "et-0/0/51"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "2/5"
      "physical_interface_name" = "et-0/0/52"
      "transformation_id"       = 4
    },
    {
      "logical_device_port"     = "2/6"
      "physical_interface_name" = "et-0/0/53"
      "transformation_id"       = 4
    },
  ]
}
