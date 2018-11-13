library(data.table)

library(tidyr)
library(magrittr)


setwd("C:/Users/L.GonzalezMorales/Documents/GitHub/PCBS/SDG-Matrix")

#===================================================================
# Read raw matrix by goal
#===================================================================


sdgMatrix08 <- as.data.table(read.table("Input/Goal 8 - Matrix.txt", 
                                       header = TRUE, 
                                       sep = "\t",
                                       quote = "\"" ,
                                       na.strings = "", 
                                       stringsAsFactors = FALSE,
                                       encoding = "UTF-8"))


#===================================================================
# Pivot matrix
#===================================================================


TEST <- sdgMatrix08 %>% 
  gather(key, value, c(Value,  Source, FN))

TEST2 <- TEST %>%
  unite(temp1, Period, key, sep = ".")

TEST3 <- TEST2[,! names(TEST2) %in% c( "Period")] %>%
  spread(temp1, value)



write.table(TEST3, 
            file = "Output/Goal 8 - Matrix - pivot.txt", 
            append = FALSE,
            quote = FALSE, 
            sep = "\t",
            eol = "\n", 
            na = "", 
            dec = ".", 
            row.names = FALSE,
            col.names = TRUE, 
            fileEncoding = "UTF-8")

