using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("Department")]
    public partial class Department
    {


        DatabaseContext mDBContext;
        public Department()
        {
            mDBContext = new DatabaseContext();
        }

        [Key]
        public int DepartmentId { get; set; }
        public int OrganizationIdFK { get; set; }
        public int ParentIdFK { get; set; }
        public string DepartmentTitle { get; set; }
        public DateTime CreatedOn { get; }
        public DateTime UpdatedOn { get; }
        public int IsDeleted { get; set; }


    }
}