test_that("fop_collections_observation works", {
  collections <- fop_collections_observation()
  expect_s3_class(collections, "tbl_df")
  expect_identical(names(collections), c("collection_id", "description", "extent", "links"))
})

test_that("fop_collections_passage works", {
  collections <- fop_collections_passage()
  expect_s3_class(collections, "tbl_df")
  expect_identical(names(collections), c("collection_id", "description", "extent", "links"))
})

test_that("fop_collections_observation collection_id values haven't changed", {
  collections_observation <- fop_collections_observation()
  expect_snapshot_data(collections_observation["collection_id"], "collections_observation")
})

test_that("fop_collections_passage collection_id values haven't changed", {
  collections_passage <- fop_collections_passage()
  expect_snapshot_data(collections_passage["collection_id"], "collections_passage")
})
