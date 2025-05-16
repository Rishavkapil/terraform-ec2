
variable "ports" {
  type = list(number)
}
variable "instance_type" {
  type = string
}
variable "image_name" {
  type = string
}
variable "owner_name" {
  type = string
}
variable "root_volume_type" {
  type = string
}
variable "virtualization_type" {
  type = string
}