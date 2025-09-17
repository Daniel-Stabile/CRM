using Controllers.Crm;
using Models.Crm;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using Controllers.Models.Crm;

/// <summary>
/// Descrição resumida de CrmPessoaOportunidadesController
/// </summary>
namespace Controllers.Api
{
    [RoutePrefix("api/crm/oportunidades")]
    public class CrmPessoaOportunidadesController : ApiController
    {
        public CrmPessoaOportunidadesController()
        {

        }

        [HttpGet, Route("getServicos")]
        public IHttpActionResult GetServicos()
        {
            return Json(new Crm.CrmPessoaOportunidadesController().GetServicos());
        }

        [HttpPost, Route("getRecursos")]
        public IHttpActionResult GetRecursos(BuscaVerticalRequestModel vertical)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().GetRecursos(vertical));
        }

        [HttpPost, Route("getContratos")]
        public IHttpActionResult GetContratos(string handlePessoa)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().GetContratos(handlePessoa));
        }

        [HttpGet, Route("getUrlComentario")]
        public IHttpActionResult GetUrlComentario(string handleEscopo)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().GetUrlComentario(handleEscopo));
        }

        [HttpPost, Route("getRecursosContrato")]
        public IHttpActionResult GetRecursosContrato(string numeroContrato)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().GetRecursosContrato(numeroContrato));
        }

        [HttpPost, Route("getEscopoPersonalizado")]
        public IHttpActionResult getEscopoPersonalizado(BuscaOportunidadeProdutoRequestModel form)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().GetEscopoPersonalizado(form));
        }

        [HttpPost, Route("postResumoOportunidade")]
        public IHttpActionResult PostResumoOportunidade(BuscaOportunidadeProdutoRequestModel form)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().EmitirResumoOportunidade(form));
        }

        [HttpPost, Route("patchAtivarOportunidade")]
        public IHttpActionResult PatchAtivarOportunidade(BuscaOportunidadeProdutoRequestModel form)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().AtivarOportunidade(form));
        }

        [HttpPost, Route("postServico")]
        public IHttpActionResult PostServico(BindEscopo form)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().SalvarEscopo(form));
        }

        [HttpPost, Route("postCondicoesPgto")]
        public IHttpActionResult PostCondicoesPgto(CondicoesPagamentoOp form)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().SalvarCondicoesPagamento(form));
        }

        [HttpPost, Route("deleteItemEscopo")]
        public IHttpActionResult DeleteItemEscopo(DeleteItemEscopo form)
        {
            return Json(new Crm.CrmPessoaOportunidadesController().DeleteItemEscopo(form));
        }
    }
}
    