using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{

    [Table("Question")]
    public class Question
    {
        DatabaseContext mDBContext;
        public Question()
        {
            mDBContext = new DatabaseContext();
        }
        [Key]
        public int QuestionId { get; set; }
        public string Title { get; set; }
        public int QuestionTypeIdFK { get; set; }
        public System.DateTime CreatedOn { get; }
        public System.DateTime UpdatedOn { get; }
        public int IsDeleted { get; set; }
        public int AssetmentTypeIdFK { get; set; }
    }
}