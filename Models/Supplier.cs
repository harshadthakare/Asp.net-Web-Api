using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Supplier")]
    public partial class Supplier
    {
        DatabaseContext mDBContext;
        public Supplier()
        {
            mDBContext = new DatabaseContext();
        }

        [Key]
        public int SupplierId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string BusinessName { get; set; }
        public string MobileNumber { get; set; }
        public string EmailId { get; set; }
        public System.DateTime CreatedOn { get; }
        public System.DateTime UpdatedOn { get; }
        public int IsDeleted { get; set; }
    }
}