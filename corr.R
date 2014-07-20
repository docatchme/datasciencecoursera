corr <- function(directory, threshold = 0) {
    ## Get the list of files
    fileList <- list.files(directory)
    vCorr    <- numeric(0)
    
    ## Check number of complete observations using the 
    ## user defined function complete()
    completeObs <- complete(directory, 1:length(fileList))
    subsetObs   <- completeObs[completeObs$nobs > threshold,]
    
    if (nrow(subsetObs) > 0) {
    
        for (file in 1:nrow(subsetObs)) {
                valueMatrix   <- read.csv(paste(directory,"/",sprintf("%03d", subsetObs[file,1]), ".csv", sep=''))
                completeMatrix <- valueMatrix[!is.na(valueMatrix$sulfate) & !is.na(valueMatrix$nitrate),]
                vCorr <- c(vCorr, cor(completeMatrix[,2], completeMatrix[,3]))
        }
    }
    vCorr
}