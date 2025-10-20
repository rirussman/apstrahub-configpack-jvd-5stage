
resource "apstra_configlet" "protect" {
  name = "loopback-protect-RE-filter"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
               set firewall policer police-5mbps if-exceeding bandwidth-limit 5m
               set firewall policer police-5mbps if-exceeding burst-size-limit 5m
               set firewall policer police-5mbps then discard
               set firewall filter cpp-filter-v1 term ssh from source-prefix-list ssh-sources
               set firewall filter cpp-filter-v1 term ssh from protocol tcp
               set firewall filter cpp-filter-v1 term ssh from port ssh
               set firewall filter cpp-filter-v1 term ssh then count cpp-ssh-accept
               set firewall filter cpp-filter-v1 term ssh then accept
               set firewall filter cpp-filter-v1 term icmp from protocol icmp
               set firewall filter cpp-filter-v1 term icmp from icmp-type echo-request
               set firewall filter cpp-filter-v1 term icmp from icmp-type echo-reply
               set firewall filter cpp-filter-v1 term icmp from icmp-type unreachable
               set firewall filter cpp-filter-v1 term icmp from icmp-type time-exceeded
               set firewall filter cpp-filter-v1 term icmp then policer police-5mbps
               set firewall filter cpp-filter-v1 term icmp then count cpp-icmp-accept
               set firewall filter cpp-filter-v1 term bgp from source-prefix-list bgp-sources
               set firewall filter cpp-filter-v1 term bgp from protocol tcp
               set firewall filter cpp-filter-v1 term bgp from port bgp
               set firewall filter cpp-filter-v1 term bgp then accept
               set firewall filter cpp-filter-v1 term dns from protocol udp
               set firewall filter cpp-filter-v1 term dns from source-port 53
               set firewall filter cpp-filter-v1 term dns then count cpp-dns-accept
               set firewall filter cpp-filter-v1 term dns then accept
               set firewall filter cpp-filter-v1 term ntp from source-prefix-list ntp-sources
               set firewall filter cpp-filter-v1 term ntp from protocol udp
               set firewall filter cpp-filter-v1 term ntp from port ntp
               set firewall filter cpp-filter-v1 term ntp then count cpp-ntp-accept
               set firewall filter cpp-filter-v1 term ntp then accept
               set firewall filter cpp-filter-v1 term dhcp from protocol udp
               set firewall filter cpp-filter-v1 term dhcp from port dhcp
               set firewall filter cpp-filter-v1 term dhcp then count cpp-dhcp-accept
               set firewall filter cpp-filter-v1 term dhcp then accept
               set firewall filter cpp-filter-v1 term netconf from source-prefix-list ssh-sources
               set firewall filter cpp-filter-v1 term netconf from protocol tcp
               set firewall filter cpp-filter-v1 term netconf from port 830
               set firewall filter cpp-filter-v1 term netconf then count cpp-netconf-accept
               set firewall filter cpp-filter-v1 term netconf then accept
               set firewall filter cpp-filter-v1 term bfd from protocol udp
               set firewall filter cpp-filter-v1 term bfd from port 1280
               set firewall filter cpp-filter-v1 term bfd from port 3784
               set firewall filter cpp-filter-v1 term bfd from port 4784
               set firewall filter cpp-filter-v1 term bfd from port 3785
               set firewall filter cpp-filter-v1 term bfd then count cpp-bfd-accept
               set firewall filter cpp-filter-v1 term bfd then accept
               set firewall filter cpp-filter-v1 term snmp from source-prefix-list snmp-sources
               set firewall filter cpp-filter-v1 term snmp from port snmp
               set firewall filter cpp-filter-v1 term snmp then accept
               set firewall filter cpp-filter-v1 term ospf from protocol ospf
               set firewall filter cpp-filter-v1 term ospf then accept
               set firewall filter cpp-filter-v1 term fetch from protocol tcp
               set firewall filter cpp-filter-v1 term fetch from port 8080
               set firewall filter cpp-filter-v1 term fetch then accept
               set firewall filter cpp-filter-v1 term openssl from protocol tcp
               set firewall filter cpp-filter-v1 term openssl from port 32767
               set firewall filter cpp-filter-v1 term openssl then accept
               set firewall filter cpp-filter-v1 term discard-rest then count cpp-discard-rest
               set firewall filter cpp-filter-v1 term discard-rest then discard
               set policy-options prefix-list bgp-sources 10.0.0.0/8
               set policy-options prefix-list bgp-sources 192.0.0.0/8
               set policy-options prefix-list bgp-sources fdf6::/24
               set policy-options prefix-list bgp-sources 2001::/24
               set policy-options prefix-list ntp-sources 10.0.0.0/8
               set policy-options prefix-list ntp-sources 192.0.0.0/8
               set policy-options prefix-list ntp-sources 172.0.0.0/8
               set policy-options prefix-list snmp-sources 10.0.0.0/8
               set policy-options prefix-list snmp-sources 192.0.0.0/8
               set policy-options prefix-list snmp-sources 172.0.0.0/8
               set policy-options prefix-list ssh-sources 10.0.0.0/8
               set policy-options prefix-list ssh-sources 192.0.0.0/8
               set policy-options prefix-list ssh-sources 172.0.0.0/8
               set interfaces lo0 unit 0 family inet filter input cpp-filter-v1
      EOT
    }
  ]
}


