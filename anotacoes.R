acrescentar: {
  's'  : ['a', 'e', 'i', 'o', 'u', 'ã', 'ãe'],
  'es' : ['r', 'z', 'n', 'ás'],
  ''   : ['is', 'us', 'os']
},

#* Palavras que terminam em al|el|ol|ul|il|m
 substitui a terminação
  substituir: {
    'ais' : 'al',
    'eis' : 'el',
    'ois' : 'ol',
    'uis' : 'ul',
    'is'  : 'il',
    'ns'  : 'm',
    'eses': 'ês',
    'ões' : 'ão'
  },

# Plural das sete exceções
  # excecoes: {
  #   'males'    : 'mal',
  #   'cônsules' : 'cônsul',
  #   'méis' : 'mel',
  #   'féis' : 'fel',
  #   'cais' : 'cal'
  # },

#  * Palavras que não tem plural
  sem_plural: [
    'não'
  ],

  
  var regex_troca =  "^([a-zA-Zà-úÀ-Ú]*)(%s)$"
  for ( var regra in regras ) {
    switch ( regra ) {
      case 'acrescentar':
        for ( var adicao in regras[regra] ) {
          var busca = regex_troca.replace("%s", regras[regra][adicao].join("|"))
          , regex = new RegExp(busca, 'i');
          if ( regex.exec(palavra) !== null ) {
            plural = palavra + adicao;
      case 'substituir':
        for ( var substituicao in regras[regra] ) {
          var busca = regex_troca.replace("%s", regras[regra][substituicao])
          , regex = new RegExp(busca, 'i');
          if ( regex.exec(palavra) !== null ) {
#              * Se a palavra for paroxítona ou proparoxítona,
#            * troca-se 'il' por 'eis'
              if ( palavra.match(/([áéíóú])/) !== null && regex.exec(palavra)[2] == "il" ) {
                plural = palavra.replace("il", "eis");
              } else {
                var busca_sub = new RegExp(regex.exec(palavra)[2] + '$', 'i');
                plural = palavra.replace(busca_sub, substituicao);
      case 'excecoes':
        for ( var excecao in regras[regra] ) {
          if ( palavra == regras[regra][excecao] ) {
            plural = excecao;
      case 'sem_plural':
        regras[regra].forEach(function(r) {
          if (palavra === r) plural = palavra;
