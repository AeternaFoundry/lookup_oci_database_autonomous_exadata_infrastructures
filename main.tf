data "oci_database_autonomous_exadata_infrastructures" "database_autonomous_exadata_infrastructures_lookup" {
  for_each = var.database_autonomous_exadata_infrastructures_lookup

  compartment_id      = each.value.compartment_id
  availability_domain = each.value.availability_domain
  display_name        = each.value.display_name
  state               = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

