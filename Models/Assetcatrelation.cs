using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Assetcatrelation")]
    public class Assetcatrelation
    {
        DatabaseContext mDBContext;

        public Assetcatrelation()
        {
            mDBContext = new DatabaseContext();
        }
        [Key]
        public int AssetCatRelationId { get; set; }
        public int AssetIdFK { get; set; }
        public int CategoryIdFK { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int IsDeleted { get; set; }
    }
}