resource "apstra_datacenter_configlet" "loopback-protect-RE-filter" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.protect.id
  condition = "role in [\"superspine\",\"spine\",\"leaf\"]"
  name = "loopback-protect-RE-filter"
}

resource "apstra_configlet" "evohost" {
  name = "evo-host-profile"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
               set system packet-forwarding-options forwarding-profile host-profile
      EOT
    }
  ]
}


resource "apstra_configlet" "fast_bfd_spine" {
  name = "fast_bfd_spine"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
           set protocols bgp group l3clos-s bfd-liveness-detection minimum-interval 100
           set protocols bgp group l3clos-s-evpn bfd-liveness-detection minimum-interval 300
      EOT
    }
  ]
}
resource "apstra_configlet" "fast_bfd_leaf" {
  name = "fast_bfd_leaf"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
          set protocols bgp group l3clos-l bfd-liveness-detection minimum-interval 100
          set protocols bgp group l3clos-l-evpn bfd-liveness-detection minimum-interval 300
      EOT
    }
  ]
}




resource "apstra_configlet" "spine-QOS-superspine_storage_pod" {
  name = "spine-QOS-superspine_storage_pod"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
          {% set cos_int = '' %}
          {% for if_name, if_param in interface.items() %}
              {% if 'leaf' or 'spine' in if_param['description'] %}
                  {% set cos_int = if_param['intfName'] %}
          set class-of-service interfaces {{cos_int}} scheduler-map sm1
          set class-of-service interfaces {{cos_int}} unit 0 classifiers dscp dscp-classifier
          set class-of-service interfaces {{cos_int}} unit 0 rewrite-rules dscp rw1
          {% endif %}
          {% endfor %}
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc0 loss-priority low code-points 001010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc2 loss-priority low code-points 100000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc3 loss-priority low code-points 010000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc3 loss-priority low code-points 101000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc4 loss-priority low code-points 011000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc5 loss-priority low code-points 001000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc5 loss-priority low code-points 011010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc6 loss-priority low code-points 101110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc6 loss-priority low code-points 111000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc7 loss-priority low code-points 110000
          set class-of-service drop-profiles dp0 interpolate fill-level 0
          set class-of-service drop-profiles dp0 interpolate fill-level 20
          set class-of-service drop-profiles dp0 interpolate drop-probability 0
          set class-of-service drop-profiles dp0 interpolate drop-probability 100
          set class-of-service drop-profiles dp1 interpolate fill-level 1
          set class-of-service drop-profiles dp1 interpolate fill-level 2
          set class-of-service drop-profiles dp1 interpolate drop-probability 0
          set class-of-service drop-profiles dp1 interpolate drop-probability 100
          set class-of-service forwarding-classes class fc0 queue-num 0
          set class-of-service forwarding-classes class fc1 queue-num 1
          set class-of-service forwarding-classes class fc2 queue-num 2
          set class-of-service forwarding-classes class fc3 queue-num 3
          set class-of-service forwarding-classes class fc4 queue-num 4
          set class-of-service forwarding-classes class fc5 queue-num 5
          set class-of-service forwarding-classes class fc6 queue-num 6
          set class-of-service forwarding-classes class fc7 queue-num 7
          set class-of-service forwarding-classes class mcast-fc queue-num 8
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc0 loss-priority low code-point af11
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc1 loss-priority low code-point be
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc2 loss-priority low code-point cs4
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc3 loss-priority low code-point cs2
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc4 loss-priority low code-point cs3
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc5 loss-priority low code-point cs1
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc6 loss-priority low code-point ef
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc7 loss-priority low code-point cs6
          set class-of-service scheduler-maps sm1 forwarding-class fc0 scheduler s0
          set class-of-service scheduler-maps sm1 forwarding-class fc1 scheduler s1
          set class-of-service scheduler-maps sm1 forwarding-class fc2 scheduler s2
          set class-of-service scheduler-maps sm1 forwarding-class fc3 scheduler s3
          set class-of-service scheduler-maps sm1 forwarding-class fc4 scheduler s4
          set class-of-service scheduler-maps sm1 forwarding-class fc5 scheduler s5
          set class-of-service scheduler-maps sm1 forwarding-class fc6 scheduler s6
          set class-of-service scheduler-maps sm1 forwarding-class fc7 scheduler s7
          set class-of-service schedulers s0 transmit-rate percent 50
          set class-of-service schedulers s0 priority low
          set class-of-service schedulers s0 drop-profile-map loss-priority any protocol any drop-profile dp0
          set class-of-service schedulers s0 explicit-congestion-notification
          set class-of-service schedulers s0 buffer-dynamic-threshold 9
          set class-of-service schedulers s1 transmit-rate percent 2
          set class-of-service schedulers s1 priority low
          set class-of-service schedulers s2 transmit-rate percent 12
          set class-of-service schedulers s2 priority low
          set class-of-service schedulers s2 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s2 explicit-congestion-notification
          set class-of-service schedulers s2 buffer-dynamic-threshold 9
          set class-of-service schedulers s3 transmit-rate percent 12
          set class-of-service schedulers s3 priority low
          set class-of-service schedulers s3 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s3 explicit-congestion-notification
          set class-of-service schedulers s3 buffer-dynamic-threshold 9
          set class-of-service schedulers s4 transmit-rate percent 12
          set class-of-service schedulers s4 priority low
          set class-of-service schedulers s4 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s4 explicit-congestion-notification
          set class-of-service schedulers s4 buffer-dynamic-threshold 9
          set class-of-service schedulers s5 transmit-rate percent 12
          set class-of-service schedulers s5 priority low
          set class-of-service schedulers s5 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s5 explicit-congestion-notification
          set class-of-service schedulers s5 buffer-dynamic-threshold 9
          set class-of-service schedulers s6 shaping-rate 16g
          set class-of-service schedulers s6 priority strict-high
          set class-of-service schedulers s6 buffer-dynamic-threshold 7
          set class-of-service schedulers s7 shaping-rate 8g
          set class-of-service schedulers s7 priority strict-high
          set class-of-service schedulers s7 buffer-dynamic-threshold 7
      EOT
    }
  ]
}



