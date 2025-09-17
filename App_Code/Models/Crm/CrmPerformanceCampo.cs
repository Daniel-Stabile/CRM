using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmPerformanceCampo
/// </summary>
namespace Models.Crm
{
    public class CrmPerformanceCampo
    {
        public string Nome { get; set; }
        public List<CrmPerformanceTipo> resultados = new List<CrmPerformanceTipo>();

        public CrmPerformanceCampo()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}