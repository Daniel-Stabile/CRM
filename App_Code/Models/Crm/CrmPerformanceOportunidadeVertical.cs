using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmPerformanceOportunidadeVertical
/// </summary>
namespace Models.Crm
{
    public class CrmPerformanceOportunidadeVertical
    {
        public string Handle { get; set; }
        public CrmVertical Vertical { get; set; }
        public string ValorTotal { get; set; }
        public string ValorLu { get; set; }
        public string ValorLum { get; set; }
        public string ValorEscopo { get; set; }

        public CrmPerformanceOportunidadeVertical()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}