resource "apstra_configlet" "spine-QOS-compute_svc_pods" {
  name = "spine-QOS-compute_svc_pods"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
          {% set cos_int = '' %}
          {% for if_name, if_param in interface.items() %}
              {% if 'leaf' or 'spine' in if_param['description'] %}
                 {% set cos_int = if_param['intfName'] %}
          set class-of-service interfaces {{cos_int}} scheduler-map sm1
          set class-of-service interfaces {{cos_int}} classifiers dscp dscp-classifier
          set class-of-service interfaces {{cos_int}} rewrite-rules dscp rw1
              {% endif %}
          {% endfor %}
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc0 loss-priority low code-points 001010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc2 loss-priority low code-points 100000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc3 loss-priority low code-points 010000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc3 loss-priority low code-points 101000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc4 loss-priority low code-points 011000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc5 loss-priority low code-points 001000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc5 loss-priority low code-points 011010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc6 loss-priority low code-points 101110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc6 loss-priority low code-points 111000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc7 loss-priority low code-points 110000
          set class-of-service drop-profiles dp0 interpolate fill-level 0
          set class-of-service drop-profiles dp0 interpolate fill-level 20
          set class-of-service drop-profiles dp0 interpolate drop-probability 0
          set class-of-service drop-profiles dp0 interpolate drop-probability 100
          set class-of-service drop-profiles dp1 interpolate fill-level 1
          set class-of-service drop-profiles dp1 interpolate fill-level 2
          set class-of-service drop-profiles dp1 interpolate drop-probability 0
          set class-of-service drop-profiles dp1 interpolate drop-probability 100
          set class-of-service forwarding-classes class fc0 queue-num 0
          set class-of-service forwarding-classes class fc1 queue-num 1
          set class-of-service forwarding-classes class fc2 queue-num 2
          set class-of-service forwarding-classes class fc3 queue-num 3
          set class-of-service forwarding-classes class fc4 queue-num 4
          set class-of-service forwarding-classes class fc5 queue-num 5
          set class-of-service forwarding-classes class fc6 queue-num 6
          set class-of-service forwarding-classes class fc7 queue-num 7
          set class-of-service forwarding-classes class mcast-fc queue-num 8
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc0 loss-priority low code-point af11
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc1 loss-priority low code-point be
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc2 loss-priority low code-point cs4
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc3 loss-priority low code-point cs2
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc4 loss-priority low code-point cs3
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc5 loss-priority low code-point cs1
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc6 loss-priority low code-point ef
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc7 loss-priority low code-point cs6
          set class-of-service scheduler-maps sm1 forwarding-class fc0 scheduler s0
          set class-of-service scheduler-maps sm1 forwarding-class fc1 scheduler s1
          set class-of-service scheduler-maps sm1 forwarding-class fc2 scheduler s2
          set class-of-service scheduler-maps sm1 forwarding-class fc3 scheduler s3
          set class-of-service scheduler-maps sm1 forwarding-class fc4 scheduler s4
          set class-of-service scheduler-maps sm1 forwarding-class fc5 scheduler s5
          set class-of-service scheduler-maps sm1 forwarding-class fc6 scheduler s6
          set class-of-service scheduler-maps sm1 forwarding-class fc7 scheduler s7
          set class-of-service schedulers s0 transmit-rate percent 50
          set class-of-service schedulers s0 priority low
          set class-of-service schedulers s0 drop-profile-map loss-priority any protocol any drop-profile dp0
          set class-of-service schedulers s0 explicit-congestion-notification
          set class-of-service schedulers s0 buffer-dynamic-threshold 9
          set class-of-service schedulers s1 transmit-rate percent 2
          set class-of-service schedulers s1 priority low
          set class-of-service schedulers s2 transmit-rate percent 12
          set class-of-service schedulers s2 priority low
          set class-of-service schedulers s2 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s2 explicit-congestion-notification
          set class-of-service schedulers s2 buffer-dynamic-threshold 9
          set class-of-service schedulers s3 transmit-rate percent 12
          set class-of-service schedulers s3 priority low
          set class-of-service schedulers s3 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s3 explicit-congestion-notification
          set class-of-service schedulers s3 buffer-dynamic-threshold 9
          set class-of-service schedulers s4 transmit-rate percent 12
          set class-of-service schedulers s4 priority low
          set class-of-service schedulers s4 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s4 explicit-congestion-notification
          set class-of-service schedulers s4 buffer-dynamic-threshold 9
          set class-of-service schedulers s5 transmit-rate percent 12
          set class-of-service schedulers s5 priority low
          set class-of-service schedulers s5 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s5 explicit-congestion-notification
          set class-of-service schedulers s5 buffer-dynamic-threshold 9
          set class-of-service schedulers s6 shaping-rate 16g
          set class-of-service schedulers s6 priority strict-high
          set class-of-service schedulers s6 buffer-dynamic-threshold 7
          set class-of-service schedulers s7 shaping-rate 8g
          set class-of-service schedulers s7 priority strict-high
          set class-of-service schedulers s7 buffer-dynamic-threshold 7
      EOT
    }
  ]
}



