using Benner.OpenApi;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Metadata.Entities;
using DocumentFormat.OpenXml.Bibliography;
using Models.Crm;
using Models.Generico;
using Newtonsoft.Json;
//using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Controllers.Models.Crm;

/// <summary>
/// Descrição resumida de CrmNovidadesController
/// </summary>
namespace Controllers.Crm
{
    public class CrmNovidadesController : Controller
    {
        public CrmNovidadesController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public ActionResult Feed()
        {
            var result = new BSM.Tecnologia.Commom.Models.TResponseModel();
            var novidades = new List<CrmNovidade>();

            var limiteRegistrosPorPagina = 10;

            var registros = SM.Crm.Definicoes.Entidades.CrmNovidades.GetAll().ToList();
            registros = registros.OrderByDescending(x => x.Fixada).ThenByDescending(x => x.Data).ToList();

            result.PageIndex = 0;
            result.MorePages = registros.Count > limiteRegistrosPorPagina;

            //Recebendo dados da rota
            var DadosRota = this.RouteData.Values.ToList();

            foreach (var rota in DadosRota)
            {
                if (rota.Key == "LinkDefinition" && null != rota.Value)
                {
                    var linkPagNova = rota.Value as FormLinkDefinition;

                    if (null != linkPagNova.Parameters["PaginaAnterior"])
                        result.PageIndex = Convert.ToInt32(linkPagNova.Parameters["PaginaAnterior"].ToString()) < 0 ? 0 : Convert.ToInt32(linkPagNova.Parameters["PaginaAnterior"].ToString());
                    else if (null != linkPagNova.Parameters["ProximaPagina"])
                        result.PageIndex = Convert.ToInt32(linkPagNova.Parameters["ProximaPagina"].ToString());
                    break;
                }
            }

            var registrosDaPagina = registros.Skip(result.PageIndex * limiteRegistrosPorPagina).Take(10).ToList();

            if(result.PageIndex == 0)
            {
                result.BtnAnterior = "disabled";
                result.BtnProximo = "enabled";
            }
            else
            {
                result.BtnAnterior = "enabled";
                
                if(registros.Skip(result.PageIndex * 2 * limiteRegistrosPorPagina).Count() > 0)
                    result.BtnProximo = "enabled";
                else
                    result.BtnProximo = "disabled";
            }

            foreach (var registro in registrosDaPagina)
            {
                CrmNovidade novidade = new CrmNovidade();
                novidade.Data = registro.Data.Value.ToShortDateString();
                novidade.Descricao = registro.Descricao;
                novidade.Titulo = registro.Titulo;
                novidade.Fixada = registro.Fixada.Value;
                novidades.Add(novidade);
            }

            
            result.Items = novidades.ToArray();

            return View(result);
        }

        //private string RetornaCorpoFeed()
        //{

        //}

        public ActionResult Novidades()
        {
            return View();
        }


