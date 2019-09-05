using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Manufracturer")]
    public partial class Manufracturer
    {

        DatabaseContext mDBContext;
        public Manufracturer()
        {
            mDBContext = new DatabaseContext();
        }

        [Key]

        public int ManufracturerId { get; set; }
        public string ManufracturerName { get; set; }
        public System.DateTime CreatedOn { get; }
        public System.DateTime UpdatedOn { get; }
        public int IsDeleted { get; set; }
    }
}