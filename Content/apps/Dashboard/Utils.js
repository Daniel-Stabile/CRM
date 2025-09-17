export default {
    ColetaPendente: function (existeColetaPendente, dataColetaPendente) {
      if (existeColetaPendente) {
        var data = new Date(
          dataColetaPendente
        ).getTime();
        var dataLimite = new Date().setMinutes(new Date().getMinutes() - 20);
        return data >= dataLimite;
      }
      else 
        return false;
    },
    obterMensagemColeta: function (dashInfo) {
      var retorno = "";
      if (dashInfo.existeColeta) {
        retorno =
          "Útilma coleta realizada: " +
          moment(String(dashInfo.dataColeta)).format(
            "DD/MM/YYYY HH:mm:ss"
          );
        if (this.ColetaPendente(dashInfo.existeColetaPendente, dashInfo.dataColetaPendente))
          retorno += ". Estamos coletando as informações, aguarde.";
      }
      return retorno;
    },
    obterMensagemSemColeta: function (dashInfo, permiteColetar) {
      var retorno = "";
      if (!dashInfo.existeColeta) {
        retorno = "Sem coleta para exibir.";
        if (this.ColetaPendente(dashInfo.existeColetaPendente, dashInfo.dataColetaPendente))
          retorno += " Estamos coletando as informações, aguarde.";
        else if(permiteColetar){
          retorno += " Efetue nova coleta.";
        }
      }
      return retorno;
    },
    desabilitarPaginaDash(existeColeta) {
      if (existeColeta) return "";
      return {
        pointerEvents: "none",
        opacity: "0.3"
      };
    }
}