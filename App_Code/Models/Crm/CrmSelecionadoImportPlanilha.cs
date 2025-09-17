using Models.Generico;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmSelecionadoImportPlanilha
/// </summary>
namespace Controllers.Models.Crm
{
    public class CrmSelecionadoImportPlanilha
    {
        public CrmUnidade Unidade { get; set; }
        public CrmOrigem Origem { get; set; }
        public Usuario UsuarioGDQ { get; set; }
        public Usuario UsuarioExecutivo { get; set; }
        public PlanilhaCelula CampoCNPJ { get; set; }
        public HttpPostedFileBase Files { get; set; }

        public CrmSelecionadoImportPlanilha()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}