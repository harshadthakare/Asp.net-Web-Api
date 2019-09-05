using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Questioncatrelation")]
    public partial class Questioncatrelation
    {
        DatabaseContext mDBContext;
        public Questioncatrelation()
        {
            mDBContext = new DatabaseContext();
        }
        [Key]

        public int QuestionCatRelationId { get; set; }
        public int QuestionIdFK { get; set; }
        public int CategoryIdFK { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int IsDeleted { get; set; }

        public virtual Category Category { get; set; }
        public virtual Question Question { get; set; }
    }
}