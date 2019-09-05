using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Asset")]
    public partial class Asset
    {

        DatabaseContext mDBContext;

        public Asset()
        {
            mDBContext = new DatabaseContext();
        }
        [Key]
        public int AssetId { get; set; }
        public string AssetTitle { get; set; }
        public string ModelNumber { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public System.DateTime InstallationDate { get; set; }
        public int InstallationLocationTypeIdFK { get; set; }
        public string InstalledLocation { get; set; }
        public string UserGuideBook { get; set; }
        public string CheckingDuration { get; set; }
        public int DurationTypeIdFK { get; set; }
        public string AssetCode { get; set; }
        public string Warrenty { get; set; }
        public int WarrantyDurationTypeIdFK { get; set; }
        public int SupplierIdFK { get; set; }
        public int DepartmentId { get; set; }
        public int ManufacturerIdFK { get; set; }
        public System.DateTime CreatedOn { get; }
        public System.DateTime UpdatedOn { get; }
        public int IsDeleted { get; set; }


    }
}