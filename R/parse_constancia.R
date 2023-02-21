#' Transformar constancia
#'
#' Convierte una constancia de formato JSON a un data.frame válido
#'
#' @param constancia character. Constancia de grados y títulos en formato JSON.
#'
#' @return Un data.frame que contiene la información de una o más constancias de grados y títulos
#' @importFrom rlang `%||%`
#' @export
#'
#' @examples
#' parse_constancia(get_constancia(n_dni="08192557"))
parse_constancia <- function(constancia) {
    listado_constancias <- constancia |>
        jsonlite::parse_json() |>
        lapply(list_elements_to_na_chr) |>
        lapply(data.frame)

     do.call(what = rbind, args = listado_constancias)
}

list_elements_to_na_chr <- function(some_list) {
    lapply(some_list, \(x) x %||% NA_character_)
}
