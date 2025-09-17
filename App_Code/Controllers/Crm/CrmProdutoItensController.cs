using Benner.Tecnologia.Common;
using Models.Crm;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Descrição resumida de CrmProdutoItensController
/// </summary>
namespace Controllers.Crm
{
    public class CrmProdutoItensController : Controller
    {
        public CrmProdutoItensController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public ActionResult ProdutosDaVertical()
        {
            return PartialView();
        }

        [HttpGet]
        public ActionResult GetProdutoItemEscopo(int produtoItem,int oportunidade)
        {
            string response = GetListaEscopo(produtoItem, oportunidade);

            return Json(response, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public ActionResult SaveItens(string post)
        {
            //int teste = post.Itens.Count;

            return Json(post);
        }

        private string GetListaEscopo(int produtoItem, int oportunidade)
        {
			try
			{
				List<CrmProdutoItemEscopo> result = new List<CrmProdutoItemEscopo>();
				Criteria crit = new Criteria("A.ITEM = :ITEM");
				crit.Parameters.Add("ITEM", produtoItem);

				List<EntityBase> listEscopo = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PRODUTOITENSESCOPO"), crit);
				
				if(listEscopo.Count > 0)
				{
					foreach(EntityBase ent in listEscopo)
					{
						CrmProdutoItemEscopo item = new CrmProdutoItemEscopo();
						item.Item = ((EntityAssociation)ent.Fields["ITEM"]).Handle.Value;
						item.ItemNome = ((EntityAssociation)ent.Fields["ITEM"]).Instance.Fields["NOME"].ToString();
						item.Nome = ent.Fields["NOME"].ToString();
						item.HorasBase = Convert.ToDecimal(ent.Fields["HORAS"].ToString());
						item.HorasEditada = Convert.ToDecimal(ent.Fields["HORAS"].ToString());
						item.TipoRecurso = GetRecurso(((EntityAssociation)ent.Fields["TIPORECURSO"]).Handle.Value, oportunidade);

						result.Add(item);
					}
				}

				return JsonConvert.SerializeObject(result);
				
			}catch(Exception e)
			{
				return "Erro :" + e.Message;
			}
            
        }

        private CrmTiposRecursos GetRecurso(long? handleRecurso, int oportunidade)
        {
            CrmTiposRecursos rec = new CrmTiposRecursos();

            Criteria crit = new Criteria("A.TIPORECURSO = :TIPORECURSO");
            crit.Parameters.Add("TIPORECURSO", handleRecurso);

            EntityBase recurso = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_TIPOSRECURSOSFILIAIS"), crit);

            if (recurso != null)
            {
                rec.Handle                  = handleRecurso;
                rec.Recurso                 = ((EntityAssociation)recurso.Fields["TIPORECURSO"]).Instance.Fields["RECURSO"].ToString();
                rec.Servico                 = ((EntityAssociation)recurso.Fields["TIPORECURSO"]).Instance.Fields["SERVICO"].ToString();
                rec.ValorHora               = Convert.ToDecimal(recurso.Fields["VALORHORA"].ToString());
                rec.ValorHoraOportunidade   = Convert.ToDecimal(recurso.Fields["VALORHORA"].ToString());
            }

            Criteria critRecOportunidade = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.TIPORECURSO = :TIPORECURSO");
            critRecOportunidade.Parameters.Add("OPORTUNIDADE", oportunidade);
            critRecOportunidade.Parameters.Add("TIPORECURSO", handleRecurso);

            EntityBase recursoOportunidade = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESREC"), critRecOportunidade);

            if (recursoOportunidade != null)
                rec.ValorHoraOportunidade = Convert.ToDecimal(recursoOportunidade.Fields["VALORHORA"].ToString());

            return rec;

        }
    }
}