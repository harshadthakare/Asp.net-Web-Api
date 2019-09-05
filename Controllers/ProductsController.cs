using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiAssetMate.Auth;
using WebApiAssetMate.Context;
using WebApiAssetMate.Models;
using WebApiAssetMate.Repository;
using WebApiAssetMate.Repository.Interfaces;

namespace WebApiAssetMate.Controllers
{
    // [RoutePrefix("api/[controller]/[action]")]
    public class ProductsController : ApiController
    {


        private DatabaseContext db = new DatabaseContext();
        IAsset repository;


        public ProductsController()
        {
            repository = new AssetRepo();
        }


        [JwtAuthentication]
        [HttpGet]
        [ActionName("getAllAsset")]
        [Route("api/Products/getAllAsset")]
        public IEnumerable<Asset> getAllAsset()
        {
            try
            {
                return repository.getAllAsset();
            }
            catch (System.Exception)
            {
                throw;
            }
        }

        // GET: api/Products/5
       
        [HttpGet]
        [JwtAuthentication]
        [ResponseType(typeof(Asset))]
        [ActionName("getAsset")]
        [Route("api/Products/getAsset/{id:int}")]
        public IHttpActionResult getAsset(string id)
        {
            DatabaseContext db = new DatabaseContext();

            var query = (
                            from a in db.Asset
                            join d in db.Department on a.DepartmentId equals d.DepartmentId
                            join s in db.Supplier on a.SupplierIdFK equals s.SupplierId
                            join m in db.Manufracturer on a.ManufacturerIdFK equals m.ManufracturerId
                            join d1 in db.DurationType on a.DurationTypeIdFK equals d1.DurationTypeId
                            join d2 in db.DurationType on a.WarrantyDurationTypeIdFK equals d2.DurationTypeId
                            join i in db.Installationlocationtype on a.InstallationLocationTypeIdFK equals i.InstallationLocationTypeId

                            where a.AssetCode == id && a.IsDeleted == 0 orderby a.CreatedOn descending  

                            select new
                            {
                                a.AssetId,
                                a.AssetTitle,
                                a.ModelNumber,
                                a.InstallationDate,
                                i.Type,
                                a.UserGuideBook,
                                a.CheckingDuration,
                                d1.DurationName,
                                a.Warrenty,
                                WarrentyDuration = d2.DurationName,
                                a.AssetCode,
                                Suppliername = (s.FirstName + " " + s.LastName),
                                d.DepartmentTitle,
                                m.ManufracturerName
                            }
                        );
            if (query == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(query);
            }


        }


        //[HttpGet]
        //[ActionName("getAsset")]
        //[Route("api/Products/getAsset/{id:int}")]
        //public IEnumerable<Asset> getAsset(int id)
        //{
        //   try
        //   {
        //       return repository.GetAssetById(id);
        //   }
        //   catch (System.Exception)
        //   {
        //       throw;
        //   }
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
