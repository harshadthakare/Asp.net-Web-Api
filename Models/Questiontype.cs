using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Questiontype")]
    public partial class Questiontype
    {
        DatabaseContext mDBContext;
        public Questiontype()
        {
            mDBContext = new DatabaseContext();
        }

        [Key]
        public int QuestionTypeId { get; set; }
        public string Title { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int IsDeleted { get; set; }
    }
}