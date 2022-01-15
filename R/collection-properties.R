fop_collection_properties <- function(collection_id, path) {
  pgfeatureserv::pgf_collection_properties(
    collection_id = collection_id,
    base_url = api_url(),
    path = path
  )
}

#' BC Fish Observation collection Properties
#'
#' Get information about a fish observation collection's column names.
#'
#' @inherit params
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' collection_id <- "bcfishobs.fiss_fish_obsrvtn_events_sp"
#' fop_collection_observation_properties(collection_id)
fop_collection_observation_properties <- function(collection_id) {
  fop_collection_properties(collection_id, path_obs())
}

#' BC Fish Passage collection Properties
#'
#' Get information about a fish passage collection's column names.
#'
#' @inherit params
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' collection_id <- "bcfishpass.barriers_falls"
#' fop_collection_passage_properties(collection_id)
fop_collection_passage_properties <- function(collection_id) {
  fop_collection_properties(collection_id, path_pass())
}
