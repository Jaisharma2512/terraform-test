output "firewall_rules_created" {
  description = "Names of firewall rules created by Terraform"
  value = [for key, fw in google_compute_firewall.dynamic_fw : fw.name]
}