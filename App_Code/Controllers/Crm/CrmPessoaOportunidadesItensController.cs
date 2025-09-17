using Benner.Tecnologia.Common;
using Benner.Tecnologia.Business;    
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components.Scripting;
using Models.Crm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Descrição resumida de CrmPessoaOportunidadesItensController
/// </summary>
namespace Controllers.Crm
{
    public class CrmPessoaOportunidadesItensController : Controller
    {
        public CrmPessoaOportunidadesItensController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public string SaveFromPost(CrmProdutoPost post)
        {
            long? tabelaPreco;
            int qtdeUsuario;
            int categoria;

            if (post.Itens.Count == 0 && post.Pacotes.Count == 0)
                return "0";
            else
            {
                tabelaPreco = post.TabelaPreco;
                qtdeUsuario = post.QuantidadeUsuarios;
                switch (post.Categoria)
                {
                    case "A":   categoria = 1;break;
                    case "B":   categoria = 2; break;
                    case "C":   categoria = 3; break;
                    default:    categoria = 1;break;
                }
            }


            #region UpdatePessoaOportunidadeProd

            string responseUpdateVertical = UpdateVertical(post);

            if (responseUpdateVertical != "1")
                return responseUpdateVertical;

            #endregion

            #region Update Impostos

            string responseUpdateImpostos = UpdateVerticalImpostos(post);

            if (responseUpdateImpostos != "1")
                return responseUpdateImpostos;

            #endregion

            #region Update Tipos Usuarios

            string responseUpdateUsuarios = UpdateVerticalUsuarios(post);

            if (responseUpdateUsuarios != "1")
                return responseUpdateUsuarios;

            #endregion

            #region Criação de Pacotes

            string responseInsertPacotes = InsertPacotes(post);

            if (responseInsertPacotes != "1")
                return responseInsertPacotes;

            #endregion

            #region Criação de Itens

            string responseInsertItens = InsertItens(post);

            if (responseInsertItens != "1")
                return responseInsertItens;

            #endregion

            #region Deleta Atividades

            string responseDeleteAtiv = DeleteAtividades(post);

            if (responseDeleteAtiv != "1")
                return responseDeleteAtiv;

            #endregion

            #region Deleta Item e suas atividades

            string responseDeleteItens = DeleteItens(post);

            if (responseDeleteItens != "1")
                return responseDeleteItens;

            #endregion

            return StartOportunidadeFormView(post.Oportunidade.ToString());
        }

