using System.Collections.Generic;
using System.Linq;
using WebApiAssetMate.Context;
using WebApiAssetMate.Models;
using WebApiAssetMate.Repository.Interfaces;

namespace WebApiAssetMate.Repository
{
    public class AssetRepo : IAsset
    {
        DatabaseContext query;


        public AssetRepo()
        {
            query = new DatabaseContext();
        }

        public List<Asset> getAllAsset()
        {
            var assets = query.Asset.ToList();
            return assets;

        }

        //public IEnumerable<Asset> getAssetById(int id)
        //{

        //    List<Asset> assets = this.query.Asset.ToList();
        //    List<Department> departments = this.query.Department.ToList();

        //    var query = from a in assets
        //                join b in departments on a.DepartmentId equals b.DepartmentId into table1
        //                from b in table1.DefaultIfEmpty()
        //                select new JoinTable { GetAsset = a, GetDepartment = b };
        //    return query.De;

        //}


    }
}