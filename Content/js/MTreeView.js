export default class MTreeView {

    TraduzFuncaoTitulo(funcao, titulo) {
        var arr = funcao.split('|');
        var self = this;
        arr.forEach(function (str) {
            titulo = self.Traduzir(str, titulo);
        });
        return titulo;
    }

    Traduzir(comando, titulo) {
        var comandoArr = comando.split('=');
        switch (comandoArr[0]) {
            case 'SUBSTR':
              if(comandoArr.length != 2) throw new Error("Falta informar os parametros. Ex: SUBSTR=1,2");
              var subArr = comandoArr[1].split(',');
              return titulo.substring(subArr[0], subArr[1]);
            default:
              console.log("Comando sem implementação.");
              return titulo;
        }
    }
}