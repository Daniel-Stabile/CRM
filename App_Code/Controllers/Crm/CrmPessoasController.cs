using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Metadata.Entities;
using Models.Crm;
using Models.Generico;
using Newtonsoft.Json;
using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Controllers.Models.Crm;

/// <summary>
/// Descrição resumida de CrmPessoasController
/// </summary>
namespace Controllers.Crm
{
    public class CrmPessoasController : Controller
    {
        public CrmPessoasController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public ActionResult ImportaPlanilha()
        {
            return PartialView();
        } 
        
        [HttpPost]
        public ActionResult LeituraPlanilha(FormCollection form)
        {
            try
            {
                HttpPostedFileBase file = Request.Files[0];

                if (file != null && file.ContentLength > 0)
                {
                    string result = string.Empty;

                    List<PlanilhaCelula> listPlanilha = new List<PlanilhaCelula>();

                    using (BinaryReader b = new BinaryReader(file.InputStream))
                    {
                        byte[] binData = b.ReadBytes(file.ContentLength);
                        result = System.Text.Encoding.UTF8.GetString(binData);

                        MemoryStream mem = new MemoryStream(binData);

                        StreamReader reader = new StreamReader(mem);

                        string line;
                        if ((line = reader.ReadLine()) != null)
                        {
                            List<string> listPrimeiro = line.Split(';').ToList();

                            for (var i = 0; i < listPrimeiro.Count; i++)
                            {
                                PlanilhaCelula celula = new PlanilhaCelula();
                                celula.Coluna = i;
                                celula.Valor = listPrimeiro[i];

                                listPlanilha.Add(celula);
                            }

                        }
                    }

                    return Json(new { code = 200, status = "success", message="Leitura do cabeçalho da planilha realizado com sucesso!",data = JsonConvert.SerializeObject(listPlanilha) }, JsonRequestBehavior.AllowGet);


                    //try
                    //{
                    //    using (Stream inputStream = file.InputStream)
                    //    {
                    //        MemoryStream memoryStream = inputStream as MemoryStream;
                    //        if (memoryStream == null)
                    //        {
                    //            memoryStream = new MemoryStream();
                    //            inputStream.CopyTo(memoryStream);

                    //            //StreamReader reader = new StreamReader(memoryStream);
                    //            //string line;
                    //            //int count = 0;
                    //            //List<string> tituloString = new List<string>();

                    //            //while((line = reader.ReadLine()) != null)
                    //            //{
                    //            //    tituloString = line.Split(';').ToList();
                    //            //    count++;
                    //            //}
                    //            //data = memoryStream.ToArray();
                    //            // Read bytes from http input stream

                    //        }
                    //    }
                    //}
                    //catch (Exception ex)
                    //{
                    //    return Json(new { status = "error", code = 401, message = "Nenhum arquivo enviado! " + ex.Message }, JsonRequestBehavior.AllowGet);
                    //}

                }
                else
                {
                    return Json(new { status = "error", code = 401, message = "Nenhum arquivo enviado!" }, JsonRequestBehavior.AllowGet);
                }

            }catch(Exception e)
            {
                return Json(new { status = "error", code = 401, message = "Nenhum arquivo enviado! "+e.Message }, JsonRequestBehavior.AllowGet);
            }

        }

