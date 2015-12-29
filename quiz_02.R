SAMPLES_DIR = "../Samples/"
#TAU_PACKAGE = "tau"

cFiles = c("blogs", "news", "twitter")
cTexts = c("case of cheese", "case of pretzels", "case of beer", "case of soda", 
           "mean the world", "mean the universe", "mean the most", "mean the best", 
           "make me the saddest", "make me the happiest", "make me the smelliest", "make me the bluest")

cTexts = c("struggling but the crowd", "struggling but the defense", "struggling but the players", "struggling but the referees", 
           "at the beach", "at the mall", "at the movies", "at the grocery",
           "on my motorcycle", "on my phone", "on my horse", "on my way",
           "quite some time", "quite some years", "quite some weeks", "quite some thing")

cTexts = c("but the crowd", "but the defense", "but the players", "but the referees", 
	   "his little eyes", "his little toes", "his little fingers", "his little ears", 
           "during the bad", "during the hard", "during the sad", "during the worse",
           "must be asleep", "must be insensitive", "must be insane", "must be callous")

#to initial tests
#cTexts = c("third meetin", "lot of rationalization", "never did no wanderin", "xptow233", "also", "i have")

# data frame to count frequency of texts searching
dfCount = data.frame(cTexts)
colnames(dfCount)[1] <- "Search_Texts"
dfCount$Count <- 0

nTxt <- 0		# points to a line in data frame 'dfCount'
COUNT = 2		# points to the column in 'dfCount' that counts frequency of texts found

search_files <- function(f, str) 
{
  txtFile <- paste0(SAMPLES_DIR,f,".txt")
  print(paste("reading:",txtFile))
  arq <- readLines(txtFile)

  for (i in 1:length(arq) ) {
    df <- data.frame(text=arq, stringsAsFactors=F) 
  }
  
  nLines <- length(df$text)
  for (i in 1:nLines ) {
    nTxt <<- 0
    lapply(cTexts, function(str){ search_text(str,df$text[i]) })
  }
    
  remove(df)
}

search_text <- function(strSearch, str_in) {
  nTxt <<- nTxt + 1
  if(grepl(strSearch, str_in))
    dfCount[nTxt,COUNT] <<- dfCount[nTxt,COUNT] + 1
}

search_texts <- function(str) 
{
  lapply(cFiles, function(f) { search_files(f,str) })
  
  print(paste("Couting occurrences of:",str,"=",n))
}  

lapply(cFiles, function(f){ search_files(f) })
print(dfCount)
