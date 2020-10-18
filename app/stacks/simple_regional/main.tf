/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
  cluster_type = "simple-regional"
}

provider "google" {
  version = "~> 3.35.0"
  region  = var.region
}

locals {
  network_name = "gke-test-vpc"
  subnet_01 = "${local.network_name}-subnet-01"
}

module "vpc" {
  source = "terraform-google-modules/network/google"
  project_id   = var.project_id
  network_name = local.network_name

  subnets = [
    {
      subnet_name   = local.subnet_01
      subnet_ip     = "10.10.10.0/24"
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    (local.subnet_01) = [
      {
        range_name    = "${local.subnet_01}-pods"
        ip_cidr_range = "10.11.0.0/20"
      },
      {
        range_name    = "${local.subnet_01}-services"
        ip_cidr_range = "10.12.0.0/20"
      },
    ]
  }
}

module "gke" {
  source = "../../modules/gke"
  project_id             = var.project_id
  name                   = "${local.cluster_type}-cluster"
  regional               = true
  region                 = var.region
  network                = local.network_name
  subnetwork             = local.subnet_01
  ip_range_pods          = module.vpc.subnets_secondary_ranges[0][0].range_name
  ip_range_services      = module.vpc.subnets_secondary_ranges[0][1].range_name
  create_service_account = false
  skip_provisioners      = false
}

data "google_client_config" "default" {
}
