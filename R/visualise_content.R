#' Deploy the lecture slides in HTML format
#'
#' @param lecture character object indicating which lecture to visualise:
#' \itemize{
#'   \item{'Lecture1': }{Functions and parallel computation}
#'   \item{'Lecture2': }{Advanced spatial and temporal statistics}
#'   \item{'Lecture3': }{Machine learning algorithms in R - I}
#'   \item{'Lecture4': }{Machine learning algorithms in R - II}
#'   \item{'Lecture5': }{Working with R Markdown and Leaflet}
#'}
#'
#' @return this function directs the user to the selected lecture.
#' @export
#'
#' @examples
render_lectures <- function(lecture){
  
  # Setting the directory
  dir <- .get_libpath("AGEPadvanced")
  dir <- file.path(dir, "doc")
  
  # Setting the lecture names
  lectures <- paste0("Lecture", 1:5)
  
  # Checking if the name corresponds to the existing lectures
  if(!lecture %in% lectures)
    stop("Please provide the proper name of the lecture: 
          'Lecture1' : Functions and parallel computation
          'Lecture2' : Advanced spatial and temporal statistics
          'Lecture3' : Machine learning algorithms in R - I
          'Lecture4' : Machine learning algorithms in R - II
          'Lecture5' : Working with R Markdown and Leaflet")
  
  if(lecture == "Lecture1"){
      browseURL(file.path(dir, "Lecture1_Functions_and_parallel_computation.html"))
  } else if (lecture == "Lecture2"){
    browseURL(file.path(dir, "Lecture2_Advanced_spatial_and_temporal_statistics.html"))
  } else if (lecture == "Lecture3"){
    browseURL(file.path(dir, "Lecture3_Machine_learning_algorithms_in_R_I.html"))
  } else if (lecture == "Lecture4"){
    browseURL(file.path(dir, "Lecture4_Machine_learning_algorithms_in_R_II.html"))
  } else if (lecture == "Lecture5"){
    browseURL(file.path(dir, "Lecture5_Working_with_R_Markdown_and_Leaflet.html"))
  } 
  
} # end render_lectures


#' Deploy the exercises in HTML format
#' 
#' @param exercise character object indicating which exercise to visualise:
#'   'Exercise1', 'Exercise2', or 'Exercise3'
#' @param solved logical argument. Should the solution be displayed? The default is FALSE
#' 
#' @return this function directs the user to the selected exercise.
#' @export
#' 
#' @examples
# render_exercises <- function(exercise, solved = FALSE){
#   
#   # Setting the directory
#   dir <-"./Rexercises"
#   
#   # Setting the lecture names
#   exercises <- paste0("Exercise", 1:3)
#   
#   # Checking if the name corresponds to the existing lectures
#   if(!exercise %in% exercises)
#     stop("Please provide the proper name of the exercise:
#           'Exercise1', 'Exercise2', or 'Exercise3'")
#   
#   # Checking if the parameter solved is logical
#   if(!is.logical(solved))
#     stop("The parameter 'solved' must be either TRUE or FALSE")
#   
#   # Extracting number
#   nbr <- substr(exercise, 9, 9)
#   
#   if(solved){
#     browseURL(file.path(dir, paste0("Exercise", nbr, "_solved.html")))
#   } else {
#     browseURL(file.path(dir, paste0("Exercise", nbr, ".html")))
#   } 
#   
# } # end render_exercises

# utils function that finds library of the packages
.get_libpath <- function(package){
  
  # Get library paths
  paths <- .libPaths()
  
  # iterative process to find package
  pos <- NA
  for(i in 1:length(paths)){
    
    pos[i] <- file.exists(file.path(paths[i], package))
    
  }
  
  # Checking libpaths that include the package
  final_path <- paths[which(pos == "TRUE")]
  
  # Checking that the package is there
  if(length(final_path) < 1)
    stop("The package ", package, " could not be found!")
  
  # retrieving library path
  final_path <- file.path(final_path[1], package)
  return(final_path)
  
}