        [HttpGet]
        public ActionResult GetNovidades()
        {
            string response = ListNovidades();

            return Json(response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetNovidadesNaoLidas()
        {
            string response = ListNovidadesNaoLidas();

            return Json(response, JsonRequestBehavior.AllowGet);
        }

        public string ListNovidadesNaoLidas()
        {
            var todasAsNovidades = Entity.GetAll(EntityDefinition.GetByName("K_CRM_NOVIDADES"));
            List<CrmOrigem> resultList = new List<CrmOrigem>();

            foreach (var novidade in todasAsNovidades)
            {
                var crit = new Criteria("A.USUARIO = :USUARIO AND A.NOVIDADE = :NOVIDADE");
                crit.Parameters.Add("USUARIO", BennerContext.Security.GetLoggedUserHandle());
                crit.Parameters.Add("NOVIDADE", novidade.Handle);

                var jaLeu = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_NOVIDADESLIDAS"), crit);

                if (null != jaLeu)
                    continue;

                CrmOrigem crmOrigem = new CrmOrigem();
                crmOrigem.Nome = novidade.Fields["TITULO"].ToString();
                crmOrigem.Handle = Convert.ToInt64(novidade.Fields["HANDLE"]);

                resultList.Add(crmOrigem);
            }

            return JsonConvert.SerializeObject(resultList);
        }

        public string ListNovidades()
        {
            List<CrmNovidade> listTimeline = new List<CrmNovidade>();
            try
            {
                /*
                 *  Altera data novidade
                 */

                Criteria critUsuario = new Criteria("A.HANDLE = @USUARIO");

                EntityBase usuario = Entity.Get(EntityDefinition.GetByName("Z_GRUPOUSUARIOS"), critUsuario, GetMode.Edit);

                usuario.Fields["K_DATANOVIDADE"] = DateTime.Now;
                usuario.Save();

                /*
                 * 
                 */


                Query query = new Query();

                // Comando SQL complexo
                
                query.CommandText.AppendLine("SELECT    A.HANDLE,                                       ");
                query.CommandText.AppendLine("          A.TITULO,                                       ");
                query.CommandText.AppendLine("          A.DESCRICAO,                                    ");
                query.CommandText.AppendLine("          A.DATA,                                         ");
                query.CommandText.AppendLine("          A.LINKVIDEO,                                    ");
                query.CommandText.AppendLine("          B.HANDLE HANDLEUSUARIO,                         ");
                query.CommandText.AppendLine("          B.NOME,                                         ");
                query.CommandText.AppendLine("          B.APELIDO                                       ");
                query.CommandText.AppendLine("FROM K_CRM_NOVIDADES A                                    ");
                query.CommandText.AppendLine("JOIN Z_GRUPOUSUARIOS B ON A.USUARIOINCLUSAO = B.HANDLE    ");

                List<EntityBase> resultList = query.Execute();

                foreach (EntityBase ent in resultList)
                {
                    CrmNovidade newPost = new CrmNovidade();

                    newPost.Handle = ent.Fields["HANDLE"].ToInt();

                    newPost.Titulo = ent.Fields["TITULO"].ToString();
                    newPost.Descricao = ent.Fields["DESCRICAO"].ToString();
                    newPost.Data = ent.Fields["DATA"].ToDateTime().ToString("dd/MM/yyyy");

                    if(ent.Fields["LINKVIDEO"] != null)
                    {
                        newPost.LinkVideo = ent.Fields["LINKVIDEO"].ToString();

                        if (ent.Fields["LINKVIDEO"].ToString().Contains("youtube"))
                        {
                            string[] linkSplitado = ent.Fields["LINKVIDEO"].ToString().Split(new string[] { "v=" }, StringSplitOptions.None);
                            newPost.LinkVideo = "https://www.youtube.com/watch?v=" + linkSplitado[1];
                        }
                    }

                    newPost.Usuario.Handle = ent.Fields["HANDLEUSUARIO"].ToLong();
                    newPost.Usuario.Nome = ent.Fields["NOME"].ToString();
                    newPost.Usuario.Apelido = ent.Fields["APELIDO"].ToString();
                    newPost.Usuario.Imagem = SetImagem3(new Handle(ent.Fields["HANDLEUSUARIO"].ToLong()));

                    listTimeline.Add(newPost);
                }

                return JsonConvert.SerializeObject(listTimeline);
            }
            catch (Exception e)
            {
                StringBuilder sBuilder = new StringBuilder();
                sBuilder.AppendLine(e.Message);
                sBuilder.AppendLine(e.StackTrace);

                throw new BusinessException(sBuilder.ToString());
            }
        }


        private string SetImagem(Handle handle)
        {
            UrlLinkDefinition imageUrl = new UrlLinkDefinition("~/GetImage.ashx");
            imageUrl.Parameters.Add("sys", BennerContext.Administration.BServerSystemName);
            imageUrl.Parameters.Add("def", "Z_GRUPOUSUARIOS");
            imageUrl.Parameters.Add("field", "K_IMAGEM");
            imageUrl.Parameters.Add("thumb", (int)ImageThumbnailSize.Medium);
            imageUrl.Parameters.Add("hnd", handle.Value);

            string path = HttpContext.Request.Url.AbsolutePath.Split('/')[1];

            return "/"+path + imageUrl.GetEncodedUrl();
        }
        
        private string SetImagem3(Handle handle)
        {
            Uri currentUrl = HttpContext.Request.Url;
            string baseUrl = currentUrl.Scheme + "://" + currentUrl.Authority;

            string EntityDefinitionName = "Z_GRUPOUSUARIOS";
            string FieldName = "K_IMAGEM";
            Handle Handle = handle;
            Handle UserHandle = BennerContext.Security.GetLoggedUserHandle();
            string EntitySessionKey = "";
            int ThumbnailSize = 2;
            bool IsModalNavigation = false;
            bool IsModalPage = false;
            //string plainText = $"{EntityDefinitionName}${FieldName}${Handle}${UserHandle}${EntitySessionKey}${ThumbnailSize}${base.IsModalPage}${base.IsModalNavigation}";
            string plainText = EntityDefinitionName + "$" + FieldName + "$" + Handle + "$" + UserHandle + "$" + EntitySessionKey + "$" + ThumbnailSize + "$" + IsModalPage + "$" + IsModalNavigation;
            plainText = HttpUtility.UrlEncode(AesCrypto.Instance.Encrypt(plainText));

            return baseUrl + "/GetImage.ashx?prms=" + plainText;
        }
    }
}