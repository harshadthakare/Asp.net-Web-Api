using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Installationlocationtype")]
    public partial class Installationlocationtype
    {

        DatabaseContext mDBContext;
        public Installationlocationtype()
        {
            mDBContext = new DatabaseContext();
        }
        [Key]
        public int InstallationLocationTypeId { get; set; }
        public string Type { get; set; }
        public System.DateTime CreatedOn { get; }
        public System.DateTime UpdatedOn { get; }
        public int IsDeleted { get; set; }

    }
}