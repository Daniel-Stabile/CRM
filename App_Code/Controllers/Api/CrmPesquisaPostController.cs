using Controllers.Crm;
using Models.Crm;
using Newtonsoft.Json;
using SM.Crm.Definicoes.Comum.Qualificacao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

/// <summary>
/// Descrição resumida de CrmPesquisaPostController
/// </summary>
namespace Controllers.Api
{
    [RoutePrefix("api/crm/pesquisapost")]
    public class CrmPesquisaPostController : ApiController
    {
        public CrmPesquisaPostController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        [HttpPost]
        [Route("save-questionario1")]
        public IHttpActionResult SaveItens1([FromBody] CrmPesquisa post)
        {
            CrmPesquisaController ctr = new CrmPesquisaController();

            string response = ctr.SaveFromPost(post);

            return Json(response);

        }

        [HttpPost]
        [Route("qualifica-conta1")]
        public IHttpActionResult QualificaConta1([FromBody] CrmPesquisa post)
        {
            CrmPesquisaController ctr = new CrmPesquisaController();

            string response = ctr.ConcluiQuestionario(post);

            return Json(response);

        }

        [HttpPost]
        [Route("save-questionario2")]
        public IHttpActionResult SaveItens2([FromBody] CrmPesquisa post)
        {
            CrmPesquisa2Controller ctr = new CrmPesquisa2Controller();

            string response = ctr.SaveFromPost(post);

            return Json(response);

        }

        [HttpPost]
        [Route("qualifica-conta2")]
        public IHttpActionResult QualificaConta2([FromBody] CrmPesquisa post)
        {
            CrmPesquisa2Controller ctr = new CrmPesquisa2Controller();

            string response = ctr.ConcluiQuestionario(post);

            return Json(response);

        }
    }
}