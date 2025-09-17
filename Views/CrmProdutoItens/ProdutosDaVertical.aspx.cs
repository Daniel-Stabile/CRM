using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Models.Crm;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_CrmProdutoItens_ProdutosDaVertical : ViewPage
{
    public EntityBase vertical;
    public CrmProduto produto;
    public string tabelas;
    public string jsonProduto;
    public string jsonRecursos;
    public string jsonImpostos;
    public string jsonTiposUsuarios;
    public string jsonFormLinkDefinition;

    protected void Page_Load(object sender, System.EventArgs e)
    {
        var linkDefinition = this.GetLinkDefinition() as FormLinkDefinition;
        decimal? estoque = 0;
        if (linkDefinition != null)
        {
            Criteria crit = new Criteria("A.HANDLE = :HANDLE");
            crit.Parameters.Add("HANDLE", linkDefinition.WhereClause.Parameters[0].Value.ToString());
            
            vertical = Entity.Get(EntityDefinition.GetByName(linkDefinition.TargetEntityDefinitionName), crit);

            if (vertical != null)
            {
                produto = new CrmProduto();
                produto.Handle          = vertical.Handle.Value;
                produto.NomeProduto     = ((EntityAssociation)vertical.Fields["PRODUTO"]).Instance.Fields["NOME"].ToString();
                produto.Oportunidade    = ((EntityAssociation)vertical.Fields["OPORTUNIDADE"]).Handle.Value;
                produto.Produto         = ((EntityAssociation)vertical.Fields["PRODUTO"]).Handle.Value;
                produto.Versao          = Convert.ToInt32(vertical.Fields["VERSAO"].ToString());
                produto.ComImpostos     = (bool)vertical.Fields["COMIMPOSTOS"];
                produto.ForaEscopo      = (vertical.Fields["FORAESCOPO"] !=null? vertical.Fields["FORAESCOPO"].ToString():"");
                produto.PropostaLuLum   = (bool)vertical.Fields["PROPOSTALULUM"];
                produto.PropostaLocacao = (bool)vertical.Fields["PROPOSTALOCACAO"];
                produto.PropostaSaas    = (bool)vertical.Fields["PROPOSTASAAS"];
                produto.FormaPagamento  = (vertical.Fields["FORMAPAGAMENTO"] !=null? vertical.Fields["FORMAPAGAMENTO"].ToString():"");
                produto.Status          = ((Benner.Tecnologia.Common.ListItem)vertical.Fields["STATUS"]).Value;
                produto.CondicaoImplantacao  = (vertical.Fields["CONDICAOIMPLANTACAO"] != null ? vertical.Fields["CONDICAOIMPLANTACAO"].ToString() : "");

                if (((EntityAssociation)vertical.Fields["TABELAPRECO"]).Handle.IsValid())
                    produto.TabelaPreco = GetTabelasProduto();
		
                if(((Benner.Tecnologia.Common.ListItem)vertical.Fields["TIPOVENDA"]).HasValue())
                    produto.TipoVenda = ((Benner.Tecnologia.Common.ListItem)vertical.Fields["TIPOVENDA"]).Value;
		
                
		if (((Benner.Tecnologia.Common.ListItem)vertical.Fields["CATEGORIA"]).HasValue())
                    produto.Categoria = ((Benner.Tecnologia.Common.ListItem)vertical.Fields["CATEGORIA"]).Value;

		
                int tipo = ((Benner.Tecnologia.Common.ListItem)((EntityAssociation)vertical.Fields["PRODUTO"]).Instance.Fields["TIPOUSUARIO"]).Value;
		
                produto.ProdutosDisponiveis = GetProdutosDaVertical();
                produto.ProdutosSelecionados = GetProdutosSelecionadosDaVertical();
                produto.EscopoSelecionado = GetEscopoSelecionadoDaVertical();
		

                tabelas = JsonConvert.SerializeObject(GetTabelasFilial());
                jsonRecursos = JsonConvert.SerializeObject(ListTiposRecursos());
                jsonImpostos = JsonConvert.SerializeObject(GetImpostos());
                jsonTiposUsuarios = JsonConvert.SerializeObject(GetTipoUsuarios());
            }

            jsonProduto = JsonConvert.SerializeObject(produto);

        }
    }

    private List<CrmProdutoItem> GetProdutosDaVertical()
    {
        try
        {
            List<CrmProdutoItem> itensVertical = new List<CrmProdutoItem>();

            Criteria crit = new Criteria("A.PRODUTO = :PRODUTO");
            crit.Parameters.Add("PRODUTO", produto.Produto);

            List<EntityBase> resultado = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PRODUTOITENS"), crit);

            foreach (EntityBase aux in resultado)
            {
                CrmProdutoItem item = new CrmProdutoItem();
                itensVertical.Add(StartProduto(item, aux));
            }

            return itensVertical;
        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o GetProdutosDaVertical()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }

    private List<CrmProdutoItem> GetProdutosSelecionadosDaVertical()
    {
        try
        {
            List<CrmProdutoItem> itensVertical = new List<CrmProdutoItem>();

            Criteria crit = new Criteria(@" A.HANDLE IN (
                                            SELECT ITEM 
                                            FROM K_CRM_PESSOAOPORTUNIDADESITENS
                                            WHERE PRODUTO = :PRODUTO)");
            crit.Parameters.Add("PRODUTO", produto.Handle);

            List<EntityBase> resultado = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PRODUTOITENS"), crit);

            foreach (EntityBase aux in resultado)
            {
                CrmProdutoItem item = new CrmProdutoItem();
                itensVertical.Add(StartProduto(item, aux));
            }

            return itensVertical;
        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o GetProdutosSelecionadosDaVertical()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }

    private List<CrmProdutoItemEscopo> GetEscopoSelecionadoDaVertical()
    {
        try
        {
            List<CrmProdutoItemEscopo> escopoVertical = new List<CrmProdutoItemEscopo>();

            Criteria crit = new Criteria(@" A.ITEM IN (
                                            SELECT HANDLE 
                                            FROM K_CRM_PESSOAOPORTUNIDADESITENS 
                                            WHERE PRODUTO = :PRODUTO)");

            crit.Parameters.Add("PRODUTO", produto.Handle);

            List<EntityBase> resultado = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESATIV"), crit);

            foreach (EntityBase aux in resultado)
                escopoVertical.Add(StartEscopo(aux));

            return escopoVertical;
        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o GetEscopoSelecionadoDaVertical()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }

    private List<CrmProdutoItem> GetProdutosDoPacote(long? pacoteHandle)
    {
        try
        {
            List<CrmProdutoItem> itensPacote = new List<CrmProdutoItem>();

            Criteria crit = new Criteria(@"A.HANDLE IN (
                                            SELECT ITEM
                                            FROM K_CRM_PRODUTOITENSPACOTE
                                            WHERE  PACOTE = :PACOTE)");
            crit.Parameters.Add("PACOTE", pacoteHandle);

            List<EntityBase> resultado = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PRODUTOITENS"), crit);

            foreach (EntityBase aux in resultado)
            {
                CrmProdutoItem item = new CrmProdutoItem();
                itensPacote.Add(StartProduto(item, aux));
            }

            return itensPacote;

        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o GetProdutosDoPacote()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }
    
    private List<CrmTabelasPreco> GetTabelasFilial()
    {
        try
        {
            List<CrmTabelasPreco> tabelas = new List<CrmTabelasPreco>();

            Criteria crit = new Criteria(@" (A.PRODUTO = :PRODUTO OR A.PRODUTO IS NULL)
                                        AND A.INATIVO = 'N'
                                        AND GETDATE() BETWEEN A.DATAINICIO AND A.DATAFIM
                                        AND A.HANDLE IN ( 
                                        SELECT TABELAPRECO 
                                        FROM K_CRM_TABELASPRECOFILIAIS 
                                        WHERE FILIAL = :FILIAL)");

            crit.Parameters.Add("FILIAL", Branch.Current.Handle);
            crit.Parameters.Add("PRODUTO", produto.Produto);

            List<EntityBase> resultado = Entity.GetMany(EntityDefinition.GetByName("K_CRM_TABELASPRECO"), crit);

            foreach (EntityBase aux in resultado)
                tabelas.Add(StartTabela(aux));

            return tabelas;
        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o GetTabelasFilial()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }

    private CrmTabelasPreco GetTabelasProduto()
    {
        try
        {
            List<CrmTabelasPreco> tabelas = new List<CrmTabelasPreco>();

            Criteria crit = new Criteria(@" A.INATIVO = 'N'
                                        AND GETDATE() BETWEEN A.DATAINICIO AND A.DATAFIM
                                        AND A.HANDLE IN ( 
                                        SELECT TABELAPRECO 
                                        FROM K_CRM_PESSOAOPORTUNIDADESPROD
                                        WHERE HANDLE = :HANDLE)");

            crit.Parameters.Add("HANDLE", produto.Handle);

            EntityBase resultado = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_TABELASPRECO"), crit);

            return StartTabela(resultado);
        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o GetTabelasProduto()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }

    private List<CrmTiposRecursos> ListTiposRecursos()
    {
        try
        {
            List<CrmTiposRecursos> tabelas = new List<CrmTiposRecursos>();

            List<EntityBase> resultado = Entity.GetAll(EntityDefinition.GetByName("K_CRM_TIPOSRECURSOSFILIAIS"));

            foreach (EntityBase aux in resultado)
                tabelas.Add(StartTiposFilial(aux));

            return tabelas;

        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o ListTiposRecursos()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }

    private CrmTiposRecursos GetTiposRecursos(long? handleTipoRecurso)
    {
        try
        {
            CrmTiposRecursos tabelas = new CrmTiposRecursos();

            Criteria crit = new Criteria("A.TIPORECURSO = :TIPORECURSO");
            crit.Parameters.Add("TIPORECURSO", handleTipoRecurso);

            EntityBase resultado = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_TIPOSRECURSOSFILIAIS"), crit);

            return StartTiposFilial(resultado);
        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o GetTiposRecursos()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }

    private List<CrmImposto> GetImpostos()
    {
        try
        {
            List<CrmImposto> tabelas = new List<CrmImposto>();

            Criteria crit = new Criteria(@" A.EMPRESA   = :EMPRESA 
                                        AND A.FILIAL    = :FILIAL
                                        AND GETDATE() BETWEEN A.DATAINICIO AND A.DATAFIM");

            crit.Parameters.Add("EMPRESA", Company.Current.Handle);
            crit.Parameters.Add("FILIAL", Branch.Current.Handle);

            List<EntityBase> resultado = Entity.GetMany(EntityDefinition.GetByName("K_CRM_IMPOSTOS"), crit);

            foreach (EntityBase aux in resultado)
                tabelas.Add(StartImposto(aux));

            return tabelas;
        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o GetImpostos()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }

    private List<CrmProdutoUsuario> GetTipoUsuarios()
    {
        try
        {
            List<CrmProdutoUsuario> tabelas = new List<CrmProdutoUsuario>();

            Criteria crit = new Criteria(@" A.PRODUTO   = :PRODUTO");

            crit.Parameters.Add("PRODUTO", produto.Produto);

            List<EntityBase> resultado = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PRODUTOUSUARIOS"), crit);

            foreach (EntityBase aux in resultado)
                tabelas.Add(StartTipoUsuario(aux));

            return tabelas;

        }
        catch (Exception e)
        {
            Response.Write("<script>console.log('Erro ao Iniciar o GetTipoUsuarios()!!');</script>");
            Response.Write("<script>console.log('" + e.Message + "');</script>");
            Response.Write("<script>console.log('" + e.StackTrace + "');</script>");

            return null;
        }
    }

    private CrmProdutoItem StartProduto(CrmProdutoItem item,EntityBase aux)
    {
        if (((EntityAssociation)aux.Fields["TABELAPRECO"]).Handle.IsInvalid())
            throw new BusinessException("Sem tabela de preços!");

        item.Handle = aux.Handle.Value;
        item.TabelaPreco = ((EntityAssociation)aux.Fields["TABELAPRECO"]).Handle.Value;
        item.Nome = aux.Fields["NOME"].ToString();
        item.Categoria = ((Benner.Tecnologia.Common.ListItem)aux.Fields["CATEGORIA"]).Text;
        item.TipoItem = ((Benner.Tecnologia.Common.ListItem)aux.Fields["TIPOITEM"]).Value;
        item.MetodoVenda = "";
        item.Lu = Convert.ToDecimal(aux.Fields["LU"].ToString());
        item.Lum = Convert.ToDecimal(aux.Fields["LUM"].ToString());
        item.Locacao = Convert.ToDecimal(aux.Fields["LOCACAO"].ToString());
        item.Saas = Convert.ToDecimal(aux.Fields["SAAS"].ToString());
        item.Quantidade = 1;

        if (item.TipoItem == 2)
            item.ItensPacote = GetProdutosDoPacote(item.Handle);

        item.NecessitaQuantidade = (bool)((EntityAssociation)aux.Fields["VENDA"]).Instance.Fields["PRECISAQUANTIDADE"];
        item.PrecoFixo = (bool)((EntityAssociation)aux.Fields["VENDA"]).Instance.Fields["PRECOFIXO"];

        return item;
    }

    private CrmProdutoItem StartProdutoOportunidade(EntityBase aux)
    {
        CrmProdutoItem item = new CrmProdutoItem();
        item.OportunidadeItem = aux.Handle.Value;

        EntityBase auxItem = ((EntityAssociation)aux.Fields["ITEM"]).Instance;

        StartProduto(item, auxItem);

        return item;
    }

    private CrmTabelasPreco StartTabela(EntityBase aux)
    {
        CrmTabelasPreco item    = new CrmTabelasPreco();
        item.Handle             = aux.Handle.Value;
        item.Nome               = aux.Fields["NOME"].ToString();

        return item;
    }

    private CrmTiposRecursos StartTiposFilial(EntityBase aux)
    {
        CrmTiposRecursos item       = new CrmTiposRecursos();

        item.Handle                 = ((EntityAssociation)aux.Fields["TIPORECURSO"]).Handle;
        item.Recurso                = ((EntityAssociation)aux.Fields["TIPORECURSO"]).Instance.Fields["RECURSO"].ToString();
        item.Servico                = ((EntityAssociation)aux.Fields["TIPORECURSO"]).Instance.Fields["SERVICO"].ToString();
        item.ValorHora              = Convert.ToDecimal(aux.Fields["VALORHORA"].ToString());
        item.ValorHoraOportunidade  = Convert.ToDecimal(aux.Fields["VALORHORA"].ToString());

        Criteria critRecOportunidade = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.TIPORECURSO = :TIPORECURSO");
        critRecOportunidade.Parameters.Add("OPORTUNIDADE", produto.Oportunidade);
        critRecOportunidade.Parameters.Add("TIPORECURSO", aux.Handle);

        EntityBase recursoOportunidade = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESREC"), critRecOportunidade);

        if (recursoOportunidade != null)
            item.ValorHoraOportunidade = Convert.ToDecimal(recursoOportunidade.Fields["VALORHORA"].ToString());

        return item;
    }

    private CrmImposto StartImposto(EntityBase aux)
    {
        CrmImposto item         = new CrmImposto();
        item.Handle             = aux.Handle.Value;
        item.Nome               = aux.Fields["NOME"].ToString();
        item.Aliquota           = Convert.ToDecimal(aux.Fields["ALIQUOTA"].ToString());
        item.DataInicio         = (DateTime)aux.Fields["DATAINICIO"];
        item.DataFim            = (DateTime)aux.Fields["DATAFIM"];

        return item;
    }

    private CrmProdutoUsuario StartTipoUsuario(EntityBase aux)
    {
        Criteria crit = new Criteria(@" A.PRODUTO = :PRODUTO AND 
                                        A.PRODUTOUSUARIO = :PRODUTOUSUARIO");

        crit.Parameters.Add("PRODUTO", produto.Handle);
        crit.Parameters.Add("PRODUTOUSUARIO", aux.Handle.Value);

        EntityBase resultado = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADESPRUSU"), crit);

        CrmProdutoUsuario item = new CrmProdutoUsuario();
        item.Handle = aux.Handle.Value;
        item.Nome = aux.Fields["NOME"].ToString();
        item.PorcentagemValor = Convert.ToDecimal(aux.Fields["PORCENTAGEMDOVALOR"].ToString());

        if (resultado != null)
            item.Quantidade = Convert.ToInt32(resultado.Fields["QUANTIDADE"].ToString());

        return item;
    }

    private CrmProdutoItemEscopo StartEscopo(EntityBase aux)
    {
        
        EntityBase oportunidadeItem = ((EntityAssociation)aux.Fields["ITEM"]).Instance;
        EntityBase produtoItem = ((EntityAssociation)oportunidadeItem.Fields["ITEM"]).Instance;
        EntityBase tipoRecurso = ((EntityAssociation)aux.Fields["TIPORECURSO"]).Instance;
        
        CrmProdutoItemEscopo item = new CrmProdutoItemEscopo();
        item.Handle = aux.Handle.Value;
        item.OportunidadeItem = oportunidadeItem.Handle.Value;
        item.Nome = aux.Fields["NOME"].ToString();
        item.Item = produtoItem.Handle.Value;
        item.ItemNome = produtoItem.Fields["NOME"].ToString();
        item.HorasBase = Convert.ToDecimal(aux.Fields["HORASBASE"].ToString());
        item.HorasEditada = Convert.ToDecimal(aux.Fields["HORAS"].ToString());
        item.TipoRecurso = GetTiposRecursos(((EntityAssociation)aux.Fields["TIPORECURSO"]).Handle.Value);
        item.Ordem = aux.Fields["ORDEM"].ToInt();
        
        return item;
    }
}