variable "ami" {   
  description = "Value of the Amazon Machine Image"
  type        = string
  }

variable "instance_type" {   
  description = "Value of the Instance Type"
  type        = string
  }
  
variable "availability_zone_names"{
  description = "List of available regions"
  type        = list(string)
 }  
 
variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
}