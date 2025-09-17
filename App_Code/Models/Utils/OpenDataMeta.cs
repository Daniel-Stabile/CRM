namespace Controllers.Models.Utils
{
    /// <summary>
    /// Meta informações referentes à API requisitada.
    /// </summary>
    public class OpenDataMeta : Meta
    {
        /// <summary>
        /// Número total de registros no resultado.
        /// </summary>
        /// <example>1</example>
        public int? TotalRecords { get; set; }

        /// <summary>
        /// Número total de páginas no resultado.
        /// </summary>
        /// <example>1</example>
        public int? TotalPages { get; set; }
    }
}