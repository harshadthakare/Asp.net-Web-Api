using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApiAssetMate.Models;
using WebApiAssetMate.Repository.Interfaces;
using WebApiAssetMate.Context;
using Newtonsoft.Json.Linq;

namespace WebApiAssetMate.Repository
{
    public class QuestionRepo : IQuestion
    {


        DatabaseContext db;
        public QuestionRepo()
        {
            db = new DatabaseContext();
        }
        public List<Object> getQuestionDetails(int catogoryId, int assetmentTypeIdFK)
        {
/*            subQuery = (from op in db.Questionoption
                        where op.QuestionIdFK == q.QuestionId
                        select new { op.Title }).ToArrayList();*/

     
            var query = (
                            from q in db.Question
                            join qt in db.Questiontype on q.QuestionTypeIdFK equals qt.QuestionTypeId
                            join qr in db.Questioncatrelation on q.QuestionId equals qr.QuestionIdFK

                            where qr.QuestionCatRelationId == catogoryId && q.AssetmentTypeIdFK == assetmentTypeIdFK && q.IsDeleted == 0
                            
                            select new {
                                          q.QuestionId,
                                          Title = q.Title,
                                          QuestionType = qt.Title
                                       } );

            return query.ToList<Object>();

        }

        public List<Object> getQuestionoptions(int questionId)
        {

            var query = (from e in db.Questionoption
                         join d in db.Question
                         on e.QuestionIdFK equals d.QuestionId
                        
                         where e.IsDeleted==0 && e.QuestionIdFK== questionId
                         select new 
                         {
                             e.IsDanger,
                             e.Title
                         }
            //                from qop in db.Questionoption
            //                where qop.QuestionIdFK == questionId 

            //                select new { qop.Title }

                        );

            return query.ToList<Object>();
        }
    }
}