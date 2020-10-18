# Terraspace Google GKE Cluster Example

This project shows how to use the [Kubernetes Engine Terraform registry module](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google) with [Terraspace](https://terraspace.cloud/).

* Thanks and credit goes to the author of this module: Aaron L.
* Most contributors are doing this on their own free time. Please support them. Contribute back and send them a pull request. Some may ask for donations. Donate to them. Some are consultants. Hire them.

## Setup

    git clone https://github.com/boltops-tools/terraspace-google-gke
    cd terraspace-google-gke
    bundle

## Deploy Cluster

Make sure the `GOOGLE_PROJECT` and `GOOGLE_REGION` env variables are set your google project. One easy way to set them:

    export GOOGLE_PROJECT=`gcloud config get-value project`
    export GOOGLE_REGION=`gcloud config get-value compute/region`

Then to deploy:

    terraspace up simple_regional

A gke cluster named `simple-regional-cluster` is created.

## Connecting to the Cluster

    $ gcloud container clusters get-credentials simple-regional-cluster --region $GOOGLE_REGION --project $GOOGLE_PROJECT
    $ kubectl get node
    NAME                                                  STATUS   ROLES    AGE     VERSION
    gke-simple-regional--default-node-poo-0f427ccf-frw4   Ready    <none>   3m30s   v1.17.9-gke.6300
    gke-simple-regional--default-node-poo-606f62d1-ns12   Ready    <none>   3m38s   v1.17.9-gke.6300
    gke-simple-regional--default-node-poo-e634aad1-zmww   Ready    <none>   3m42s   v1.17.9-gke.6300
    $

Google Docs: [Configuring cluster access for kubectl](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl)

## Create App

To create and deploy a Kubernetes app onto the cluster check out: [Kubes: Kubernetes Deployment Tool](https://kubes.guru/)

## Updating

To update the modules to the latest version from the Terraform registry.

    terraspace bundle update

## More Examples

    $ terraspace list
    app/stacks/deploy_service
    app/stacks/disable_client_cert
    app/stacks/node_pool
    app/stacks/node_pool_update_variant
    app/stacks/node_pool_update_variant_beta
    app/stacks/private_zonal_with_networking
    app/stacks/regional_private_node_pool_oauth_scopes
    app/stacks/safer_cluster
    app/stacks/safer_cluster_iap_bastion
    app/stacks/shared_vpc
    app/stacks/simple_regional
    app/stacks/simple_regional_beta
    app/stacks/simple_regional_private
    app/stacks/simple_regional_private_beta
    app/stacks/simple_regional_with_kubeconfig
    app/stacks/simple_regional_with_networking
    app/stacks/simple_zonal_private
    app/stacks/simple_zonal_with_acm
    app/stacks/simple_zonal_with_asm
    app/stacks/simple_zonal_with_hub
    app/stacks/stub_domains
    app/stacks/stub_domains_private
    app/stacks/stub_domains_upstream_nameservers
    app/stacks/upstream_nameservers
    app/stacks/workload_identity
    app/stacks/workload_metadata_config

## About

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

[Terraspace](https://terraspace.cloud/) and this project was built by [BoltOps](https://www.boltops.com). We also offer:

* [Paid Consulting Services](https://www.boltops.com/consulting)
* [BoltOps Pro: Infrastructure Code as a Service](https://www.boltops.com/pro)
