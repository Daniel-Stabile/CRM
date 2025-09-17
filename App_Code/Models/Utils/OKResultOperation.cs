using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Twilio.Rest;

namespace Controllers.Models.Utils
{
    public class OKResultOperation<T>
    {
        public OKResultOperation()
        {
            Data = default(T);
            Meta = new Meta();
        }

        public OKResultOperation(T data)
        {
            Data = data;
            Meta = new Meta();
        }

        #region Propriedades

        public T Data { get; set; }

        public Meta Meta { get; set; }

        public Links Links { get; set; }

        #endregion
    }
}
