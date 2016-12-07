#' Get Data
#'
#' Get Data
#' @param file name of data set
#' @keywords baseball
#' @keywords data
#' @export
#' @examples
#' baseball_data(MLB)

baseball_data = function(data_set)
{
  dat = data.frame(data_set)
  return(dat)
}

