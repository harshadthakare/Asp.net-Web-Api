using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Category")]
    public partial class Category
    {


        DatabaseContext mDBContext;
        public Category()
        {
            mDBContext = new DatabaseContext();
        }


        [Key]
        public int CategoryId { get; set; }
        public int ParentId { get; set; }
        public string Title { get; set; }
        public System.DateTime CreatedOn { get; }
        public System.DateTime UpdatedOn { get; }
        public int IsDeleted { get; set; }
    }
}