#
#
#
#
#
#
#
#
library(yaml)
library(here)



course_links <- function(file){
    data <- read_yaml(here("teaching", "courses", file))[[2]]
    out <- character(length(data))
    for(ii in seq_along(data)){
        out[ii] <- sprintf("[%s](syllabi/%s)", data[[ii]]$Sem, data[[ii]]$File)
    }
    cat(paste(out, collapse = "; "))
}


#
#
#
#
#
#
#
#
#
#
#
#
#| output: asis

course_links("pol306.yaml")

#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