        [HttpPost]
        public ActionResult InserePlanilha(FormCollection form)
        {
            HttpPostedFileBase file = Request.Files[0];

            StringBuilder st = new StringBuilder();

            Dictionary<string, string> dicionario = new Dictionary<string, string>();

            foreach (string key in form.Keys)
            {
                dicionario.Add(key, form.GetValue(key).AttemptedValue);
            }

            string formValues = st.ToString();

            if (file != null && file.ContentLength > 0)
            {
                string result = string.Empty;

                int importados = 0;
                int comErro = 0;

                List<PlanilhaCelula> listPlanilha = new List<PlanilhaCelula>();

                using (BinaryReader b = new BinaryReader(file.InputStream))
                {
                    byte[] binData = b.ReadBytes(file.ContentLength);
                    result = System.Text.Encoding.UTF8.GetString(binData);

                    MemoryStream mem = new MemoryStream(binData);

                    StreamReader reader = new StreamReader(mem);

                    string line;

                    reader.ReadLine().Remove(0);

                    if (reader == null)
                        return null;

                    EntityBase newLote = Entity.Create(EntityDefinition.GetByName("K_CRM_IMPORTACAOLOTE"));
                    ((EntityAssociation)newLote.Fields["EMPRESA"]).Handle = Company.Current.Handle;
                    ((EntityAssociation)newLote.Fields["FILIAL"]).Handle = Branch.Current.Handle;
                    newLote.Save();

                    while ((line = reader.ReadLine()) != null)
                    {
                        List<string> listPrimeiro = line.Split(';').ToList();
                        
                        if(listPrimeiro[Convert.ToInt32(dicionario["cnpj"])] != null 
                            && listPrimeiro[Convert.ToInt32(dicionario["cnpj"])].Replace(".","").Replace("/","").Replace("-","").Length == 14)
                        {

                            EntityBase newLotePessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_IMPORTACAOLOTEPESSOA"));
                            newLotePessoa.Fields["CNPJ"] = listPrimeiro[Convert.ToInt32(dicionario["cnpj"])];
                            ((EntityAssociation)newLotePessoa.Fields["LOTE"]).Handle = newLote.Handle;
                            newLotePessoa.Fields["NOMEPLANILHA"] = listPrimeiro[Convert.ToInt32(dicionario["nome"])];
                            newLotePessoa.Fields["RESPONSAVELPLANILHA"] = listPrimeiro[Convert.ToInt32(dicionario["responsavelplanilha"])];
                            ((EntityAssociation)newLotePessoa.Fields["ORIGEM"]).Handle = new Handle(dicionario["origem"]);
                            ((EntityAssociation)newLotePessoa.Fields["UNIDADE"]).Handle = new Handle(dicionario["unidade"]);
                            ((EntityAssociation)newLotePessoa.Fields["RESPONSAVEL"]).Handle = new Handle(dicionario["responsavel"]);
                            ((EntityAssociation)newLotePessoa.Fields["VERTICAL"]).Handle = new Handle(dicionario["vertical"]);
                            newLotePessoa.Fields["NOMEEVENTO"] = dicionario["nomeevento"];

                            //Criteria critusuario = new Criteria("A.NOME LIKE '%" + listPrimeiro[Convert.ToInt32(dicionario["responsavel"])] + "%'");
                            //ZGrupoUsuarios responsavel = ZGrupoUsuarios.GetFirstOrDefault(critusuario);

                            //if (responsavel != null)
                            //    ((EntityAssociation)newLotePessoa.Fields["RESPONSAVEL"]).Handle = responsavel.Handle;

                            try
                            {
                                newLotePessoa.Save();
                                importados++;
                            }
                            catch (Exception e)
                            {
                                comErro++;
                            }
                        }
                        else
                            comErro++;
                    }
                }

                return Json(new { code = 200, status = "success", message = "Foram importadas " + importados + " contas com sucesso e " + comErro + " contas não foram possiveis serem importadas" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { code = 200, status = "error", message = "Arquivo não foi enviado" }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult GetUsuariosGDQ()
        {
            try
            {

                Query query = new Query();
                query.AppendLine("SELECT A.HANDLE, A.NOME, A.APELIDO                    ");
                query.AppendLine("FROM Z_GRUPOUSUARIOS A                                ");
                query.AppendLine("WHERE 1 = 1                                           ");
                query.AppendLine("AND A.INATIVO = 'N' AND A.K_INTELIGENCIAMERCADO = 'S' ");
                query.AppendLine("AND A.HANDLE IN(                                      ");
                query.AppendLine("SELECT USUARIO FROM Z_GRUPOUSUARIOEMPRESAFILIAIS      ");
                query.AppendLine("WHERE FILIAL = :FILIAL)                               ");

                query.Parameters.Add("FILIAL", Branch.Current.Handle);

                List<EntityBase> listEntity = query.Execute();

                List<Usuario> listUsuario = new List<Usuario>();

                foreach (EntityBase ent in listEntity)
                {
                    Usuario newUser = new Usuario();
                    newUser.Handle = ent.Fields["HANDLE"].ToLong();
                    newUser.Nome = ent.Fields["NOME"].ToString();
                    newUser.Apelido = ent.Fields["APELIDO"].ToString();

                    listUsuario.Add(newUser);
                }

                return Json(new {
                                code =200
                                ,status="success"
                                ,message="Usuários GDQ da filial buscados com sucesso"
                                ,data=JsonConvert.SerializeObject(listUsuario)
                        },JsonRequestBehavior.AllowGet);
            }
            catch(Exception e)
            {
                return Json(new {
                                code =400
                                ,status="error"
                                ,message="Erro ao buscar GDQs: "+e.Message+"\n"+e.StackTrace
                        },JsonRequestBehavior.AllowGet);
            }


        }

        [HttpGet]
        public ActionResult GetUsuariosExecutivo()
        {
            try
            {
                Query query = new Query();
                query.AppendLine("SELECT A.HANDLE, A.NOME, A.APELIDO                    ");
                query.AppendLine("FROM Z_GRUPOUSUARIOS A                                ");
                query.AppendLine("WHERE 1 = 1                                           ");
                query.AppendLine("AND A.INATIVO = 'N' AND A.K_EXECUTIVOCONTAS = 'S'     ");
                query.AppendLine("AND A.HANDLE IN(                                      ");
                query.AppendLine("SELECT USUARIO FROM Z_GRUPOUSUARIOEMPRESAFILIAIS      ");
                query.AppendLine("WHERE FILIAL = :FILIAL)                               ");

                query.Parameters.Add("FILIAL", Branch.Current.Handle);

                List<EntityBase> listEntity = query.Execute();

                List<Usuario> listUsuario = new List<Usuario>();

                foreach (EntityBase ent in listEntity)
                {
                    Usuario newUser = new Usuario();
                    newUser.Handle = ent.Fields["HANDLE"].ToLong();
                    newUser.Nome = ent.Fields["NOME"].ToString();
                    newUser.Apelido = ent.Fields["APELIDO"].ToString();

                    listUsuario.Add(newUser);
                }

                return Json(new {
                                code =200
                                ,status="success"
                                ,message="Usuários executivos da filial buscados com sucesso"
                                ,data=JsonConvert.SerializeObject(listUsuario)
                        },JsonRequestBehavior.AllowGet);
            }
            catch(Exception e)
            {
                return Json(new {
                                code =400
                                ,status="error"
                                ,message="Erro ao buscar Executivo: "+e.Message+"\n"+e.StackTrace
                        },JsonRequestBehavior.AllowGet);
            }


        }
        
        [HttpGet]
        public ActionResult GetUnidade()
        {
            try
            {
                Query query = new Query();
                query.AppendLine("SELECT A.HANDLE, A.NOME         ");
                query.AppendLine("FROM K_CRM_UNIDADES A           ");
                query.AppendLine("WHERE 1 = 1                     ");
                query.AppendLine("AND A.HANDLE IN(                ");
                query.AppendLine("    SELECT UNIDADE              ");
                query.AppendLine("    FROM K_CRM_UNIDADESFILIAIS  ");
                query.AppendLine("    WHERE FILIAL = :FILIAL)     ");

                query.Parameters.Add("FILIAL", Branch.Current.Handle);

                List<EntityBase> listEntity = query.Execute();

                List<CrmUnidade> listUnidade = new List<CrmUnidade>();

                foreach (EntityBase ent in listEntity)
                {
                    CrmUnidade newUnidade = new CrmUnidade();
                    newUnidade.Handle = ent.Fields["HANDLE"].ToLong();
                    newUnidade.Nome = ent.Fields["NOME"].ToString();

                    listUnidade.Add(newUnidade);
                }

                return Json(new {
                                code =200
                                ,status="success"
                                ,message="Unidades recuperadas com sucesso"
                                ,data=JsonConvert.SerializeObject(listUnidade)
                        },JsonRequestBehavior.AllowGet);
            }
            catch(Exception e)
            {
                return Json(new {
                                code =400
                                ,status="error"
                                ,message="Erro ao buscar Unidade: "+e.Message+"\n"+e.StackTrace
                        },JsonRequestBehavior.AllowGet);
            }


        }

        [HttpGet]
        public ActionResult GetOrigem()
        {
            try
            {
                Query query = new Query();
                query.AppendLine("SELECT HANDLE, NOME           ");
                query.AppendLine("FROM K_CRM_ORIGEM             ");

                List<EntityBase> listEntity = query.Execute();

                List<Models.Crm.CrmOrigem> listOrigem = new List<Models.Crm.CrmOrigem>();

                foreach (EntityBase ent in listEntity)
                {
                    Models.Crm.CrmOrigem newOrigem = new Models.Crm.CrmOrigem();
                    newOrigem.Handle = ent.Fields["HANDLE"].ToLong();
                    newOrigem.Nome = ent.Fields["NOME"].ToString();

                    listOrigem.Add(newOrigem);
                }

                return Json(new {
                                code =200
                                ,status="success"
                                ,message="Origens recuperadas com sucesso"
                                ,data=JsonConvert.SerializeObject(listOrigem)
                        },JsonRequestBehavior.AllowGet);
            }
            catch(Exception e)
            {
                return Json(new {
                                code =400
                                ,status="error"
                                ,message="Erro ao buscar Origem: "+e.Message+"\n"+e.StackTrace
                        },JsonRequestBehavior.AllowGet);
            }


        }
        
        [HttpGet]
        public ActionResult GetVertical()
        {
            try
            {

                Query query = new Query();
                query.AppendLine("SELECT A.HANDLE, A.NOME                               ");
                query.AppendLine("FROM K_CRM_PRODUTOS A                                 ");
                query.AppendLine("WHERE 1 = 1                                           ");

                query.Parameters.Add("FILIAL", Branch.Current.Handle);

                List<EntityBase> listEntity = query.Execute();

                List<Models.Crm.CrmOrigem> listOrigem = new List<Models.Crm.CrmOrigem>();
                
                foreach (EntityBase ent in listEntity)
                {
                    Models.Crm.CrmOrigem newOrigem = new Models.Crm.CrmOrigem();
                    newOrigem.Handle = ent.Fields["HANDLE"].ToLong();
                    newOrigem.Nome = ent.Fields["NOME"].ToString();

                    listOrigem.Add(newOrigem);
                }

                return Json(new {
                                code =200
                                ,status="success"
                                ,message="Produtos recuperadas com sucesso"
                                ,data=JsonConvert.SerializeObject(listOrigem)
                        },JsonRequestBehavior.AllowGet);
            }
            catch(Exception e)
            {
                return Json(new {
                                code =400
                                ,status="error"
                                ,message="Erro ao buscar Produtos: "+e.Message+"\n"+e.StackTrace
                        },JsonRequestBehavior.AllowGet);
            }


        }

    }
}