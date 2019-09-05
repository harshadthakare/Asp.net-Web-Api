using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiAssetMate.Auth;

namespace WebApiAssetMate.Controllers
{
    public class ValuesController : ApiController
    {
        [JwtAuthentication]
        public string Get()
        {
            return "Hello";
        }
    }
}
