pollutantmean <- function(directory, pollutant, id = 1:332){
    
    observations <- numeric(0)
    
    for (file in 1:length(id)){
        filename <- paste(directory,"/",sprintf("%03d", id[file]),".csv", sep='')
        valueMatrix   <- read.csv(filename)
        pollutantVector  <- valueMatrix[pollutant]    
        observations <- c(observations, pollutantVector[!is.na(pollutantVector)])
    }
    
    mean(observations)
}