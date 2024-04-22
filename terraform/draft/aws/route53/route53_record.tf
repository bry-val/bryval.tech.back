resource "aws_route53_record" "tfer--Z0539360HO2D3498EEKG_bryval-002E-tech-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "d36dx4e6064lr6.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }

  multivalue_answer_routing_policy = "false"
  name                             = "bryval.tech"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z0539360HO2D3498EEKG_bryval-002E-tech.zone_id}"
}

resource "aws_route53_record" "tfer--Z0539360HO2D3498EEKG_bryval-002E-tech-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bryval.tech"
  records                          = ["ns-1766.awsdns-28.co.uk.", "ns-487.awsdns-60.com.", "ns-1128.awsdns-13.org.", "ns-706.awsdns-24.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z0539360HO2D3498EEKG_bryval-002E-tech.zone_id}"
}

resource "aws_route53_record" "tfer--Z0539360HO2D3498EEKG_bryval-002E-tech-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bryval.tech"
  records                          = ["ns-487.awsdns-60.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z0539360HO2D3498EEKG_bryval-002E-tech.zone_id}"
}

resource "aws_route53_record" "tfer--Z0539360HO2D3498EEKG_www-002E-bryval-002E-tech-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "dgka2t9w0hy18.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }

  multivalue_answer_routing_policy = "false"
  name                             = "www.bryval.tech"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z0539360HO2D3498EEKG_bryval-002E-tech.zone_id}"
}
