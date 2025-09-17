using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de KpiVertical
/// </summary>
namespace Models.Crm
{
    public class KpiVertical
    {
        public string Nome              { get; set; }
        public Decimal PrcVenda         { get; set; }
        public Decimal PrcFaturamento   { get; set; }

        public KpiVertical()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}