resource "apstra_configlet" "leaf-QOS_storage_pod" {
  name = "leaf-QOS_storage_pod"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
          {% set cos_int = '' %}
          {% set access_int = '' %}
          {% for if_name, if_param in interface.items() %}
              {% if 'spine' in if_param['description'] %}
                 {% set cos_int = if_param['intfName'] %}
          set class-of-service interfaces {{cos_int}} scheduler-map sm1
          set class-of-service interfaces {{cos_int}} unit 0 classifiers dscp dscp-classifier
          set class-of-service interfaces {{cos_int}} unit 0 rewrite-rules dscp rw1
              {% endif %}
          {% endfor %}
          {% for if_name, if_param in interface.items() %}
              {% if '001-001' in if_param['description'] %}
                 {% set access_int = if_param['intfName'] %}
          set interfaces {{access_int}} unit 0 family ethernet-switching filter input ALLOWED_FROM_HOST
          set interfaces {{access_int}} unit 0 family ethernet-switching storm-control profile1
          set class-of-service interfaces {{access_int}} scheduler-map sm1
          set class-of-service interfaces {{access_int}} unit 0 classifiers dscp dscp-classifier
          set class-of-service interfaces {{access_int}} unit 0 rewrite-rules dscp rw1
          set class-of-service interfaces {{access_int}} congestion-notification-profile cnp
              {% endif %}
          {% endfor %}
          set forwarding-options storm-control-profiles profile1 all bandwidth-level 10000000
          set forwarding-options enhanced-hash-key ecmp-dlb flowlet inactivity-interval 50
          set forwarding-options enhanced-hash-key ecmp-dlb flowlet flowset-table-size 256
          set forwarding-options vxlan-tos-copy-filter
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc0 loss-priority low code-points 001010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc5 loss-priority low code-points 001000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc5 loss-priority low code-points 011010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc6 loss-priority low code-points 101110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc6 loss-priority low code-points 111000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc7 loss-priority low code-points 110000
          set class-of-service drop-profiles dp0 interpolate fill-level 0
          set class-of-service drop-profiles dp0 interpolate fill-level 20
          set class-of-service drop-profiles dp0 interpolate drop-probability 0
          set class-of-service drop-profiles dp0 interpolate drop-probability 100
          set class-of-service drop-profiles dp1 interpolate fill-level 1
          set class-of-service drop-profiles dp1 interpolate fill-level 2
          set class-of-service drop-profiles dp1 interpolate drop-probability 0
          set class-of-service drop-profiles dp1 interpolate drop-probability 100
          set class-of-service dedicated-buffer-profile p1 egress
          set class-of-service forwarding-classes class fc0 queue-num 0
          set class-of-service forwarding-classes class fc1 queue-num 1
          set class-of-service forwarding-classes class fc2 queue-num 2
          set class-of-service forwarding-classes class fc3 queue-num 3
          set class-of-service forwarding-classes class fc4 queue-num 4
          set class-of-service forwarding-classes class fc5 queue-num 5
          set class-of-service forwarding-classes class fc6 queue-num 6
          set class-of-service forwarding-classes class fc7 queue-num 7
          set class-of-service forwarding-classes class mcast-fc queue-num 8
          set class-of-service congestion-notification-profile cnp output ieee-802.1 code-point 011 flow-control-queue 5
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc0 loss-priority low code-point af11
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc1 loss-priority low code-point be
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc5 loss-priority low code-point cs1
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc6 loss-priority low code-point ef
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc7 loss-priority low code-point cs6
          set class-of-service scheduler-maps sm1 forwarding-class fc0 scheduler s0
          set class-of-service scheduler-maps sm1 forwarding-class fc1 scheduler s1
          set class-of-service scheduler-maps sm1 forwarding-class fc2 scheduler s2
          set class-of-service scheduler-maps sm1 forwarding-class fc3 scheduler s3
          set class-of-service scheduler-maps sm1 forwarding-class fc4 scheduler s4
          set class-of-service scheduler-maps sm1 forwarding-class fc5 scheduler s5
          set class-of-service scheduler-maps sm1 forwarding-class fc6 scheduler s6
          set class-of-service scheduler-maps sm1 forwarding-class fc7 scheduler s7
          set class-of-service schedulers s0 transmit-rate percent 49
          set class-of-service schedulers s0 buffer-size percent 20
          set class-of-service schedulers s0 priority low
          set class-of-service schedulers s0 drop-profile-map loss-priority any protocol any drop-profile dp0
          set class-of-service schedulers s0 explicit-congestion-notification
          set class-of-service schedulers s0 buffer-dynamic-threshold 9
          set class-of-service schedulers s1 transmit-rate percent 2
          set class-of-service schedulers s1 buffer-size percent 20
          set class-of-service schedulers s1 priority low
          set class-of-service schedulers s1 buffer-dynamic-threshold 7
          set class-of-service schedulers s2 buffer-size percent 0
          set class-of-service schedulers s3 buffer-size percent 0
          set class-of-service schedulers s4 buffer-size percent 0
          set class-of-service schedulers s5 transmit-rate percent 49
          set class-of-service schedulers s5 buffer-size percent 20
          set class-of-service schedulers s5 priority low
          set class-of-service schedulers s5 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s5 explicit-congestion-notification
          set class-of-service schedulers s5 buffer-dynamic-threshold 9
          set class-of-service schedulers s6 shaping-rate 16g
          set class-of-service schedulers s6 buffer-size percent 20
          set class-of-service schedulers s6 priority strict-high
          set class-of-service schedulers s6 buffer-dynamic-threshold 7
          set class-of-service schedulers s7 shaping-rate 8g
          set class-of-service schedulers s7 buffer-size percent 20
          set class-of-service schedulers s7 priority strict-high
          set class-of-service schedulers s7 buffer-dynamic-threshold 7
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term BLOCK_RFC1112 from destination-mac-address 01:00:5e:00:00:00/25
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term BLOCK_RFC1112 then discard
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term BLOCK_RFC2464 from destination-mac-address 33:33:00:00:00:00/16
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term BLOCK_RFC2464 then discard
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term ALLOW_ALL then accept
          set class-of-service shared-buffer ingress percent 100
          set class-of-service shared-buffer ingress buffer-partition lossless percent 0
          set class-of-service shared-buffer ingress buffer-partition lossless-headroom percent 0
          set class-of-service shared-buffer ingress buffer-partition lossy percent 100
          set class-of-service shared-buffer egress percent 100
          set class-of-service shared-buffer egress buffer-partition lossless percent 0
          set class-of-service shared-buffer egress buffer-partition lossy percent 100
          set class-of-service dedicated-buffer-profile p1 egress
      EOT
    }
  ]
}





