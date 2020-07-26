

#pluralize-ptbr 
# https://github.com/matheuslugon/pluralize-ptbr
# https://github.com/hrbrmstr/pluralize

#São fornecidas ferramentas para criar formas plurais, 
#singulares e regulares de palavras em português, 
#além de ferramentas para aumentar as regras internas 
#para atender às necessidades especializadas. 
#A funcionalidade principal é baseada em uma biblioteca JavaScript,
library(pluralize)

singularize(c("boats", "houses", "cats", "rivers"))


add_plural_rule("gex", "gexii")

pluralize('regex')
## [1] "regexii"

singularize('singles')
## [1] "single"

add_singular_rule("singles", "singular")

singularize('singles')
## [1] "singular"

pluralize("irregular")
pluralize(c("woman", "man", "child", "tooth", "foot", "person", "leaf"))
singularize(c("woman", "man", "child", "tooth", "foot", "person", "leaf"))
add_irregular_rule("irregular", "regular")

pluralize("irregular")
pluralize("paper")
add_uncountable_rule("paper")
pluralize("paper")

?singularize
pluralize <- function(x, n=2, prepend=FALSE) {
  unname(sapply(x, function(y) {
    .pkgenv$ct$call("pluralize", y, n, prepend)
  }))
}

singularize <- function(x) {
  unname(sapply(x, function(y) { .pkgenv$ct$call("pluralize", y, 1)}))
}