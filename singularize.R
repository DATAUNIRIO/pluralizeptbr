#Vejamos a flexão de singular para o plural de algumas frases:
  
#A  casa pegou fogo e ficou toda destruída.
#As casas pegaram fogo e ficaram todas destruídas.

#A viagem foi maravilhosa.
#As viagens foram maravilhosas.

#O aparador de grama queimou.
#Os aparadores de grama queimaram.

# https://mundoeducacao.uol.com.br/gramatica/singular-plural.htm
# https://www.normaculta.com.br/singular-e-plural/

# find something that ends with word
library(RVerbalExpressions)
rx() %>% 
  rx_find("ns") %>% 
  rx_end_of_line() %>% 
  print() %>% 
  grepl(c("abordagens", "modelagem", "homens","homem"))

#-----------------------------------------------
# IFELSE
#-----------------------------------------------
singular <- function(plural_word) {
  ifelse(grepl("(ns)$",plural_word)==TRUE,gsub("(ns)$","m",plural_word),plural_word)
}
singular(c("abordagens", "modelagem", "homens","homem"))

#-----------------------------------------------
# IF
#-----------------------------------------------
singular <- function(plural_word) {
  if(grepl("(ns)$",plural_word)==TRUE) {
    gsub("(ns)$","m",plural_word)
} else {
  print("Negative number")
  }
}
singular("abordagens")

#-----------------------------------------------
# CASE WHEN
#-----------------------------------------------
library(dplyr)
singular <- function(plural_word) {
  case_when(
    # EXCEÇÃO A REGRA
    grepl("(plânctons)$",plural_word)==TRUE ~ gsub("(plânctons)$","plâncton",plural_word),
    # REGRAS
    # Termina em "ns"
    grepl("(ns)$",plural_word)==TRUE ~ gsub("(ns)$","m",plural_word),
    # Termina em "es"
    grepl("(es)$",plural_word)==TRUE ~ gsub("(es)$","",plural_word),
    # Termina em "ãos"
    grepl("(ãos)$",plural_word)==TRUE ~ gsub("(ãos)$","ão",plural_word),
    # Termina em "ãos"
    grepl("(óis)$",plural_word)==TRUE ~ gsub("(óis)$","ói",plural_word),
    TRUE ~ as.character(plural_word)
    )
}

singular(c("herói", "heróis", "irmão", "irmãos", "plâncton", "plânctons"))
singular(c("hambúrguer", "hambúrgueres", "chafariz", "chafarizes", "colher", "colheres"))
singular(c("abordagens", "modelagem", "homens","homem"))






rx() %>% 
  rx_find("aos") %>% 
  rx_end_of_line() %>% 
  print() %>% 
  grepl("irmaos")
