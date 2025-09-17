using Benner.Corporativo.WebServices.Layouts.Financeiro;
using System.Collections.Generic;

namespace Benner.Corporativo.WebServices.Layouts.Financeiro.Api
{
    public interface IRequestNegociacaoParcelasLayout
    {
        string AuthenticationTokenId { get; set; }
        string CnpjEmpresa { get; set; }
        string CnpjFilial { get; set; }
        string CodigoConfiguracao { get; set; }
        string CpfCnpjPessoa { get; set; }        
        string NumeroDocumento { get; set; }
        string NumeroParcela { get; set; }
        List<NovasParcelasRenegociacaoLayout> NovasParcelas { get; set; }
    }
}