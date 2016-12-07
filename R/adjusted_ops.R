#' Adjusted OPS
#'
#' A regression based ops model
#' @param singles # of singles
#' @param doubles # of doubles
#' @param triples # of triples
#' @param hr # of home runs
#' @param bb # of walks (user can add ibb and hbp to walks if desired)
#' @param pa # of plate appearances
#' @param ab # of at bats
#' @param r # of runs 
#' @param ... options
#' @keywords baseball
#' @keywords ops
#' @export
#' @examples
#' adjusted_ops()

adjusted_ops = function(singles, doubles, triples, hr, bb, pa, ab, r, ...)
{
  on_base = (singles+doubles+triples+hr+bb)/pa 
  reg_slg = (singles + 2*doubles + 3*triples + 4*hr)/ab
  
  out = lm(r ~ singles+doubles+triples+hr)
  adj_slg = (out$coefficient[2]*singles + out$coefficients[3]*doubles +
    out$coefficients[4]*triples + out$coefficients[5]*hr)/ab
  
  adj_weights = c(out$coefficients[2], out$coefficients[3], out$coefficients[4],
                   out$coefficients[5])
  names(adj_weights) = c("1b", "2b", "3b", "4b")
  
  adj_ops = adj_slg + on_base
  reg_ops = reg_slg + on_base
  
  df = data.frame(r, adj_ops, reg_ops, adj_slg, reg_slg)
  cor_adj_ops = cor(adj_ops, r)
  cor_reg_ops = cor(reg_ops, r)
  
  output = list(df, cor_adj_ops, cor_reg_ops, adj_weights)
  names(output) = c("Table", "Correlation - runs vs adjusted ops", 
                    "Correlation - runs vs reg ops", "adjusted weights")
  
  return(output)
}

