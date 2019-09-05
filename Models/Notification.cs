using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Notification")]
    public partial class Notification
    {

        DatabaseContext mDBContext;
        public Notification()
        {
            mDBContext = new DatabaseContext();
        }

        [Key]
        public int NotificationId { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public string Message { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int IsDeleted { get; set; }
    }
}