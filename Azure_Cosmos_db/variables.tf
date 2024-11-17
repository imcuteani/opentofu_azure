variable "resource_group_name" {
  type        = string
  description = "The resource group name"
 

}

variable "location" {
  type        = string
  description = "The resource group location"
  
}

variable "subscription_id" {
  type        = string
  description = "The Subscription Id"
  
}

variable "tenant_id" {
  type        = string
  description = "The tenant Id"
  
}

variable "client_id" {
  type        = string
  description = "The client Id"
  
}

variable "client_secret" {
  type        = string
  description = "The client secret"
  
}

variable "cosmosdb_name" {
  type        = string
  description = "The Cosmos db name account"
  
}

variable "offer_type" {
  type        = string
  description = "The offer type of Cosmos db account"
  default     = "Standard"
}

variable "db_kind" {
  type        = string
  description = "the database kind"
  default     = "GlobalDocumentDB"
}

variable "automatic_failover_enabled" {
  type        = bool
  description = "The automatic failover enabled or not"
  default     = false
}

variable "minimal_tls_version" {
  type        = string
  description = "The minimal TLS version to be associated"
  default     = "Tls12"
}

variable "free_tier_enabled" {
  type        = bool
  description = "The free tier of the cosmos db account"
  default     = false
}

variable "analytical_storage_enabled" {
  type        = bool
  description = "The analytical storage to be associated with the cosmos db account"
  default     = false
}

variable "partition_merge_enabled" {
  type        = bool
  description = "The partition merge enablement capability"
  default     = false
}

variable "burst_capacity_enabled" {
  type        = bool
  description = "The burst capability enablement"
  default     = false
}

variable "public_network_access_enabled" {
  type        = bool
  description = "The public network access enablement"
  default     = false
}

variable "consistency_level" {
  type        = string
  description = "The consistency level of cosmos db"
  default     = "Session"
}

variable "total_throughput_limit" {
  type        = string
  description = "(Required) The total throughput limit imposed on this Cosmos DB account (RU/s)."
  default     = "400"
}

variable "backup_type" {
  type        = string
  description = "The backup type of Azure Cosmos db"
  default     = "Periodic"
}

variable "storage_redundancy" {
  type        = string
  description = "The storage redundancy type of the cosmos db account"
  default     = "Local"
}

variable "interval_in_minutes" {
  type        = string
  description = "(Optional) The interval in minutes between two backups"
  default     = "480"
}

variable "retention_in_hours" {
  type        = string
  description = "(Optional) The time in hours that each backup is retained"
  default     = "8"
}

variable "geo_location" {
  type        = string
  description = "(Required) Specifies a geo_location resource, used to define where data should be replicated with the failover_priority 0 specifying the primary location"
  
}

variable "failover_priority" {
  type        = string
  description = "The failover priority of the cosmos db geo_location"
  default     = "0"
}

variable "zone_redundant" {
  type        = bool
  description = "(Optional) Should zone redundancy be enabled for this region?"
  default     = false
}

variable "multiple_write_locations_enabled" {
  type        = bool
  description = "Enable multiple write locations for this Cosmos DB account"
  default     = false
}

variable "access_key_metadata_writes_enabled" {
  type        = bool
  description = " (Optional) Is write operations on metadata resources (databases, containers, throughput) via account keys enabled?"
  default     = true
}

variable "vnet_name" {
  type        = string
  description = "The VNet name"
 
}

variable "subnet_name" {
  type        = string
  description = "The subnet name"
 
}

variable "vnet_rg_name" {
  type        = string
  description = "The vnet rg name"
 
}




