using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApiAssetMate.Models;

namespace WebApiAssetMate.Repository.Interfaces
{
    interface IHomeAssets
    {
        List<Asset> getAllAssets();
       // List<Object> getAlertCount(int userId);
       //  List<Object> getAuditCout(int userId);
       // List<Object> getMaintenanceCount(int userId);


    }
}
