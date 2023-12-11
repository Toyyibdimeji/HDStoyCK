

#' @title rowSumsDT
#'
#' @description Form row sums for numeric columns in a data.table
#'
#' @param dtb A `data.table`.
#' @param na.rm If `TRUE` removes NAs from rows before the sum. Else returns NA for rows that contain NAs.
#'
#' @return A numeric vector if `dtb` contains numeric columns. Else `NULL`.
#'
#' @examples
#' library(data.table)
#' library(HDStoyCK)
#' x <- matrix(fdeaths, ncol = 12, byrow = TRUE)
#' x <- data.table(x)
#' rowSumsDT(x)
#' @export
#' @importFrom data.table nafill
rowSumsDT <- function(dtb, na.rm = FALSE) {
  stopifnot("dtb needs to be a data.table." = inherits(dtb, "data.table"),
            "dtb dimensions need to be > 0" = (dim(dtb)[1] > 0 && dim(dtb)[2] > 0),
            "na.rm need to be TRUE or FALSE" = (na.rm == TRUE || na.rm == FALSE))

  if (na.rm) {

    dtb[, Reduce(`+`, nafill(.SD, "const", 0)), .SDcols = is.numeric]

  } else {

    dtb[, Reduce(`+`, .SD), .SDcols = is.numeric]

  }
}
