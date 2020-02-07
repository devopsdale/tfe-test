variable "starks" {
    description = "list of the Stark first names"
    default     = ["ned", "catelyn", "robb", "sansa", "arya", "bran", "rickon", "rickard", "lyanna"]
}
variable "lannisters" {
    description = "list of Lannister first names"
    default     = ["tywin", "joanna", "jaime", "cersei", "tyrion", "lancel", "tytos"]
}
resource "random_shuffle" "stark" {
    input = [
        for stark in var.starks:
        upper(stark)
    ]
}
resource "random_shuffle" "lannister" {
    input = [
        for lannister in var.lannisters:
        upper(lannister)
    ]
}
output "starks" {
    value = random_shuffle.stark.result
}
output "lannisters" {
    value = random_shuffle.lannister.result
}
