terraform {
  required_providers {
    kibana = {
      source = "disaster37/kibana"
      version = "7.0.8"
    }
  }
}

provider "kibana" {
    url = "https://e2fea5e9ecea466581fbf4414fb5ab02.us-east-1.aws.found.io:9243"
    username  = var.username
    password = var.password
}

resource kibana_user_space "test" {
  name 				= "terraform-test"
  description 		= "test"
  initials			= "tt"
  color				= "#000000"
  disabled_features = []
}

resource kibana_object "dashboard" {
  name 				= "edf84fe0-e1a0-11e7-b6d5-4dc382ef7f5b"
  data				= file("kibana-dashboard.json")
  deep_reference	= "false"
  space = "terraform-test"
  export_objects {
	  id = "edf84fe0-e1a0-11e7-b6d5-4dc382ef7f5b"
	  type = "dashboard"
  }
}