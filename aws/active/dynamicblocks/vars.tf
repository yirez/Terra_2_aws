variable "sec_group_ports" {
  default = ["8006","8007","8008","8009","8010"]
  description = "list of allowed ports for our sec group"
  type = list
}
