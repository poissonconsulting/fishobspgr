test_that("observation collection works with default values ", {
  collection_id <- "bcfishobs.fiss_fish_obsrvtn_events_sp"

  x <- fop_query_collection_observation(
    collection_id,
    limit = 10
  )
  expect_s3_class(x, "sf")
  expect_s3_class(x, "tbl_df")
  expect_s3_class(x$geometry, "sfc_POINT")
  # expect_identical(sf::st_crs(x)$epsg, 4326L)
  # expect_identical(colnames(sf::st_coordinates(x)), c("X", "Y", "Z"))
})

test_that("passage collection works with default values ", {
  collection_id <- "bcfishpass.barriers_falls"

  x <- fop_query_collection_passage(
    collection_id,
    limit = 10
  )
  expect_s3_class(x, "sf")
  expect_s3_class(x, "tbl_df")
  expect_s3_class(x$geometry, "sfc_POINT")
  # expect_identical(sf::st_crs(x)$epsg, 4326L)
  # expect_identical(colnames(sf::st_coordinates(x)), c("X", "Y"))
})

# filter
test_that("collection observation filter works", {
  collection_id <- "bcfishobs.fiss_fish_obsrvtn_events_sp"
  filter <- list(species_code = "CO", watershed_group_code = "CLAY")

  x <- fop_query_collection_observation(
    collection_id,
    filter = filter
  )

  expect_s3_class(x, "sf")
  expect_true(all(x$species_code == "CO"))
  expect_true(all(x$watershed_group_code == "CLAY"))

  colnames <- c(
    "agency_id", "agency_name", "blue_line_key", "distance_to_stream",
    "downstream_route_measure", "fish_observation_point_id", "linear_feature_id",
    "localcode_ltree", "match_type", "observation_date", "source", "source_ref",
    "species_code", "species_id", "waterbody_key", "watershed_group_code",
    "wscode_ltree", "geometry"
  )

  expect_identical(
    colnames(x), colnames
  )
  expect_snapshot_data(x[setdiff(colnames, "geometry")], "co_clay")
})

# bbox
test_that("collection observation bounding box gets everything intersecting bounding box", {
  collection_id <- "bcfishobs.fiss_fish_obsrvtn_events_sp"

  bbox <- c(-126.3, 49.0, -126.0, 49.3)

  x <- fop_query_collection_observation(
    collection_id,
    bbox = bbox
  )
  expect_true(all(x$watershed_group_code == "CLAY"))
})

# properties
test_that("collection properties works", {
  collection_id <- "bcfishobs.fiss_fish_obsrvtn_events_sp"
  properties <- c("blue_line_key", "watershed_group_code")

  x <- fop_query_collection_observation(
    collection_id,
    properties = properties
  )

  expect_identical(colnames(x), c(properties, "geometry"))
})

test_that("informative error invalid collection", {
  expect_chk_error(
    fop_query_collection_observation("not_a_collection"),
    "API request failed \\[404\\]: Collection not found: not_a_collection"
  )
})

test_that("collection informative error invalid bbox", {
  collection_id <- "bcfishobs.fiss_fish_obsrvtn_events_sp"

  expect_chk_error(
    fop_query_collection_observation(
      collection_id,
      bbox = 1
    ),
    "API request failed \\[400\\]: Invalid value for parameter bbox: 1"
  )
})

test_that("collection informative error invalid bbox", {
  collection_id <- "bcfishobs.fiss_fish_obsrvtn_events_sp"
  expect_chk_error(fop_query_collection_observation(collection_id,
                                                    filter = c(1)
  ))
})
