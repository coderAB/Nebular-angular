resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_cosmosdb_account" "db" {
  name                = "${var.name}${random_integer.ri.id}"
  location            = var.cosmosdb_location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = var.kind

  enable_automatic_failover = true

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "centralindia"
    failover_priority = 1
  }

  geo_location {
    location          = var.cosmosdb_location
    failover_priority = 0
  }
}