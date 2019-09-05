using System.Collections.Generic;
using WebApiAssetMate.Models;

namespace WebApiAssetMate.Repository.Interfaces
{
    interface IAsset
    {
        List<Asset> getAllAsset();
    }
}
