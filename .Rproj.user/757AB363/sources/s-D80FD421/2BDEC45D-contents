#' BC Fish Observation collections
#'
#' Get information about the BC Fish Observation collections.
#'
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' fop_collections_observation()
fop_collections_observation <- function() {
  base_url <- api_url()

  df <- pgfeatureserv::pgf_collections(
    base_url = base_url,
    path = path_obs()
  )

  df$collection_id <- df$id
  df <- df[c("collection_id", "description", "extent", "links")]
  df
}

#' BC Fish Passage collections
#'
#' Get information about the BC Fish Passage collections.
#'
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' fop_collections_passage()
fop_collections_passage <- function() {
  base_url <- api_url()

  df <- pgfeatureserv::pgf_collections(
    base_url = base_url,
    path = path_pass()
  )

  df$collection_id <- df$id
  df <- df[c("collection_id", "description", "extent", "links")]
  df
}
