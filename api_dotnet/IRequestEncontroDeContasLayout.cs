using Benner.Corporativo.WebServices.Layouts.Financeiro;
using System.Collections.Generic;

namespace Benner.Corporativo.WebServices.Layouts.Financeiro.Api
{
    public interface IRequestEncontroDeContasLayout
    {
        
        string AuthenticationTokenId { get; set; }
        string CnpjEmpresa { get; set; }
        string CnpjFilial { get; set; }
        string CpfCnpjPessoa { get; set; }
        string DataBaixa { get; set; }
        List<ParcelaEncontroDeContasRequest> ParcelasCPA { get; set; }
        List<ParcelaEncontroDeContasRequest> ParcelasCRE { get; set; }
    }
}