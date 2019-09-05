using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Questionoption")]
    public class Questionoption
    {
        DatabaseContext mDBContext;
        public Questionoption()
        {
            mDBContext = new DatabaseContext();
        }

        public static int QuestionId { get; internal set; }
        [Key]
        public int QuestionOptionId { get; set; }
        public string Title { get; set; }
        public int IsDanger { get; set; }
        public int QuestionIdFK { get; set; }
        public string IsCorrect { get; set; }
        public System.DateTime CreatedOn { get;  }
        public System.DateTime UpdatedOn { get;  }
        public int IsDeleted { get; set; }
    }
}