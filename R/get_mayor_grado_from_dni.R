#' Obtener el mayor grado desde un DNI
#'
#' @param n_dni character. Un número de DNI otorgado por RENIEC Perú.
#'
#' @return character. El mayor grado académico obtenido por la persona especificada.
#' @export
#'
#' @examples
#' get_mayor_grado_from_dni(n_dni = "08192557")
get_mayor_grado_from_dni <- function(n_dni) {
    get_info_from_dni(n_dni = n_dni, tipo_info = "TIPO_GRADO") |>
        get_mayor_grado()
}

get_mayor_grado <- function(grado) {

    factor(grado, levels = c("B", "T", "M", "D"), ordered = TRUE) |>
        max(na.rm = TRUE) |>
        as.character() |>
        # Get label
        switch(
            "D" = "Doctor",
            "M" = "Magister",
            "T" = "Título profesional",
            "B" = "Bachiller o egresado"
        )
}
