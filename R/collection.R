fop_query_collection <- function(path,
                                 collection_id,
                                 filter = NULL,
                                 limit = 10000,
                                 offset = 0,
                                 bbox = NULL,
                                 properties = NULL,
                                 transform = NULL,
                                 sortby = NULL,
                                 groupby = NULL) {

  base_url <- api_url()
  path <- path
  user <- gh_user()

  pgfeatureserv::pgf_collection_features(
    collection_id = collection_id,
    base_url = base_url,
    path = path,
    filter = filter,
    limit = limit,
    offset = offset,
    bbox = bbox,
    properties = properties,
    transform = transform,
    sortby = sortby,
    groupby = groupby,
    user = user
  )
}

#' Query BC Fish Observation Collection
#'
#' Query a collection from the BC Fish Observation API.
#'
#' @inherit params
#' @family collections
#' @export
#' @examples
#' collection_id <- "bcfishobs.fiss_fish_obsrvtn_events_sp"
#' filter <- list(species_code = "CO", watershed_group_code = "CLAY")
#' fop_query_collection_observation(collection_id, filter = filter)
fop_query_collection_observation <- function(collection_id,
                                             filter = NULL,
                                             limit = 10000,
                                             offset = 0,
                                             bbox = NULL,
                                             properties = NULL,
                                             transform = NULL,
                                             sortby = NULL,
                                             groupby = NULL) {


  path <- path_obs()

  fop_query_collection(
    path = path,
    collection_id = collection_id,
    filter = filter,
    limit = limit,
    offset = offset,
    bbox = bbox,
    properties = properties,
    transform = transform,
    sortby = sortby,
    groupby = groupby
  )
}

#' Query BC Fish Observation Collection
#'
#' Query a collection from the BC Fish Observation API.
#'
#' @inherit params
#' @family collections
#' @export
#' @examples
#' collection_id <- "bcfishpass.barriers_falls"
#' filter <- list(barrier_type = "FALLS")
#' fop_query_collection_passage(collection_id, filter = filter)
fop_query_collection_passage <- function(collection_id,
                                         filter = NULL,
                                         limit = 10000,
                                         offset = 0,
                                         bbox = NULL,
                                         properties = NULL,
                                         transform = NULL,
                                         sortby = NULL,
                                         groupby = NULL) {


  path <- path_pass()

  fop_query_collection(
    path = path,
    collection_id = collection_id,
    filter = filter,
    limit = limit,
    offset = offset,
    bbox = bbox,
    properties = properties,
    transform = transform,
    sortby = sortby,
    groupby = groupby
  )
}

