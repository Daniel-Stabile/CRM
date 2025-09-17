using Controllers.Crm;
using Models.Crm;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

/// <summary>
/// Descrição resumida de CrmPessoaOportunidadesController
/// </summary>
namespace Controllers.Api
{
    [RoutePrefix("api/crm/IntegracaoRDStation")]
    public class IntegracaoRDStationPostController : ApiController
    {
        public IntegracaoRDStationPostController()
        {

        }

        [HttpPost]
        [Route("getToken")]
        public IHttpActionResult getToken([FromBody]ClientCredential cliente)
        {
            Token result = IntegracaoRDStationController.GetAccessToken(cliente); 
            return Ok(result);
        }
    }

    public class Token
    {
        [JsonProperty("access_token")]
        public string AccessToken { get; set; }

        [JsonProperty("expires_in")]
        public string ExpiresIn { get; set; }

        [JsonProperty("refresh_token")]
        public string RefreshToken { get; set; }
    }

    public class ClientCredential
    {
        [JsonProperty("client_id")]
        public string ClientId { get; set; }

        [JsonProperty("client_secret")]
        public string ClientSecret { get; set; }

        [JsonProperty("refresh_token")]
        public string RefreshToken { get; set; }
    }
}
    