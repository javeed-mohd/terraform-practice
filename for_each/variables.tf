# Map
/* variable "instances" {
  type        = map # Key=Value pairs
  default     = {
    mongodb   = "t3.micro" # Here value can be mongodb or anything as per our requirement
    mysql     = "t3.small" # It takes huge memory and shipping component also consumes huge memory...
    user      = "t3.micro"
    cart      = "t3.micro"
    shipping  = "t3.small"
  }
} */

# Variable for ec2_instance
# It should be converted to set
variable "instances" {
  type        = list
  default     = ["mongodb", "catalogue"]
}

# Variable for R53 records (Zone_id and domain_name)
variable "zone_id" {
  default      = "Z0883755364LI3FEBC65Q" 
}

variable "domain_name" {
  default      = "devopsdaws.online"
}