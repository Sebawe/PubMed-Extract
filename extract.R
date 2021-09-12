#install.packages("scholar")
#install.packages("easyPubMed")
#install.packages("pubmedR")
#install.packages("writexl")

library(scholar)
library(easyPubMed)
library(pubmedR)
library(readxl)
library("writexl")

df <- read_excel("Path to output.xlsx")

# Start with an empty placeholder
storage <- ""
counter <- 0
for (i in 1:length(df$ID)) {
  # Extract the member's name
  name <- df$Member[i]
  # Strip the name from degrees (MD, PhD, ...)
  name <- strsplit(name, split=',')[[1]][1]
  ## Debugging
  #name <- df$Member[1]
  if(name == storage)
  {
    df$Pubs[i] <- Pubs
  }
  else
  {
    # Storing the name to save time
    storage <- name
    # Queing the Author's name
    print(name)
    # Fetch # of pubs
    Pubs <- pmQueryTotalCount(name, api_key = NULL)$total_count
    print(Pubs)
    # Storing it in the dataframe
    df$Pubs[i] <- Pubs
    counter <- counter + 1
    cat("ID: ", df$ID[i], fill = T)
    cat("No. ", counter, fill = T)
    
  }
}

write_xlsx(df, "Path to output.xlsx")