        /// <summary>
        /// Retorna o formulário referente a Oportunidade
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        private string StartOportunidadeFormView(string id)
        {
            var outPut = new FormLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_CRM_PESSOAOPORTUNIDADES",
                IsModalPage = false,
                TargetFormMode = FormLinkDefinition.FormMode.View,
                Url = "~/Pages/K_CRM_PESSOAOPORTUNIDADES/form.aspx",
                WhereClause =
                    new WhereClause("A.HANDLE = :HANDLE",
                    new List<Parameter>(){
                        new Parameter("HANDLE",id)
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: false, absoluteUrl: true);//.Split('\'').ElementAtOrDefault(1);

        }

        /// <summary>
        /// Realiza o Update na Vertical com as informações passada no POST
        /// </summary>
        /// <param name="post"></param>
        /// <returns></returns>
        private string UpdateVertical(CrmProdutoPost post)
        {
            long? tabelaPreco;
            int qtdeUsuario;
            int categoria;

            if (post.Itens.Count == 0 && post.Pacotes.Count == 0)
                return "Erro sem pacotes e itens!!";
            else
            {
                tabelaPreco = post.TabelaPreco;
                qtdeUsuario = post.QuantidadeUsuarios;
                switch (post.Categoria)
                {
                    case "A": categoria = 1; break;
                    case "B": categoria = 2; break;
                    case "C": categoria = 3; break;
                    default: categoria = 1; break;
                }
            }

            try
            {
                Criteria critOpo = new Criteria("A.HANDLE = :HANDLE");
                critOpo.Parameters.Add("HANDLE", post.OportunidadeProd);

                EntityBase oportunidade = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESPROD"), critOpo, GetMode.Edit);
                switch (post.TipoVenda)
                {
                    case 1: oportunidade.Fields["TIPOVENDA"] = new ListItem(1, "Lu + Lum"); break;
                    case 2: oportunidade.Fields["TIPOVENDA"] = new ListItem(2, "Locação"); break;
                    case 3: oportunidade.Fields["TIPOVENDA"] = new ListItem(3, "Locação + Saas"); break;
                    case 4: oportunidade.Fields["TIPOVENDA"] = new ListItem(4, "Saas"); break;
                }

                switch (categoria)
                {
                    case 1: oportunidade.Fields["CATEGORIA"] = new ListItem(1, "A"); break;
                    case 2: oportunidade.Fields["CATEGORIA"] = new ListItem(2, "B"); break;
                    case 3: oportunidade.Fields["CATEGORIA"] = new ListItem(3, "C"); break;
                }

                ((EntityAssociation)oportunidade.Fields["TABELAPRECO"]).Handle = new Handle(tabelaPreco);
                oportunidade.Fields["PROPOSTALULUM"] = post.PropostaLuLum;
                oportunidade.Fields["PROPOSTALOCACAO"] = post.PropostaLocacao;
                oportunidade.Fields["PROPOSTASAAS"] = post.PropostaSaas;
                oportunidade.Fields["COMIMPOSTOS"] = post.ComImpostos;
                oportunidade.Fields["FORAESCOPO"] = post.ForaEscopo;
                oportunidade.Fields["FORMAPAGAMENTO"] = post.FormaPagamento;
                oportunidade.Fields["CONDICAOIMPLANTACAO"] = post.CondicaoImplantacao;
                oportunidade.Save();

                return "1";
            }
            catch (Exception e)
            {
                return  e.Message;
            }

        }

        /// <summary>
        /// Atualiza os impostos referentes a Vertical
        /// </summary>
        /// <param name="post"></param>
        /// <returns></returns>
        private string UpdateVerticalImpostos(CrmProdutoPost post)
        {
            try
            {

                foreach (CrmImposto imposto in post.Impostos)
                {
                    Criteria crit = new Criteria("A.PRODUTO = :PRODUTO AND A.IMPOSTO = :IMPOSTO ");

                    crit.Parameters.Add("PRODUTO", post.OportunidadeProd);
                    crit.Parameters.Add("IMPOSTO", imposto.Handle);

                    EntityBase getImposto = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESPRIMP"), crit);

                    if (getImposto == null)
                    {
                        EntityBase newImposto = Entity.Create(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESPRIMP"));
                        ((EntityAssociation)newImposto.Fields["PRODUTO"]).Handle = post.OportunidadeProd;
                        ((EntityAssociation)newImposto.Fields["IMPOSTO"]).Handle = new Handle(imposto.Handle);
                        newImposto.Save();

                    }
                }
                return "1";
            }
            catch (Exception e)
            {
                return "Erro ao alterar os impostos. " + e.Message;
            }
        }

        /// <summary>
        /// Atualiza os usuarios da vertical, caso o usuário seja Multiplos usuários
        /// </summary>
        /// <param name="post"></param>
        /// <returns></returns>
        private string UpdateVerticalUsuarios(CrmProdutoPost post)
        {
            try
            {
                foreach (CrmProdutoUsuario tipoUsuario in post.TiposUsuarios)
                {
                    Criteria crit = new Criteria("A.PRODUTO = :PRODUTO AND A.PRODUTOUSUARIO = :PRODUTOUSUARIO ");

                    crit.Parameters.Add("PRODUTO", post.OportunidadeProd.Value);
                    crit.Parameters.Add("PRODUTOUSUARIO", tipoUsuario.Handle.Value);

                    EntityBase getImposto = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESPRUSU"), crit);

                    if (getImposto == null)
                    {
                        EntityBase newImposto = Entity.Create(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESPRUSU"));
                        ((EntityAssociation)newImposto.Fields["PRODUTO"]).Handle = new Handle(post.OportunidadeProd.Value);
                        ((EntityAssociation)newImposto.Fields["PRODUTOUSUARIO"]).Handle = new Handle(tipoUsuario.Handle.Value);
                        newImposto.Fields["QUANTIDADE"] = tipoUsuario.Quantidade;
                        newImposto.Save();
                    }
                    else
                    {

                        EntityBase aux = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESPRUSU"), crit, GetMode.Edit);

                        aux.Fields["QUANTIDADE"] = tipoUsuario.Quantidade;
                        aux.Save();
                    }
                }
                return "1";

            }
            catch (Exception e)
            {
                return "Erro ao criar Tipos de usuario da vertical. " + e.Message;
            }
        }

        /// <summary>
        /// Insere os pacotes se eles existirem
        /// </summary>
        /// <param name="post"></param>
        /// <returns></returns>
        private string InsertPacotes(CrmProdutoPost post)
        {
            //Adiciona itens do pacote e seus escopos
            if (post.Pacotes.Count > 0)
            {
                foreach (CrmProdutoItem pacote in post.Pacotes)
                {
                    Criteria crit = new Criteria("A.PRODUTO = :PRODUTO AND A.ITEM = :ITEM ");

                    crit.Parameters.Add("PRODUTO", post.OportunidadeProd);
                    crit.Parameters.Add("ITEM", pacote.Handle);

                    EntityBase auxPacote = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESITENS"), crit);
                    EntityBase oporItem = null;

                    if (auxPacote == null)
                    {
                        try
                        {
                            oporItem = Entity.Create(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESITENS"));
                            ((EntityAssociation)oporItem.Fields["OPORTUNIDADE"]).Handle = new Handle(post.Oportunidade.Value);
                            ((EntityAssociation)oporItem.Fields["PRODUTO"]).Handle = new Handle(post.OportunidadeProd.Value);
                            ((EntityAssociation)oporItem.Fields["ITEM"]).Handle = new Handle(pacote.Handle);

                            if (pacote.NecessitaQuantidade == true || pacote.PrecoFixo == true)
                                oporItem.Fields["QUANTIDADE"] = pacote.Quantidade;
                            else
                                oporItem.Fields["QUANTIDADE"] = post.QuantidadeUsuarios;

                            oporItem.Fields["DESCONTOLU"] = post.DescontoLu;
                            oporItem.Fields["DESCONTOLUM"] = post.DescontoLum;
                            oporItem.Fields["DESCONTOLOCACAO"] = post.DescontoLocacao;
                            oporItem.Fields["DESCONTOSAAS"] = post.DescontoSaas;
                            oporItem.Fields["DESCONTOSERVICO"] = post.DescontoServico;
                            oporItem.Fields["STATUS"] = new ListItem(3, "Pendente");
                            oporItem.Fields["VERSAO"] = post.Versao;
                            oporItem.Save();
                        }
                        catch (Exception e)
                        {
                            return "Erro ao cadastrar pacote. " + e.Message;
                        }

                    }
                    else
                    {
                        try
                        {
                            oporItem = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESITENS"), crit, GetMode.Edit);

                            if (pacote.NecessitaQuantidade == true || pacote.PrecoFixo == true)
                                oporItem.Fields["QUANTIDADE"] = pacote.Quantidade;
                            else
                                oporItem.Fields["QUANTIDADE"] = post.QuantidadeUsuarios;

                            oporItem.Fields["DESCONTOLU"] = post.DescontoLu;
                            oporItem.Fields["DESCONTOLUM"] = post.DescontoLum;
                            oporItem.Fields["DESCONTOLOCACAO"] = post.DescontoLocacao;
                            oporItem.Fields["DESCONTOSAAS"] = post.DescontoSaas;
                            oporItem.Fields["DESCONTOSERVICO"] = post.DescontoServico;
                            oporItem.Fields["STATUS"] = new ListItem(3, "Pendente");
                            oporItem.Save();
                        }
                        catch (Exception e)
                        {
                            return "Erro ao alterar pacote. " + e.Message;
                        }
                    }


                    List<CrmProdutoItemEscopo> listEscopo = (from ativ in post.Atividades
                                                             join it in pacote.ItensPacote on ativ.Item equals it.Handle
                                                             select ativ).ToList();

                    foreach (CrmProdutoItemEscopo esc in listEscopo)
                    {
                        Criteria critAtiv = new Criteria("A.NOME = :NOME AND A.ITEM = :ITEM ");

                        critAtiv.Parameters.Add("NOME", esc.Nome);
                        critAtiv.Parameters.Add("ITEM", oporItem.Handle);

                        EntityBase auxAtiv = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESATIV"), critAtiv);

                        if (auxAtiv == null)
                        {
                            try
                            {
                                EntityBase ativItem = Entity.Create(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESATIV"));
                                ((EntityAssociation)ativItem.Fields["ITEM"]).Handle = new Handle(oporItem.Handle);
                                ativItem.Fields["NOME"] = esc.Nome;
                                ativItem.Fields["HORASBASE"] = esc.HorasBase;
                                ativItem.Fields["HORAS"] = esc.HorasEditada;
                                ((EntityAssociation)ativItem.Fields["TIPORECURSO"]).Handle = new Handle(esc.TipoRecurso.Handle);
                                ativItem.Fields["ORDEM"] = esc.Ordem;
                                ativItem.Fields["VALOR"] = 0;
                                ativItem.Save();
                            }
                            catch (Exception e)
                            {
                                return "Erro ao interir atividade do pacote. " + e.Message;
                            }
                        }
                    }

                    foreach (CrmProdutoItem itemPac in pacote.ItensPacote)
                    {
                        post.Itens.RemoveAll(x => x.Handle == itemPac.Handle);
                    }
                }

                return "1";
            }

            return "1";
        }

        /// <summary>
        /// Insere os itens se eles existirem
        /// </summary>
        /// <param name="post"></param>
        /// <returns></returns>
        private string InsertItens(CrmProdutoPost post)
        {
            if (post.Itens.Count > 0)
            {
                foreach (CrmProdutoItem item in post.Itens)
                {

                    Criteria crit = new Criteria("A.PRODUTO = :PRODUTO AND A.ITEM = :ITEM AND A.VERSAO = :VERSAO ");

                    crit.Parameters.Add("PRODUTO", post.OportunidadeProd);
                    crit.Parameters.Add("ITEM", item.Handle);
                    crit.Parameters.Add("VERSAO", post.Versao);

                    EntityBase auxItem = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESITENS"), crit);
                    EntityBase oporItem = null;

                    if (auxItem == null)
                    {
                        try
                        {
                            oporItem = Entity.Create(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESITENS"));
                            ((EntityAssociation)oporItem.Fields["OPORTUNIDADE"]).Handle = new Handle(post.Oportunidade.Value);
                            ((EntityAssociation)oporItem.Fields["PRODUTO"]).Handle = new Handle(post.OportunidadeProd.Value);
                            ((EntityAssociation)oporItem.Fields["ITEM"]).Handle = new Handle(item.Handle);

                            if (item.NecessitaQuantidade == true || item.PrecoFixo == true)
                                oporItem.Fields["QUANTIDADE"] = item.Quantidade;
                            else
                                oporItem.Fields["QUANTIDADE"] = post.QuantidadeUsuarios;

                            oporItem.Fields["DESCONTOLU"] = post.DescontoLu;
                            oporItem.Fields["DESCONTOLUM"] = post.DescontoLum;
                            oporItem.Fields["DESCONTOLOCACAO"] = post.DescontoLocacao;
                            oporItem.Fields["DESCONTOSAAS"] = post.DescontoSaas;
                            oporItem.Fields["DESCONTOSERVICO"] = post.DescontoServico;
                            oporItem.Fields["VERSAO"] = post.Versao;
                            oporItem.Save();
                        }
                        catch (Exception e)
                        {
                            return "Erro ao inserir item! " + e.Message;
                        }
                    }
                    else
                    {
                        try
                        {
                            oporItem = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESITENS"), crit, GetMode.Edit);

                            if (item.NecessitaQuantidade == true || item.PrecoFixo == true)
                                oporItem.Fields["QUANTIDADE"] = item.Quantidade;
                            else
                                oporItem.Fields["QUANTIDADE"] = post.QuantidadeUsuarios;

                            oporItem.Fields["DESCONTOLU"] = post.DescontoLu;
                            oporItem.Fields["DESCONTOLUM"] = post.DescontoLum;
                            oporItem.Fields["DESCONTOLOCACAO"] = post.DescontoLocacao;
                            oporItem.Fields["DESCONTOSAAS"] = post.DescontoSaas;
                            oporItem.Fields["DESCONTOSERVICO"] = post.DescontoServico;
                            oporItem.Save();

                        }
                        catch (Exception e)
                        {
                            return "Erro ao alterar item! " + e.Message;
                        }
                    }

                    List<CrmProdutoItemEscopo> listEscopo = post.Atividades.Where(x => x.Item == item.Handle).ToList();

                    foreach (CrmProdutoItemEscopo esc in listEscopo)
                    {
                        EntityBase ativItem = null;

                        Criteria critAtiv = new Criteria("A.NOME = :NOME AND A.ITEM = :ITEM ");

                        critAtiv.Parameters.Add("NOME", esc.Nome);
                        critAtiv.Parameters.Add("ITEM", oporItem.Handle);

                        EntityBase auxAtiv = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESATIV"), critAtiv);

                        if (auxAtiv == null)
                        {
                            try
                            {
                                ativItem = Entity.Create(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESATIV"));
                                ((EntityAssociation)ativItem.Fields["ITEM"]).Handle = new Handle(oporItem.Handle);
                                ativItem.Fields["NOME"] = esc.Nome;
                                ativItem.Fields["HORASBASE"] = esc.HorasBase;
                                ativItem.Fields["HORAS"] = esc.HorasEditada;
                                ((EntityAssociation)ativItem.Fields["TIPORECURSO"]).Handle = new Handle(esc.TipoRecurso.Handle);
                                ativItem.Fields["ORDEM"] = esc.Ordem;
                                ativItem.Fields["VALOR"] = 0;
                                ativItem.Save();
                            }
                            catch (Exception e)
                            {
                                return "Erro ao inserir atividade do item! " + e.Message;
                            }
                        }
                        else
                        {
                            try
                            {
                                ativItem = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESATIV"), critAtiv, GetMode.Edit);
                                ativItem.Fields["HORAS"] = esc.HorasEditada;
                                ativItem.Save();
                            }catch(Exception e)
                            {
                                return "Erro ao alterar atividade "+esc.Nome+" do item "+esc.ItemNome+"! " + e.Message;
                            }
                        }
                    }
                }

                return "1";
            }

            return "1";
        }

        /// <summary>
        /// Deleta todas atividades que não estão nas postagens
        /// </summary>
        /// <param name="post"></param>
        /// <returns></returns>
        private string DeleteAtividades(CrmProdutoPost post)
        {
            try
            {
                Criteria critDeletaAtiv = new Criteria(@"   A.ITEM IN (
                                                        SELECT HANDLE 
                                                        FROM K_CRM_PESSOAOPORTUNIDADESITENS 
                                                        WHERE PRODUTO = :PRODUTO)");

                critDeletaAtiv.Parameters.Add("PRODUTO", post.OportunidadeProd);

                List<EntityBase> listAtividades = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESATIV"), critDeletaAtiv);

                foreach (EntityBase ativOld in listAtividades)
                {
                    bool permanece = false;

                    string nomeOld = ativOld.Fields["NOME"].ToString();
                    long itemOld = ((EntityAssociation)((EntityAssociation)ativOld.Fields["ITEM"]).Instance.Fields["ITEM"]).Handle.Value;

                    foreach (CrmProdutoItemEscopo escopo in post.Atividades)
                    {
                        if (escopo.Nome == nomeOld && escopo.Item == itemOld)
                            permanece = true;
                    }

                    if (!permanece)
                        ativOld.Delete();
                }
            }
            catch(Exception e)
            {
                return "Erro ao deletar atividade !" + e.Message;

            }
            

            return "1";

        }

        /// <summary>
        /// Deleta todos itens que não estão na postagem bem como suas atividades
        /// </summary>
        /// <param name="post"></param>
        /// <returns></returns>
        private string DeleteItens(CrmProdutoPost post)
        {
            try
            {

                List<string> handlesItem = new List<string>();

                foreach (CrmProdutoItem item in post.Pacotes)
                    handlesItem.Add(item.Handle.ToString());

                foreach (CrmProdutoItem item in post.Itens)
                    handlesItem.Add(item.Handle.ToString());

                string itensExistentes = string.Join(",", handlesItem);

                Criteria critDeleteItem = new Criteria(@"   A.PRODUTO = :PRODUTO AND
                                                        A.ITEM NOT IN (" + itensExistentes + ")");

                critDeleteItem.Parameters.Add("PRODUTO", post.OportunidadeProd);

                List<EntityBase> listItens = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESITENS"), critDeleteItem);

                foreach (EntityBase item in listItens)
                {
                    Criteria critAtiv = new Criteria("A.ITEM = :ITEM");
                    critAtiv.Parameters.Add("ITEM", item.Handle);

                    Entity.DeleteMany(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESATIV"), critAtiv);

                    item.Delete();
                }
            }
            catch(Exception e)
            {
                return "Erro ao deletar item !" + e.Message;
            }

            return "1";
        }

	public string UpdateFromPost()
        {
            try
            {
                Query query = new Query();

                query.CommandText.AppendLine("SELECT DISTINCT A.EMPRESA, A.FILIAL, A.PESSOA, A.VERTICAL,        ");
                query.CommandText.AppendLine("A.SUBFASE, A.USUARIOEXECUTIVO, A.USUARIOGDQ FROM                  ");
                query.CommandText.AppendLine("(SELECT E.HANDLE PESSOA, E.EMPRESA, E.FILIAL, E.USUARIOEXECUTIVO, ");
                query.CommandText.AppendLine("E.USUARIOGDQ, E.SUBFASE, V.HANDLE VERTICAL                        ");
                query.CommandText.AppendLine("FROM K_CRM_PESSOAOPORTUNIDADESPROD I                              ");
                query.CommandText.AppendLine("INNER JOIN K_CRM_PESSOAOPORTUNIDADES O ON O.HANDLE=I.OPORTUNIDADE ");
                query.CommandText.AppendLine("INNER JOIN K_CRM_PRODUTOS P ON P.HANDLE = I.PRODUTO               ");
                query.CommandText.AppendLine("INNER JOIN K_CRM_VERTICAL V ON V.HANDLE = P.VERTICAL              ");
                query.CommandText.AppendLine("INNER JOIN K_CRM_PESSOAS E ON E.HANDLE = O.PESSOA                 ");
                query.CommandText.AppendLine(") A WHERE A.VERTICAL <> 6 ORDER BY EMPRESA DESC");

                List<EntityBase> result = query.Execute();

                foreach (EntityBase conta in result)
                {
                    Criteria crit = new Criteria("A.PESSOA = :PESSOA AND A.VERTICAL = :VERTICAL");
                    crit.Parameters.Add("PESSOA", conta.Fields["PESSOA"].ToString());
                    crit.Parameters.Add("VERTICAL", conta.Fields["VERTICAL"].ToString());

                    EntityBase jaExiste = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"), crit);

                    if (null == jaExiste)
                    {
                        EntityBase pessoaVertical = Entity.Create(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"));
                        ((EntityAssociation)pessoaVertical.Fields["EMPRESA"]).Handle = new Handle(conta.Fields["EMPRESA"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["FILIAL"]).Handle = new Handle(conta.Fields["FILIAL"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["PESSOA"]).Handle = new Handle(conta.Fields["PESSOA"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["VERTICAL"]).Handle = new Handle(conta.Fields["VERTICAL"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["SUBFASE"]).Handle = new Handle(conta.Fields["SUBFASE"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["USUARIOEXECUTIVO"]).Handle = null == conta.Fields["USUARIOEXECUTIVO"] ? null : new Handle(conta.Fields["USUARIOEXECUTIVO"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["USUARIOSDR"]).Handle = null == conta.Fields["USUARIOGDQ"] ? null : new Handle(conta.Fields["USUARIOGDQ"].ToString());
                        pessoaVertical.Save();
                    }
                }

                //Pesquisa todas as Empresas cadastradas
                List<EntityBase> todasVerticais = Entity.GetAll(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"));

                //Percorre a lista de empresas
                foreach (EntityBase pessoaVertical in todasVerticais)
                {
                    string hanExecutivo = pessoaVertical.Fields["USUARIOEXECUTIVO"].ToString();
                    if (hanExecutivo != "")
                    {
                        Handle hanPV = new Handle((pessoaVertical.Fields["USUARIOEXECUTIVO"] as EntityAssociation).Handle.Value);

                        EntityBase usuarioAtual = Entity.Get(EntityDefinition.GetByName("Z_GRUPOUSUARIOS"), hanPV);

                        var verticais = (usuarioAtual.Fields["K_VERTICALPRODUTO"] as EntityAggregation).FilterInfo;

                        bool passou = false;

                        foreach (KeyValuePair<Handle, string> vertical in verticais)
                        {
			    string hanVertical = pessoaVertical.Fields["VERTICAL"].ToString();
                            if (hanVertical != "")
                            {
                                if (vertical.Key.ToString() == (pessoaVertical.Fields["VERTICAL"] as EntityAssociation).Handle.Value.ToString())
                                    passou = true;
                            }
                        }

                        if (!passou)
                        {
                            string handle = pessoaVertical.Fields["CODIGO"].ToString();
                            if (handle != "")
                            {
                                EntityBase atualiza = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"), new Handle(pessoaVertical.Fields["CODIGO"].ToString()), GetMode.Edit);
                                (atualiza.Fields["USUARIOEXECUTIVO"] as EntityAssociation).Handle = null;
                                atualiza.Save();
                            }
                        }
                        else
			{
			    //string handle = pessoaVertical.Fields["CODIGO"].ToString();
                            //if (handle != "")
                            //{
                            //    EntityBase atualiza = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"), new Handle(pessoaVertical.Fields["CODIGO"].ToString()), GetMode.Edit);
                            //    (atualiza.Fields["USUARIOEXECUTIVO"] as EntityAssociation).Handle = new Handle(handle);
                            //    atualiza.Save();
                            //}
                            passou = false;
			}

                    }
                }

                return "Verticais atualizadas com sucesso";
            }
            catch (Exception e)
            {
                return e.ToString();
            }
        }

	public string UpdateProspectFromPost()
        {
            try
            {
                Query query = new Query();

                query.CommandText.AppendLine("SELECT A.EMPRESA, A.FILIAL, A.PESSOA,                               ");
                query.CommandText.AppendLine("A.SUBFASE, A.USUARIOEXECUTIVO,                                      ");
                query.CommandText.AppendLine("A.USUARIOGDQ, CONVERT(INT, VALUE) VERTICAL                          ");
                query.CommandText.AppendLine("FROM (SELECT P.EMPRESA, P.FILIAL, P.HANDLE PESSOA, P.SUBFASE,       ");
                query.CommandText.AppendLine("P.USUARIOEXECUTIVO, P.USUARIOGDQ,                                   ");
                query.CommandText.AppendLine("REPLACE(REPLACE(SUBSTRING(U.K_VERTICALPRODUTO,0, LEN(U.K_VERTICALPRODUTO)-1), '|', ''),'_',',') VERTICAIS ");
                query.CommandText.AppendLine("FROM K_CRM_PESSOAS P                                                ");
                query.CommandText.AppendLine("INNER JOIN Z_GRUPOUSUARIOS U ON U.HANDLE = P.USUARIOEXECUTIVO       ");
                query.CommandText.AppendLine("WHERE P.HANDLE NOT IN                                               ");
                query.CommandText.AppendLine("(SELECT PESSOA FROM K_CRM_PESSOAVERTICAL GROUP BY PESSOA)           ");
                query.CommandText.AppendLine("AND FASE=9 AND USUARIOEXECUTIVO IS NOT NULL                         ");
                query.CommandText.AppendLine("AND USUARIOEXECUTIVO IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE INATIVO='N') ");
                query.CommandText.AppendLine("AND K_VERTICALPRODUTO IS NOT NULL) A                                ");
                query.CommandText.AppendLine("CROSS APPLY STRING_SPLIT (A.VERTICAIS, ',')                         ");

                List<EntityBase> result = query.Execute();

                foreach (EntityBase conta in result)
                {
                    Criteria crit = new Criteria("A.PESSOA = :PESSOA AND A.VERTICAL = :VERTICAL");
                    crit.Parameters.Add("PESSOA", conta.Fields["PESSOA"].ToString());
                    crit.Parameters.Add("VERTICAL", conta.Fields["VERTICAL"].ToString());

                    EntityBase jaExiste = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"), crit);

                    if (null == jaExiste)
                    {
                        EntityBase pessoaVertical = Entity.Create(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"));
                        ((EntityAssociation)pessoaVertical.Fields["EMPRESA"]).Handle = new Handle(conta.Fields["EMPRESA"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["FILIAL"]).Handle = new Handle(conta.Fields["FILIAL"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["PESSOA"]).Handle = new Handle(conta.Fields["PESSOA"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["VERTICAL"]).Handle = new Handle(conta.Fields["VERTICAL"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["SUBFASE"]).Handle = new Handle(conta.Fields["SUBFASE"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["USUARIOEXECUTIVO"]).Handle = null == conta.Fields["USUARIOEXECUTIVO"] ? null : new Handle(conta.Fields["USUARIOEXECUTIVO"].ToString());
                        ((EntityAssociation)pessoaVertical.Fields["USUARIOSDR"]).Handle = null == conta.Fields["USUARIOGDQ"] ? null : new Handle(conta.Fields["USUARIOGDQ"].ToString());
                        pessoaVertical.Save();
                    }
                }

                return result.Count + " Verticais adicionadas com sucesso!";
            }
            catch (Exception e)
            {
                return e.ToString();
            }
        }

	public string UpdateOportunidadesFromPost()
        {
            try
            {
                Query query = new Query();

                query.CommandText.AppendLine("SELECT * FROM K_CRM_PESSOAOPORTUNIDADES                              ");
                query.CommandText.AppendLine("WHERE HANDLE IN (                                                    ");
                query.CommandText.AppendLine("SELECT  O.OPORTUNIDADE FROM K_CRM_PESSOAOPORTUNIDADESPROD O          ");
                query.CommandText.AppendLine("WHERE O.OPORTUNIDADE IN (                                            ");
                query.CommandText.AppendLine("SELECT HANDLE FROM K_CRM_PESSOAOPORTUNIDADES WHERE VERTICAL IS NULL))");       

                List<EntityBase> result = query.Execute();

                foreach (EntityBase conta in result)
                {
                    Criteria crit = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE");
                    crit.Parameters.Add("OPORTUNIDADE", conta.Fields["CODIGO"].ToString());

                    EntityBase prodOportunidade = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESPROD"), crit);

                    if (null != prodOportunidade)
                    {
                        Criteria criteria = new Criteria("A.CODIGO = :OPORTUNIDADE");
                        criteria.Parameters.Add("OPORTUNIDADE", conta.Fields["CODIGO"].ToString());

                        EntityBase oportunidade = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADES"), criteria,GetMode.Edit);
                        ((EntityAssociation)oportunidade.Fields["VERTICAL"]).Handle = ((prodOportunidade.Fields["PRODUTO"] as EntityAssociation).Instance.Fields["VERTICAL"] as EntityAssociation).Handle;
                        oportunidade.Save();
                    }
                }

                return "Foram atualizados " + result.Count + " Oportunidades! Verticais adicionadas com sucesso!";
            }
            catch (Exception e)
            {
                return e.ToString();
            }
        }


    }
}
