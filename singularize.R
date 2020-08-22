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
    # -r no singular para -res no plural
    grepl("(res)$",plural_word)==TRUE ~ gsub("(res)$","r",plural_word),
    #-z no singular para -zes no plural
    grepl("(zes)$",plural_word)==TRUE ~ gsub("(zes)$","z",plural_word),
    #-s no singular para -ses no plural
    grepl("(ses)$",plural_word)==TRUE ~ gsub("(ses)$","s",plural_word),    
    
    # Termina em "ãos"
    grepl("(ãos)$",plural_word)==TRUE ~ gsub("(ãos)$","ão",plural_word),
    # Termina em "ãos"
    grepl("(óis)$",plural_word)==TRUE ~ gsub("(óis)$","ói",plural_word),
    # Termina em 'al', 'el', 'ol', 'ul'
    grepl("(is)$",plural_word)==TRUE ~ gsub("(is)$","l",plural_word),
    # A principal regra de formação do plural indica que se deve acrescentar -s à palavra no singular:
    grepl("(s)$",plural_word)==TRUE ~ gsub("(s)$","",plural_word),
    TRUE ~ as.character(plural_word)
    )
}

  



# primeiro problema
singular(c("girassol", "girassóis","herói", "heróis"))
singular(c("português", "portugueses", "país", "países", "revés", "reveses", "freguês", "fregueses"))


singular(c("mulher", "mulheres", "hambúrguer", "hambúrgueres", "açúcar", "açúcares", "mar", "mares", "bar", "bares"))
singular(c("raiz", "raízes", "gravidez", "gravidezes", "avestruz", "avestruzes", "rapaz", "rapazes"))
singular(c("girassol", "girassóis", "vogal", "vogais", "azul", "azuis"))
singular(c("herói", "heróis", "irmão", "irmãos", "plâncton", "plânctons"))
singular(c("hambúrguer", "hambúrgueres", "chafariz", "chafarizes", "colher", "colheres"))
singular(c("abordagens", "modelagem", "homens","homem"))



#Os substantivos que terminam em 'il' são pluralizados de duas formas:
# a) Em palavras oxítonas terminadas em 'il':
c("anil", "anis", "juvenil", "juvenis")
#b) Em palavras paroxítonas terminadas em 'il':
c("inútil", "inúteis", "réptil", "répteis")


# Os substantivos terminados em 'ão' podem ser pluralizados de três formas:
#  a) Substituindo o 'ão' por 'es':
c("doação", "doações", "emoção", "emoções")
#b) Substituindo o 'ão' por 'ães':
c("alemão", "alemães", "pão", "pães")
# Substituindo o 'ão' por 'ãos':
c("cidadão", "cidadãos")

#Os substantivos terminados em consoante 'x' são invariáveis
#córtex - córtex




rx() %>% 
  rx_find("aos") %>% 
  rx_end_of_line() %>% 
  print() %>% 
  grepl("irmaos")
