using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Answer")]
    public class Answer
    {
        DatabaseContext mDBContext;
        public Answer()
        {
            mDBContext = new DatabaseContext();
        }
        [Key]
        public int AnswerId { get; set; }
        public int AssesmentIdFK { get; set; }
        public int QuestionIdFK { get; set; }
        public int QuestionOptionIdFK { get; set; }
        public string Value { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int IsDeleted { get; set; }
    }
}