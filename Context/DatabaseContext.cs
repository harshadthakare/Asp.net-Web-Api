using System;
using System.Data.Entity;
using WebApiAssetMate.Models;

namespace WebApiAssetMate.Context
{
    public class DatabaseContext : DbContext
    {

        public DatabaseContext() : base("DefaultConnection")
        {

        }
        public DbSet<Answer> Answer { get; set; }
        public DbSet<Assessment> Assessment { get; set; }
        public DbSet<AssessmentType> AssessmentType { get; set; }
        public DbSet<Asset> Asset { get; set; }
        public DbSet<Assetcatrelation> Assetcatrelation { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Department> Department { get; set; }
        public DbSet<DurationType> DurationType { get; set; }

        
        public DbSet<Installationlocationtype> Installationlocationtype { get; set; }
        public DbSet<Manufracturer> Manufracturer { get; set; }
        public DbSet<Notification> Notification { get; set; }
        public DbSet<Organization> Organization { get; set; }
        public DbSet<Question> Question { get; set; }
        public DbSet<Questionoption> Questionoption { get; set; }
        public DbSet<Questioncatrelation> Questioncatrelation { get; set; }
        public DbSet<Supplier> Supplier { get; set; }
        public DbSet<User> User { get; set; }
        public DbSet<Questiontype> Questiontype { get; set; }
    }
}