resource "apstra_configlet" "leaf-QOS_compute_pod" {
  name = "leaf-QOS_compute_pod"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
          {% set cos_int = '' %}
          {% set access_int = '' %}
          {% for if_name, if_param in interface.items() %}
              {% if 'spine' in if_param['description'] %}
                 {% set cos_int = if_param['intfName'] %}
          set class-of-service interfaces {{cos_int}} scheduler-map sm1
          set class-of-service interfaces {{cos_int}} classifiers dscp dscp-classifier
          set class-of-service interfaces {{cos_int}} rewrite-rules dscp rw1
              {% endif %}
          {% endfor %}
          {% for if_name, if_param in interface.items() %}
              {% if 'sys001-001-001' in if_param['description'] %}
                 {% set access_int = if_param['intfName'] %}
          set interfaces {{access_int}} unit 0 family ethernet-switching filter input ALLOWED_FROM_HOST
          set interfaces {{access_int}} unit 0 family ethernet-switching storm-control profile1
          set class-of-service interfaces {{access_int}} scheduler-map sm1
          set class-of-service interfaces {{access_int}} unit 0 classifiers dscp dscp-classifier
          set class-of-service interfaces {{access_int}} unit 0 rewrite-rules dscp rw1
              {% endif %}
          {% endfor %}
          set forwarding-options storm-control-profiles profile1 all bandwidth-level 10000000
          set forwarding-options enhanced-hash-key ecmp-dlb flowlet inactivity-interval 50
          set forwarding-options enhanced-hash-key ecmp-dlb flowlet flowset-table-size 256
          set forwarding-options vxlan-tos-copy-filter
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc0 loss-priority low code-points 001010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 000111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 001111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 110111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111001
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111011
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111101
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 111111
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100100
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 100000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 010000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 101000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc1 loss-priority low code-points 011000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc5 loss-priority low code-points 001000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc5 loss-priority low code-points 011010
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc6 loss-priority low code-points 101110
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc6 loss-priority low code-points 111000
          set class-of-service classifiers dscp dscp-classifier forwarding-class fc7 loss-priority low code-points 110000
          set class-of-service drop-profiles dp0 interpolate fill-level 0
          set class-of-service drop-profiles dp0 interpolate fill-level 20
          set class-of-service drop-profiles dp0 interpolate drop-probability 0
          set class-of-service drop-profiles dp0 interpolate drop-probability 100
          set class-of-service drop-profiles dp1 interpolate fill-level 1
          set class-of-service drop-profiles dp1 interpolate fill-level 2
          set class-of-service drop-profiles dp1 interpolate drop-probability 0
          set class-of-service drop-profiles dp1 interpolate drop-probability 100
          set class-of-service dedicated-buffer-profile p1 egress
          set class-of-service forwarding-classes class fc0 queue-num 0
          set class-of-service forwarding-classes class fc1 queue-num 1
          set class-of-service forwarding-classes class fc2 queue-num 2
          set class-of-service forwarding-classes class fc3 queue-num 3
          set class-of-service forwarding-classes class fc4 queue-num 4
          set class-of-service forwarding-classes class fc5 queue-num 5
          set class-of-service forwarding-classes class fc6 queue-num 6
          set class-of-service forwarding-classes class fc7 queue-num 7
          set class-of-service forwarding-classes class mcast-fc queue-num 8
          set class-of-service congestion-notification-profile cnp output ieee-802.1 code-point 011 flow-control-queue 5
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc0 loss-priority low code-point af11
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc1 loss-priority low code-point be
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc5 loss-priority low code-point cs1
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc6 loss-priority low code-point ef
          set class-of-service rewrite-rules dscp rw1 forwarding-class fc7 loss-priority low code-point cs6
          set class-of-service scheduler-maps sm1 forwarding-class fc0 scheduler s0
          set class-of-service scheduler-maps sm1 forwarding-class fc1 scheduler s1
          set class-of-service scheduler-maps sm1 forwarding-class fc2 scheduler s2
          set class-of-service scheduler-maps sm1 forwarding-class fc3 scheduler s3
          set class-of-service scheduler-maps sm1 forwarding-class fc4 scheduler s4
          set class-of-service scheduler-maps sm1 forwarding-class fc5 scheduler s5
          set class-of-service scheduler-maps sm1 forwarding-class fc6 scheduler s6
          set class-of-service scheduler-maps sm1 forwarding-class fc7 scheduler s7
          set class-of-service schedulers s0 transmit-rate percent 49
          set class-of-service schedulers s0 buffer-size percent 20
          set class-of-service schedulers s0 priority low
          set class-of-service schedulers s0 drop-profile-map loss-priority any protocol any drop-profile dp0
          set class-of-service schedulers s0 explicit-congestion-notification
          set class-of-service schedulers s0 buffer-dynamic-threshold 9
          set class-of-service schedulers s1 transmit-rate percent 2
          set class-of-service schedulers s1 buffer-size percent 20
          set class-of-service schedulers s1 priority low
          set class-of-service schedulers s1 buffer-dynamic-threshold 7
          set class-of-service schedulers s2 buffer-size percent 0
          set class-of-service schedulers s3 buffer-size percent 0
          set class-of-service schedulers s4 buffer-size percent 0
          set class-of-service schedulers s5 transmit-rate percent 49
          set class-of-service schedulers s5 buffer-size percent 20
          set class-of-service schedulers s5 priority low
          set class-of-service schedulers s5 drop-profile-map loss-priority any protocol any drop-profile dp1
          set class-of-service schedulers s5 explicit-congestion-notification
          set class-of-service schedulers s5 buffer-dynamic-threshold 9
          set class-of-service schedulers s6 shaping-rate 16g
          set class-of-service schedulers s6 buffer-size percent 20
          set class-of-service schedulers s6 priority strict-high
          set class-of-service schedulers s6 buffer-dynamic-threshold 7
          set class-of-service schedulers s7 shaping-rate 8g
          set class-of-service schedulers s7 buffer-size percent 20
          set class-of-service schedulers s7 priority strict-high
          set class-of-service schedulers s7 buffer-dynamic-threshold 7
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term BLOCK_RFC1112 from destination-mac-address 01:00:5e:00:00:00/25
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term BLOCK_RFC1112 then discard
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term BLOCK_RFC2464 from destination-mac-address 33:33:00:00:00:00/16
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term BLOCK_RFC2464 then discard
          set firewall family ethernet-switching filter ALLOWED_FROM_HOST term ALLOW_ALL then accept
          set class-of-service shared-buffer ingress percent 100
          set class-of-service shared-buffer ingress buffer-partition lossless percent 0
          set class-of-service shared-buffer ingress buffer-partition lossless-headroom percent 0
          set class-of-service shared-buffer ingress buffer-partition lossy percent 100
          set class-of-service shared-buffer egress percent 100
          set class-of-service shared-buffer egress buffer-partition lossless percent 0
          set class-of-service shared-buffer egress buffer-partition lossy percent 90
          set class-of-service shared-buffer egress buffer-partition multicast percent 10
          set class-of-service dedicated-buffer-profile p1 egress
      EOT
    }
  ]
}


