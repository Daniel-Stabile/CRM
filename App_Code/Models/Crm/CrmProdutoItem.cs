using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de ProdutoItem
/// </summary>
namespace Models.Crm
{
    public class CrmProdutoItem
    {
        public long? Produto { get; set; }
        public long? Handle { get; set; }
        public long? OportunidadeItem { get; set; }
        public long? TabelaPreco { get; set; }
        public long? Tipo { get; set; }
        public string Categoria { get; set; }
        public long? TipoItem { get; set; }
        public string MetodoVenda { get; set; }
        public string Nome { get; set; }
        public decimal? Lu { get; set; }
        public decimal? Lum { get; set; }
        public decimal? Locacao { get; set; }
        public decimal? Saas { get; set; }
        public bool Selecionado { get; set; }
        public bool NecessitaQuantidade { get; set; }
        public bool PrecoFixo { get; set; }
        public int Quantidade { get; set; }
        public List<CrmProdutoItem> ItensPacote = new List<CrmProdutoItem>();

        public CrmProdutoItem()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}