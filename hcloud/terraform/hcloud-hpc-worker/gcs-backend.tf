terraform {	
  backend "gcs" {	
    bucket = "automation-statefiles"	
    prefix = "hcloud-hpc-worker"	
  }	
} 