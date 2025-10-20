# define mgmt addresses for each device to be onboarded

locals {
    devices = {
        spine001_001_1 = {
            label = "compute_spine1", 
            interface_map = apstra_interface_map.DC4-Spine_QFX5120.id
        },
        spine001_001_2 = {
            label = "compute_spine2", 
            interface_map = apstra_interface_map.DC4-Spine_QFX5120.id
        },
        leaf001_001_1 = {
            label = "compute_leaf1", 
            interface_map = apstra_interface_map.DC4-Leaf_QFX5120.id
        },   
        leaf001_001_2 = {
            label = "compute_leaf2", 
            interface_map = apstra_interface_map.DC4-Leaf_QFX5120.id
        },  
        spine002_001_1 = {
            label = "services_spine1",
            interface_map = apstra_interface_map.DC4-Spine_QFX5210.id
        },
        spine002_001_2 = {
            label = "services_spine2",
            interface_map = apstra_interface_map.DC4-Spine_QFX5210.id
        },
        sspine001_1 = {
            label = "superspine1",
            interface_map = apstra_interface_map.DC4-SuperSpine_QFX5230.id
        },
        sspine001_2 = {
            label = "superspine2",
            interface_map = apstra_interface_map.DC4-SuperSpine_QFX5230.id
        },
        spine003_001_1 = {
            label = "storage_spine1",
            interface_map = apstra_interface_map.DC4-Spine_QFX5220.id
        },
        spine003_001_2 = {
            label = "storage_spine2",
            interface_map = apstra_interface_map.DC4-Spine_QFX5220.id
        },
        leaf003_001_1 = {
            label = "storage_leaf1",
            interface_map = apstra_interface_map.DC4-Leaf_QFX5130_32CD.id
        },
        leaf003_001_2 = {
            label = "storage_leaf2",
            interface_map = apstra_interface_map.DC4-Leaf_QFX5130_32CD.id
        },
        leaf002_001_1 = {
            label = "services_leaf1",
            interface_map = apstra_interface_map.DC4-Leaf_QFX5130_48C.id
        },
        leaf002_001_2 = {
            label = "services_leaf2",
            interface_map = apstra_interface_map.DC4-Leaf_QFX5130_48C.id
        }
    }
}

