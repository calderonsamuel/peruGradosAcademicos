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
    match.arg(tipo_info, tipo_info_list())
    constancia |>
        jsonlite::parse_json() |>
        lapply(getElement, tipo_info) |>
        unlist()
}


tipo_info_list <- function() {
    c("idSolicitud", "abreGyt", "codAbreGyt", "actoTip", "apemat",
      "apepat", "autoridad1", "autoridad2", "autoridad3", "cargo1",
      "cargo2", "cargo3", "coduniv", "universidad", "critRev", "diplFec",
      "diplFecDup", "diplNum", "diplTipEmi", "codDiplTipEmi", "docuNum",
      "docuTip", "codDocuTip", "egresFec", "escCarr", "escPost", "facNom",
      "fecFinAcredit", "fecFinModTitAcredit", "fecFinProg", "fecInicioAcredit",
      "fecInicioModTitAcredit", "fecInicioProg", "fecMatProg", "fecSolicitGradTit",
      "fecTrabGradTit", "gradTitu", "lGradTitu", "matriFec", "modSustentacion",
      "modalidad", "esRevalida", "nombre", "numCred", "procBach", "procGradoExt",
      "procPaisExt", "procRevGradoExt", "procRevPais", "procRevUniv",
      "procTituloPed", "procUnivExt", "progAcredit", "progEstu", "regFolio",
      "regLibro", "regMetadato", "regOficio", "regRegistro", "resoFec",
      "resoNum", "segEsp", "sexo", "tesis", "trabInvestOriginal", "actoFec",
      "apellidos", "bitDocEsp", "bitFtp", "bitNulo", "comodin", "consejoFec",
      "digiFecha", "digiUser", "diplFicha", "especialidad", "estado",
      "fecReg", "fecTrabajo", "fechaResolucionLesividad", "fechaResolucionNulidad",
      "flag", "flagOrigArchivo", "flagTipoPadron", "flgResolucionLesividad",
      "flgResolucionNulidad", "fotDipl", "idArchivoFtp", "idcarrera",
      "iddatos", "iduser", "imgDipl", "motReg", "nroResolucionLesividad",
      "nroResolucionNulidad", "numCredX", "obs", "persona", "procArchivo",
      "procFecha", "procPais", "progsec", "registro", "renoFecha",
      "renoUser", "rutArchivoFtp", "tdOficio", "tdOficioFec", "tdRtd",
      "uniResoNum", "urlTesis")
}
