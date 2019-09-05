using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApiAssetMate.Models;




namespace WebApiAssetMate.Repository.Interfaces
{
    interface IQuestion
    {
        List<Object> getQuestionDetails(int categoryId,int assetmentTypeIdFK);
        List<Object> getQuestionoptions(int questionId);
        
    }
}
