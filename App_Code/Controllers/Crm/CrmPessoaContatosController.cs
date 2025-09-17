using Benner.Tecnologia.Common;
using Models.Generico;
using Newtonsoft.Json;
using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Descrição resumida de CrmPessoaContatosController
/// </summary>
namespace Controllers.Crm
{
    public class CrmPessoaContatosController : Controller
    {
        public CrmPessoaContatosController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }


        [HttpPost]
        public ActionResult LeituraPlanilha(FormCollection form)
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

                return Json(new { code = 200, status = "success", data = JsonConvert.SerializeObject(listPlanilha) }, JsonRequestBehavior.AllowGet);

            }
            else
            {
                return Json(new { status = "error", code = 401, message = "Nenhum arquivo enviado!" }, JsonRequestBehavior.AllowGet);
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
                        StringBuilder mensagemErro = new StringBuilder();

                        List<string> listPrimeiro = line.Split(';').ToList();

                        if(listPrimeiro[Convert.ToInt32(dicionario["email"])] != null
                            && listPrimeiro[Convert.ToInt32(dicionario["email"])].Length > 0)
                        {
                            if (listPrimeiro[Convert.ToInt32(dicionario["cnpj"])] != null 
                                && listPrimeiro[Convert.ToInt32(dicionario["cnpj"])].Length != 14)
                            {
                                mensagemErro.AppendLine("Campo cnpj vazio ou em formato incorreto");

                                if (listPrimeiro[Convert.ToInt32(dicionario["cnpj"])].Length > 1)
                                {

                                    EntityBase newLotePessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_IMPORTACAOLOTECONTATO"));
                                    ((EntityAssociation)newLotePessoa.Fields["LOTE"]).Handle = newLote.Handle;

                                    newLotePessoa.Fields["CNPJ"] = listPrimeiro[Convert.ToInt32(dicionario["cnpj"])];
                                    newLotePessoa.Fields["EMAIL"] = listPrimeiro[Convert.ToInt32(dicionario["email"])];
                                    newLotePessoa.Fields["NOMECONTATO"] = listPrimeiro[Convert.ToInt32(dicionario["nome"])];
                                    newLotePessoa.Fields["CARGOCONTATO"] = listPrimeiro[Convert.ToInt32(dicionario["cargo"])];
                                    newLotePessoa.Fields["TELEFONECONTATO"] = listPrimeiro[Convert.ToInt32(dicionario["telefone"])];
                                    newLotePessoa.Fields["MENSAGEM"] = mensagemErro.ToString();
                                    newLotePessoa.Fields["STATUS"] = new ListItem(2, "Erro ao importar");
                                    newLotePessoa.Save();
                                    comErro++;
                                }


                            }
                            else
                            {
                                string cnpj = listPrimeiro[Convert.ToInt32(dicionario["cnpj"])];
                                string cnpjMask = cnpj.Substring(0, 2)
                                                    + "."
                                                    + cnpj.Substring(2, 3)
                                                    + "."
                                                    + cnpj.Substring(5, 3)
                                                    + "/"
                                                    + cnpj.Substring(8, 4)
                                                    + "-"
                                                    + cnpj.Substring(12, 2);

                                Criteria critConta = new Criteria("A.CNPJ = :CNPJ");
                                critConta.Parameters.Add("CNPJ", cnpjMask);

                                CrmPessoas conta = CrmPessoas.GetFirstOrDefault(critConta);

                                #region Busca Cargo

                                Criteria critCargo = new Criteria("A.NOME = :NOME");
                                critCargo.Parameters.Add("NOME", listPrimeiro[Convert.ToInt32(dicionario["cargo"])]);

                                EntityBase cargo = Entity.GetFirstOrDefault(EntityDefinition.GetByName("GN_CARGOS"), critCargo);

                                if (cargo == null
                                    && listPrimeiro[Convert.ToInt32(dicionario["cargo"])] != null
                                    && listPrimeiro[Convert.ToInt32(dicionario["cargo"])].Length > 0)
                                {
                                    cargo = Entity.Create(EntityDefinition.GetByName("GN_CARGOS"));
                                    cargo.Fields["NOME"] = listPrimeiro[Convert.ToInt32(dicionario["cargo"])];
                                    cargo.Save();
                                }

                                #endregion

                                #region Busca Area

                                Criteria critArea = new Criteria("A.NOME = :NOME");
                                critArea.Parameters.Add("NOME", "Geral");

                                EntityBase area = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_AREAS"), critArea);

                                if (area == null)
                                {
                                    area = Entity.Create(EntityDefinition.GetByName("K_CRM_AREAS"));
                                    area.Fields["NOME"] = "Geral";
                                    area.Save();
                                }

                                #endregion

                                if (conta != null)
                                {
                                    CrmPessoaContatos newContato = CrmPessoaContatos.Create();
                                    newContato.PessoaHandle = conta.Handle;
                                    newContato.Nome = listPrimeiro[Convert.ToInt32(dicionario["nome"])];
                                    newContato.CargoHandle = cargo.Handle;
                                    newContato.AreaHandle = area.Handle;
                                    newContato.TelFixo = listPrimeiro[Convert.ToInt32(dicionario["telefone"])];
                                    newContato.Email = listPrimeiro[Convert.ToInt32(dicionario["email"])];
                                    newContato.Save();

                                    EntityBase newLotePessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_IMPORTACAOLOTECONTATO"));
                                    ((EntityAssociation)newLotePessoa.Fields["LOTE"]).Handle = newLote.Handle;
                                    ((EntityAssociation)newLotePessoa.Fields["CONTATO"]).Handle = newContato.Handle;
                                    newLotePessoa.Fields["CNPJ"] = listPrimeiro[Convert.ToInt32(dicionario["cnpj"])];
                                    newLotePessoa.Fields["EMAIL"] = listPrimeiro[Convert.ToInt32(dicionario["email"])];
                                    newLotePessoa.Fields["NOMECONTATO"] = listPrimeiro[Convert.ToInt32(dicionario["nome"])];
                                    newLotePessoa.Fields["CARGOCONTATO"] = listPrimeiro[Convert.ToInt32(dicionario["cargo"])];
                                    newLotePessoa.Fields["TELEFONECONTATO"] = listPrimeiro[Convert.ToInt32(dicionario["telefone"])];
                                    newLotePessoa.Fields["STATUS"] = new ListItem(1, "Importado com sucesso");
                                    newLotePessoa.Save();

                                    importados++;
                                }
                                else
                                {
                                    EntityBase newLotePessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_IMPORTACAOLOTECONTATO"));
                                    ((EntityAssociation)newLotePessoa.Fields["LOTE"]).Handle = newLote.Handle;
                                    newLotePessoa.Fields["CNPJ"] = listPrimeiro[Convert.ToInt32(dicionario["cnpj"])];
                                    newLotePessoa.Fields["EMAIL"] = listPrimeiro[Convert.ToInt32(dicionario["email"])];
                                    newLotePessoa.Fields["NOMECONTATO"] = listPrimeiro[Convert.ToInt32(dicionario["nome"])];
                                    newLotePessoa.Fields["CARGOCONTATO"] = listPrimeiro[Convert.ToInt32(dicionario["cargo"])];
                                    newLotePessoa.Fields["TELEFONECONTATO"] = listPrimeiro[Convert.ToInt32(dicionario["telefone"])];
                                    newLotePessoa.Fields["MENSAGEM"] = "Não foi encontrada a conta com o cnpj importado";
                                    newLotePessoa.Fields["STATUS"] = new ListItem(2, "Erro ao importar");
                                    newLotePessoa.Save();
                                    comErro++;
                                }

                            }

                        }



                    }
                }

                return Json(new { code = 200, status = "success", message = "Foram importadas " + importados + " contatos com sucesso e " + comErro + " contatos não foram possiveis serem importadas" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { code = 200, status = "error", message = "Arquivo não foi enviado" }, JsonRequestBehavior.AllowGet);
            }
        }


    }

}