using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiAssetMate.Context;
using WebApiAssetMate.Models;
using WebApiAssetMate.Repository;
using WebApiAssetMate.Repository.Interfaces;

namespace WebApiAssetMate.Controllers
{
    public class AssetsHomeController : ApiController
    {
        DatabaseContext db = new DatabaseContext();

        IHomeAssets repository;
        public AssetsHomeController()
        {
            repository = new HomeAssetsRepo();
        }
        [HttpGet]
        public HttpResponseMessage  Get()
        {
            var mId = repository.getAllAssets();

            return Request.CreateErrorResponse(HttpStatusCode.OK,mId);
        }
    }
}
