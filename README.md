# pluralizeptbr
 
São fornecidas ferramentas para criar formas plurais, 
singulares e regulares de palavras em português, 
além de ferramentas para aumentar as regras internas 
para atender às necessidades especializadas. 

A funcionalidade principal é baseada em uma biblioteca JavaScript.

As seguintes funções serão implementadas:

   add_irregular_rule: adicione uma regra personalizada para tornar "desregularização" uma palavra
   add_plural_rule: adicione uma regra personalizada para tornar uma palavra no plural
   add_singular_rule: adicione uma regra personalizada para tornar uma palavra singular
   add_uncountable_rule: crie uma palavra "incontável"
   is_plural: teste o estado plural de uma palavra
   pluralizar: pluralizar uma palavra
   singularizar: singularizar uma palavra



# How to write your own R package and publish it on CRAN
## link importante
https://www.mzes.uni-mannheim.de/socialsciencedatalab/article/r-package/

### Overview
    Why you should write a package
    Where to start
        Idea
        Name
    Set up your package with RStudio and GitHub
    Fill your package with life
        Add functions
        Write a help file
        Write DESCRIPTION
        Add internal data set
        Write the NEWS.md
        Write the vignette
    Check your package
        Write tests
        codecov
        Check whether it works on various operating systems with devtools and rhub
        Generate cran-comments.md file
        Continuous integration with Travis CI
        Checking for good practice I: goodpractice
        Checking for good practice II: inteRgrate
    Submit to CRAN
    Add-ons
        Create your own hexagon sticker
        Add badges
        Create your own manual
        Build your website for your package
    Further readings