resource "apstra_configlet" "oism_borderleaf1_static" {
  name = "oism_borderleaf1_static"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
          set protocols igmp interface all
          set forwarding-options multicast-replication evpn irb enhanced-oism
          set routing-instances evpn-1 protocols igmp-snooping vlan all
          set routing-instances evpn-1 multicast-snooping-options oism conserve-mcast-routes-in-pfe
          set routing-instances blue protocols evpn oism supplemental-bridge-domain-irb irb.var.sbd_vlan
          set routing-instances blue protocols evpn oism pim-evpn-gateway
          set routing-instances blue protocols pim rp static address 100.100.100.100
          set routing-instances blue protocols pim interface irb.1400 distributed-dr
          set routing-instances blue protocols pim interface irb.1401 distributed-dr
          set routing-instances blue protocols pim interface irb.var.sbd_vlan
          set routing-instances blue protocols pim interface blue_lo0
          set routing-instances blue protocols pim interface var.borderleaf1_pim_gw_int
          set routing-instances blue protocols ospf area 0 interface blue_lo0
          set routing-instances blue protocols ospf area 0 interface irb.var.sbd_vlan
          set routing-instances blue protocols ospf area 0 interface all passive
          set routing-instances blue protocols ospf area 0 interface var.borderleaf1_pim_gw_int
      EOT
    }
  ]
}



