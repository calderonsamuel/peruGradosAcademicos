#' Obtener constancia de grados y títulos
#'
#' Obtener información sobre los grados y títulos registrados en SUNEDU Perú.
#' Debe proveerse o un número de DNI o los nombres completos de una persona.
#'
#' @param n_dni character. Un número de DNI otorgado por RENIEC Perú.
#' @param nombre character. Apellidos y Nombres de una persona natural.
#' @param timeout number. Cantidad en segundos para esperar a que se complete la solicitud
#'
#' @return character. Información sobre la persona buscada, en formato JSON.
#' @export
#'
#' @examples
#' get_constancia(n_dni = "08192557") # DNI de Superintendente
#' get_constancia(nombre = "ZEGARRA ROJAS OSWALDO DELFIN") # Nombre de Superintendente
get_constancia <- function(n_dni = NULL, nombre = NULL, timeout = 10L) {
    httr2::request("https://constancias.sunedu.gob.pe/consulta") |>
        httr2::req_body_form(
            doc=n_dni,
            nombre=nombre,
            opcion="PUB",
            # "_token"=token,
            icono="",
            # captcha=""
        ) |>
        httr2::req_retry(max_seconds = 15) |>
        httr2::req_timeout(seconds = timeout) |>
        httr2::req_perform() |>
        httr2::resp_body_string() |>
        jsonlite::parse_json()
}
