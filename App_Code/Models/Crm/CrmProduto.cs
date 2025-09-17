using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmOportunidadeProd
/// </summary>
namespace Models.Crm
{
    public class CrmProduto
    {
        public long? Handle { get; set; }
        public long? Oportunidade { get; set; }
        public long? Produto { get; set; }
        public string NomeProduto { get; set; }
        public CrmTabelasPreco TabelaPreco = new CrmTabelasPreco();
        public int? Versao { get; set; }
        public int? TipoVenda { get; set; }
        public bool ComImpostos { get; set; }
        public bool PropostaLuLum { get; set; }
        public bool PropostaLocacao { get; set; }
        public bool PropostaSaas { get; set; }
        public string ForaEscopo { get; set; }
        public string FormaPagamento { get; set; }
        public string CondicaoImplantacao { get; set; }
        public int Categoria { get; set; }
        public int Status { get; set; }
        public List<string> CategoriaTabelaPreco =  new List<string>();
        public List<CrmProdutoItem> ProdutosDisponiveis = new List<CrmProdutoItem>();
        public List<CrmProdutoItem> ProdutosSelecionados = new List<CrmProdutoItem>();
        public List<CrmProdutoItemEscopo> EscopoSelecionado = new List<CrmProdutoItemEscopo>();

        public CrmProduto()
        {
            CategoriaTabelaPreco.Add("A");
            CategoriaTabelaPreco.Add("B");
            CategoriaTabelaPreco.Add("C");
        }
    }
}