resource "apstra_configlet" "oism_borderleaf2_static" {
  name = "oism_borderleaf2_static"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
          set protocols igmp interface all
          set forwarding-options multicast-replication evpn irb enhanced-oism
          set routing-instances evpn-1 protocols igmp-snooping vlan all
          set routing-instances evpn-1 multicast-snooping-options oism conserve-mcast-routes-in-pfe
          set routing-instances blue protocols evpn oism supplemental-bridge-domain-irb irb.var.sbd_vlan
          set routing-instances blue protocols evpn oism pim-evpn-gateway
          set routing-instances blue protocols pim rp static address 100.100.100.100
          set routing-instances blue protocols pim interface irb.1400 distributed-dr
          set routing-instances blue protocols pim interface irb.1401 distributed-dr
          set routing-instances blue protocols pim interface irb.var.sbd_vlan
          set routing-instances blue protocols pim interface blue_lo0
          set routing-instances blue protocols pim interface var.borderleaf2_pim_gw_int
          set routing-instances blue protocols ospf area 0 interface blue_lo0
          set routing-instances blue protocols ospf area 0 interface irb.var.sbd_vlan
          set routing-instances blue protocols ospf area 0 interface all passive
          set routing-instances blue protocols ospf area 0 interface var.borderleaf2_pim_gw_int
      EOT
    }
  ]
}


