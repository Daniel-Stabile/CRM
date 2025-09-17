using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Controllers.Models.Utils
{
    public class OKResultSearch<T>
    {
        protected int? Page { get; set; }
        protected int? PageSize { get; set; }

        public OKResultSearch()
        {
            Data = default(T);
            Meta = null;
        }

        public OKResultSearch(T data, int? page, int? pageSize)
        {
            Data = data;
            Page = page;
            PageSize = pageSize;
            Meta = new OpenDataMeta();
        }

        public OKResultSearch(T data, OpenDataMeta pag)
        {
            Data = data;
            Meta = pag;
        }

        #region Propriedades

        /// <summary>
        /// Objeto de Retorno
        /// </summary>
        public T Data { get; set; }

        /// <summary>
        /// Links Api
        /// </summary>
        public Links Links { get; set; }

        /// <summary>
        /// Dados de paginação
        /// </summary>
        public OpenDataMeta Meta { get; set; }

        #endregion


    }
}
