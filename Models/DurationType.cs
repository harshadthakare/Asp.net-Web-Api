using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("DurationType")]
    public partial class DurationType
    {
        DatabaseContext mDBContext;
        public DurationType()
        {
            mDBContext = new DatabaseContext();
        }
        [Key]
        public int DurationTypeId { get; set; }
        public string DurationName { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int IsDeleted { get; set; }
    }
}