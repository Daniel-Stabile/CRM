using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Models.Crm;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Controllers.Api;
using System.Net.Http;
using System.Net.Http.Headers;

/// <summary>
/// Descrição resumida de IntegracaoRDStationController
/// </summary>
namespace Controllers.Crm
{
    public class IntegracaoRDStationController : Controller
    {
        public IntegracaoRDStationController()
        {
        }

        public ActionResult Pesquisa()
        {
            return PartialView();
        }

        public static Token GetAccessToken(ClientCredential credential)
        {
            return HttpService.GetToken(credential);
        }
    }

    public class HttpService
    {
        private static HttpClient GetHttpClient()
        {
            var httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            return httpClient;
        }

        public static Token GetToken(ClientCredential credential)
        {
            var httpClient = GetHttpClient();

            var response =
                httpClient.PostAsJsonAsync("https://api.rd.services/auth/token", credential).Result;

            if (!response.IsSuccessStatusCode)
            {
                //Logar erro
            }

            return JsonConvert.DeserializeObject<Token>(response.Content.ReadAsStringAsync().Result);
        }
    }
}