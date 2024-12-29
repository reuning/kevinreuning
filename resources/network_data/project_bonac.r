
project_bonac <- function(mat){
  if(!inherits(mat, "matrix")){
    if(inherits(mat, "igraph")){
      mat <- igraph::as_incidence_matrix(mat)
    } else if(inherits(mat, "network")){
      mat <- network::as.sociomatrix(mat)
    } else {
      stop("Not a matrix, igraph or network object")
    }
  }

  bon_util <- function(x, y){

    
    a <- sum((x == y) & (y == 0))
    d <- sum((x == y) & (y == 1))

    b <- sum((x != y) & (y == 1))
    c <- sum((x != y) & (y == 0))

    if(a*d == b*c) {
      return(.5)
    } else {
      return( (a*d - sqrt(a*b*c*d))/(a*d - b*c))
    }
  }

  scores <- combn(1:nrow(mat), 2, 
    function(x) {
      bon_util(mat[x[1],], mat[x[2],])
    }
  )

  out_matrix <- matrix(NA, nrow=nrow(mat), ncol=nrow(mat))

  out_matrix[lower.tri(out_matrix)] <- scores
  out_matrix[rowSums(mat) == 0, ] <- 0
  out_matrix[upper.tri(out_matrix)] <- t(out_matrix)[upper.tri(out_matrix)]
  rownames(out_matrix) <- rownames(mat)
  colnames(out_matrix) <- rownames(mat)

  return(out_matrix*100)
}