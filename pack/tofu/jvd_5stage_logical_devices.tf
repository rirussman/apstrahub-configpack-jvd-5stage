resource "apstra_logical_device" "DC4-SuperSpine" {
  name = "DC4-SuperSpine"
  panels = [
    {
      rows = 2
      columns = 6
      port_groups = [
        {
          port_count = 12
          port_speed = "100G"
          port_roles = ["spine", "leaf", "peer", "access", "generic"]
        }
      ]
    }
  ]
}

resource "apstra_logical_device" "DC4-Spine" {
  name = "DC4-Spine"
  panels = [
    {
      rows = 2
      columns = 8
      port_groups = [
        {
          port_count = 16
          port_speed = "100G"
          port_roles = ["superspine", "leaf", "generic"]
        }
      ]
    }
  ]
}




resource "apstra_logical_device" "DC4-Leaf" {
  name = "DC4-Leaf"
  panels = [
    {
      rows = 2
      columns = 24
      port_groups = [
        {
          port_count = 48
          port_speed = "10G"
          port_roles = ["generic", "peer", "access"]
        }
      ]
    },
    {
      rows = 2
      columns = 3
      port_groups = [
        {
          port_count = 6
          port_speed = "100G"
          port_roles = ["generic", "spine"]
        }
      ]
    }
  ]
}
