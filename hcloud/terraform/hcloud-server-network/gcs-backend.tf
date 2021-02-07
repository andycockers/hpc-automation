terraform {	
  backend "gcs" {	
    bucket = "automation-statefiles"	
    prefix = "hcloud-server-network"	
  }	
} 