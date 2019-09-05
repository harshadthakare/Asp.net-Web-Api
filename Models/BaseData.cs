using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiAssetMate.Models
{
    public class BaseData
    {
        public int assetIdFK { get; set; }
        public int assetmentTypeIdFK { get; set; }
        public List<Answer> answers { get; set; }
    }
}