resource "apstra_configlet" "oism_storage_leaf_static" {
  name = "oism_storage_leaf_static"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
          set protocols igmp interface all
          set interfaces irb mtu 9216
          set forwarding-options multicast-replication evpn irb enhanced-oism
          set routing-instances evpn-1 protocols igmp-snooping vlan all proxy
          set routing-instances evpn-1 multicast-snooping-options oism conserve-mcast-routes-in-pfe
          set routing-instances blue protocols evpn oism supplemental-bridge-domain-irb irb.var.sbd_vlan
          set routing-instances blue protocols pim passive
          set routing-instances blue protocols pim interface all
          set routing-instances blue protocols pim interface irb.var.sbd_vlan accept-remote-source
          set routing-instances blue protocols ospf area 0 interface blue_lo0
          set routing-instances blue protocols ospf area 0 interface irb.var.sbd_vlan
          set routing-instances blue protocols ospf area 0 interface all passive
      EOT
    }
  ]
}


resource "apstra_configlet" "oism_compute_leaf_static" {
  name = "oism_compute_leaf_static"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_set_delete"
      template_text = <<-EOT
          set protocols igmp interface all
          set interfaces irb mtu 9216
          set forwarding-options multicast-replication evpn irb enhanced-oism
          set routing-instances evpn-1 protocols igmp-snooping vlan all proxy
          set routing-instances blue protocols evpn oism supplemental-bridge-domain-irb irb.var.sbd_vlan
          set routing-instances blue protocols pim passive
          set routing-instances blue protocols pim interface all
          set routing-instances blue protocols pim interface irb.var.sbd_vlan accept-remote-source
          set routing-instances blue protocols ospf area 0 interface blue_lo0
          set routing-instances blue protocols ospf area 0 interface irb.var.sbd_vlan
          set routing-instances blue protocols ospf area 0 interface all passive
      EOT
    }
  ]
}


#import configlet from catalog
resource "apstra_datacenter_configlet" "spine-QOS-superspine_storage_pod" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.spine-QOS-superspine_storage_pod.id
  #condition = local.s_ss_st_condition
  condition = "hostname in [\"sspine001-1\",\"sspine001-2\",\"spine003-001-1\",\"spine003-001-2\"]"
  name = "spine-QOS-superspine_storage_pod"
}

resource "apstra_datacenter_configlet" "spine-QOS-compute_svc_pods" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.spine-QOS-compute_svc_pods.id
  #condition = local.sp_cp_sv_condition
  condition = "hostname in [\"spine001-001-1\",\"spine002-001-2\",\"spine001-001-2\",\"spine002-001-1\"]"
  name = "spine-QOS-compute_svc_pods"
}

resource "apstra_datacenter_configlet" "leaf-QOS_storage_pod" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.leaf-QOS_storage_pod.id
  #condition = local.lf_st_condition
  condition = "hostname in [\"leaf003-001-1\",\"leaf003-001-2\"]"
  name = "leaf-QOS_storage_pod"
}

resource "apstra_datacenter_configlet" "leaf-QOS_compute_pod" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.leaf-QOS_compute_pod.id
  #condition = local.lf_cp_condition
  condition = "hostname in [\"leaf001-001-1\",\"leaf001-001-2\"]"
  name = "leaf-QOS_compute_pod"
}

resource "apstra_datacenter_configlet" "oism_borderleaf1_static" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.oism_borderleaf1_static.id
  #condition = local.bl1_condition
  condition = "hostname in [\"leaf002-001-1\"]"
  name = "oism_borderleaf1_static"
}

resource "apstra_datacenter_configlet" "oism_borderleaf2_static" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.oism_borderleaf2_static.id
  #condition = local.bl2_condition
  condition = "hostname in [\"leaf002-001-2\"]" 
  name = "oism_borderleaf2_static"
}

resource "apstra_datacenter_configlet" "oism_storage_leaf_static" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.oism_storage_leaf_static.id
  #condition = local.lf_st_condition
  condition = "hostname in [\"leaf003-001-1\",\"leaf003-001-2\"]"
  name = "oism_storage_leaf_static"
}

resource "apstra_datacenter_configlet" "oism_compute_leaf_static" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.oism_compute_leaf_static.id
  #condition = local.lf_cp_condition
  condition = "hostname in [\"leaf001-001-1\",\"leaf001-001-2\"]"
  name = "oism_compute_leaf_static"
}

resource "apstra_datacenter_configlet" "evo-host-profile" {
 blueprint_id = apstra_datacenter_blueprint.DC4-5Stage.id
  catalog_configlet_id = apstra_configlet.evohost.id
  #condition = local.evo_leaf_condition
  condition = "hostname in [\"leaf002-001-2\",\"leaf002-001-1\",\"leaf003-001-2\",\"leaf003-001-1\"]"
  name = "evo-host-profile"
}

