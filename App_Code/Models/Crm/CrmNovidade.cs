using Models.Generico;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmNovidade
/// </summary>
namespace Models.Crm
{
    public class CrmNovidade
    {
        public int Handle               { get; set; }
        public string Titulo            { get; set; }
        public string Descricao         { get; set; }
        public string Data              { get; set; }
        public bool Fixada {  get; set; }
        public string LinkVideo         { get; set; }
        public Usuario Usuario          = new Usuario();

        public CrmNovidade()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}