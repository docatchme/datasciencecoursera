complete <- function(directory, id = 1:332) {
    df <- data.frame(id = integer(), nobs = integer())
    
    for (file in 1:length(id)){
        filename <- paste(directory,"/",sprintf("%03d", id[file]),".csv", sep='')
        valueMatrix   <- read.csv(filename)
        
        df[file, 1] <- id[file]
        df[file, 2] <- nrow(valueMatrix[!is.na(valueMatrix$sulfate) & !is.na(valueMatrix$nitrate),])
    }
    df
}