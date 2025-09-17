using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmProdutoItemEscopo
/// </summary>
namespace Models.Crm
{

    public class CrmProdutoItemEscopo
    {
        public long? Handle { get; set; }
        public long? OportunidadeItem { get; set; }
        public long? Item { get; set; }
        public int Ordem { get; set; }
        public string ItemNome { get; set; }
        public string Nome { get; set; }
        public decimal? HorasBase { get; set; }
        public decimal? HorasEditada { get; set; }
        public bool Disabled = true;
        public CrmTiposRecursos TipoRecurso = new CrmTiposRecursos();

        public CrmProdutoItemEscopo()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}
