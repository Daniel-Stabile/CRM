using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmPerformancePlanilha
/// </summary>
namespace Models.Crm
{
    public class CrmPerformancePlanilha
    {
        public string Nome { get; set; }
        public List<string> ListaCampos = new List<string>();

        public CrmPerformancePlanilha()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}