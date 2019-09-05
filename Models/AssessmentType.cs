using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("AssessmentType")]
    public class AssessmentType
    {
        DatabaseContext mDBContext;
        public AssessmentType()
        {
            mDBContext = new DatabaseContext();
        }

        [Key]

        public int AssessmentTypeId { get; set; }
        public string Title { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int IsDeleted { get; set; }
    }
}