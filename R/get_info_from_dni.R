#' Obtener información desde grados y títulos
#'
#' Permite obtener algún tipo de información específica a partir de un DNI de RENIEC.
#'
#' @param n_dni character. Un número de DNI otorgado por RENIEC Perú.
#' @param tipo_info character. Nombre de elemento a obtener.
#'
#' @return character. Información obtenida. Longitud corresponde con registros encontrados.
#' @export
#'
#' @examples
#' get_info_from_dni(n_dni="08192557", tipo_info = "TIPO_GRADO")
get_info_from_dni <- function(n_dni, tipo_info) {
    get_constancia(n_dni = n_dni) |>
        get_info_constancia(tipo_info = tipo_info)
}

get_info_constancia <- function(constancia, tipo_info) {
    constancia |>
        jsonlite::parse_json() |>
        lapply(getElement, tipo_info) |>
        unlist()
}
