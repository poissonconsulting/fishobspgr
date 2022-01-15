#' BC Fish Observation collection Properties
#'
#' Get information about a fish observation collection's column names.
#'
#' @inherit params
#' @return A tibble.
#' @family collections
#' @export
fop_collection_observation_properties <- function(collection_id) {
  base_url <- api_url()
  path <- path_obs()

  pgfeatureserv::pgf_collection_properties(
    collection_id = collection_id,
    base_url = base_url,
    path = path
  )
}

#' BC Fish Passage collection Properties
#'
#' Get information about a fish passage collection's column names.
#'
#' @inherit params
#' @return A tibble.
#' @family collections
#' @export
fop_collection_passage_properties <- function(collection_id) {
  base_url <- api_url()
  path <- path_pass()

  pgfeatureserv::pgf_collection_properties(
    collection_id = collection_id,
    base_url = base_url,
    path = path
  )
}
