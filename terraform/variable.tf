variable "project_id" {
  type        = string
  description = "The GCP Project ID where resources will be deployed."
}

variable "region" {
  type        = string
  description = "The target GCP region for VPC and GKE cluster."
  default     = "us-central1"
}

variable "network_name" {
  type        = string
  description = "Name of the VPC network."
  default     = "assessment-vpc"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "Whether the VPC network automatically creates subnetworks."
  default     = false
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnetwork."
  default     = "assessment-subnet"
}

variable "subnet_ip_cidr_range" {
  type        = string
  description = "IP CIDR range for the subnetwork."
  default     = "10.0.0.0/16"
}

variable "cluster_name" {
  type        = string
  description = "Name of the GKE cluster."
  default     = "assessment-gke-cluster"
}

variable "remove_default_node_pool" {
  type        = bool
  description = "Whether to remove the default GKE node pool."
  default     = false
}

variable "cluster_initial_node_count" {
  type        = number
  description = "Initial node count for the GKE cluster."
  default     = 1
}

variable "cluster_ipv4_cidr_block" {
  type        = string
  description = "IPv4 CIDR block for GKE cluster pods."
  default     = "10.11.0.0/21"
}

variable "services_ipv4_cidr_block" {
  type        = string
  description = "IPv4 CIDR block for GKE services."
  default     = "10.12.0.0/21"
}

variable "node_pool_name" {
  type        = string
  description = "Name of the GKE node pool."
  default     = "app-node-pool"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, staging, prod)."
  default     = "dev"
}

variable "node_machine_type" {
  type        = string
  description = "Machine type for the GKE node pool instances."
  default     = "e2-micro"
}

variable "node_count" {
  type        = number
  description = "Initial number of nodes per zone in the node pool."
  default     = 1
}

variable "node_oauth_scopes" {
  type        = list(string)
  description = "OAuth scopes granted to GKE node instances."
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "deletion_protection" {
  type        = bool
  description = "Whether to enable deletion protection for the GKE cluster."
  default     = false
}