using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Assessment")]
    public partial class Assessment
    {
        DatabaseContext mDBContext;
        public Assessment()
        {
            mDBContext = new DatabaseContext();
        }

        [Key]
        public int AssessmentId { get; set; }
        public int AssetIdFK { get; set; }
        public int AssessmentTypeIdFK { get; set; }
        public System.DateTime OnDate { get; set; }
        public int DoneBy { get; set; }
        public System.DateTime CreatedOn { get;  }
        public System.DateTime UpdatedOn { get; }
        public int IsDeleted { get; set; }

    }
}