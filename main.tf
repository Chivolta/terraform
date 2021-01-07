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

resource kibana_object "test" {
  name 				= "test"
  data				= file("index-pattern.json")
  deep_reference	= "true"
  space = "terraform-test"
  export_objects {
	  id = "logstash-log-*"
	  type = "index-pattern"
  }
}