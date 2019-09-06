
mlrBCsubFun<-function(my_path, my_chosen_sample, my_normalization, my_BWE){
    
  path<<-my_path # super-assignment to be created/updated in the environment of the caller
  chosen_sample<<-my_chosen_sample
  normalization<<-my_normalization
  BWE<<-my_BWE
  
  
  if (!(normalization %in% c(0,1))){ 
    stop("incorrect normalization choice")
    }  
  
  dataset<<-read.csv(path, header=TRUE) #super-assignment to be created/updated in the environment of the caller
  
  
  if (chosen_sample<0 | chosen_sample>nrow(dataset)){
    stop("chosen sample out of bound")
    }
  
  source("mlrBCsub.R")

  return(ordered_subtypes)
  
  }
