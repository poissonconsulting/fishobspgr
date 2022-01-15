test_that("observation collection properties works", {
  collection_id <- "bcfishobs.fiss_fish_obsrvtn_events_sp"

  properties <- fop_collection_observation_properties(collection_id)
  expect_s3_class(properties, "tbl_df")
})

test_that("passage collection properties works", {
  collection_id <- "bcfishpass.barriers_falls"

  properties <- fop_collection_passage_properties(collection_id)
  expect_s3_class(properties, "tbl_df")
})

test_that("collection_properties haven't changed for observation events", {
  properties <- fop_collection_observation_properties("bcfishobs.fiss_fish_obsrvtn_events_sp")
  expect_snapshot_data(properties, "properties")
})
