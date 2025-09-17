using Benner.Tecnologia.Wes.Components.WebApp.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using Twilio.Rest;
using Controllers.Models.Utils;

namespace Controllers
{
    /// <summary>
    /// Descrição resumida de BaseController
    /// </summary>
    public abstract class BaseController : EslController
    {
        public BaseController()
        {

        }

        protected IHttpActionResult Paginate<T>(IEnumerable<T> data, string url, int? page = 1, int? pageSize = 25) where T : class
        {
            var paginatedData = data.ResultadoSearch(url, page, pageSize);
            return Ok(paginatedData);
        }

        public IHttpActionResult Ok<T>(IEnumerable<T> value, string url, int? page = 1, int? pageSize = 25) where T : class
        {
            return Paginate(value, url, page, pageSize);
        }
    }

    public static class GetPagedExtension
    {
        /// <summary>
        /// GetPaged
        /// </summary>
        /// <typeparam name="T">Entity</typeparam>
        /// <param name="query">Query</param>  
        /// <param name="page">Page</param>
        /// <param name="pageSize">Pagesize</param>
        /// <returns>Return ResultadoPesquisa</returns>
        public static OKResultSearch<IEnumerable<T>> ResultadoSearch<T>(this IEnumerable<T> query, string url, int? page = 0, int? pageSize = 0) where T : class
        {
            var totalItems = query.Count();
            var totalPages = (int)Math.Ceiling(totalItems / (double)pageSize);
            return new OKResultSearch<IEnumerable<T>>
            {
                Data = query.DataPaged(page, pageSize),
                Links = new Links(url,page, pageSize, totalPages),
                Meta = new OpenDataMeta()
                {
                    TotalPages = totalPages,
                    TotalRecords = totalItems,
                    RequestDateTime = DateTime.Now
                }
            };
        }

        /// <summary>
        /// GetOneData
        /// </summary>
        /// <typeparam name="T">Entity</typeparam>
        /// <param name="query">Query</param>
        /// <returns>ResultadoPesquisa</returns>
        public static OKResultOperation<T> ResultadoOperation<T>(this T query, string url) where T : class
        {
            return new OKResultOperation<T>
            {
                Data = query,
                Links = new Links(url),
                Meta = new Meta()
                {
                    RequestDateTime = DateTime.Now
                }
            };
        }
    }

    public static class GetDataPaged
    {
        public static IEnumerable<T> DataPaged<T>(this IQueryable<T> query, int? page = 0, int? pageSize = 0) where T : class
        {
            int itensPerPage = pageSize <= 0 || pageSize == null ? query.Count() : Convert.ToInt32(pageSize);
            int paginaNumber = page <= 0 || page == null ? 1 : Convert.ToInt32(page);
            var itensPage = (paginaNumber - 1) * itensPerPage;
            var Result = query.Skip(itensPage).Take(itensPerPage);
            return Result;
        }

        public static IEnumerable<T> DataPaged<T>(this IEnumerable<T> query, int? page = 0, int? pageSize = 0) where T : class
        {
            int itensPerPage = pageSize <= 0 || pageSize == null ? query.Count() : Convert.ToInt32(pageSize);
            int paginaNumber = page <= 0 || page == null ? 1 : Convert.ToInt32(page);
            var itensPage = (paginaNumber - 1) * itensPerPage;
            var Result = query.Skip(itensPage).Take(itensPerPage);
            return Result;
        }
    }
}
