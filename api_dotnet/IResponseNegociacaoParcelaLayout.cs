using System.Net;
using Benner.Corporativo.WebServices.Layouts;

namespace Benner.Corporativo.WebServices.Layouts.Financeiro.Api
{
    public interface IResponseLayout
    {
        CodigosRetornoIntegracao CodigoRetorno { get; set; }
        string Mensagem { get; set; }
        HttpStatusCode statusCode { get; set; }
        string TokenId { get; set; }
    }
}