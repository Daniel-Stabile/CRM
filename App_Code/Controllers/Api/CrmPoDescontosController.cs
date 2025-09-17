using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using Controllers.Crm;
using Models.Crm;
using Controllers.Models.Crm;

namespace Controllers.Api
{
    /// <summary>
    /// Descrição resumida de CrmPoDescontosController
    /// </summary>
    [RoutePrefix("api/crm/oportunidades/descontos")]
    public class CrmPoDescontosController : ApiController
    {
        public CrmPoDescontosController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        [HttpPost, Route("acao-desconto")]
        public IHttpActionResult SaveItens(BindDesconto form)
        {
            Crm.CrmPoDescontosController ctr = new Crm.CrmPoDescontosController();

            string response = ctr.AcaoDesconto(form);

            return Json(response);

        }
    }
}

    