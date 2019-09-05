using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApiAssetMate.Context;
using WebApiAssetMate.Models;
using WebApiAssetMate.Repository.Interfaces;

namespace WebApiAssetMate.Repository
{
    public class HomeAssetsRepo:IHomeAssets
    {

        DatabaseContext db;
        public HomeAssetsRepo()
        {
            db = new DatabaseContext();
        }


        public List<Asset> getAllAssets()
        {
            
            var usercount = (from a in db.Asset 
                           where a.IsDeleted == 0
                           select new Asset()).Count();
            return usercount;


        }
    }
    }