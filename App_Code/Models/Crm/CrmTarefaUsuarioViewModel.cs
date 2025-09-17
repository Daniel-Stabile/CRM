using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Controllers.Models.Crm
{

/// <summary>
/// Descrição resumida de CrmTarefaUsuarioViewModel
/// </summary>
public class CrmTarefaUsuarioViewModel
{
    public CrmTarefaUsuarioViewModel()
    {
        Status = string.Empty;
        UsuarioSolicitacao = string.Empty;
        DataInclusao = string.Empty;
        DataConclusao = string.Empty;
        RetornoTarefa = string.Empty;
        DetalhesSolicitacao = string.Empty;
        Empresa = string.Empty;
        Cnpj = string.Empty;
        Vertical = string.Empty;
    }

    public string UsuarioSolicitacao { get; set; }
    public string DataInclusao { get; set; }
    public string DetalhesSolicitacao { get; set; }
    public string Status { get; set; } 
    public string DataConclusao { get; set; }
    public string RetornoTarefa { get; set; }
    public string ResponsavelTarefa { get; set; }
    public string Empresa { get; set; }
    public string Cnpj { get; set; }
    public string Vertical { get; set; }
    
}
}