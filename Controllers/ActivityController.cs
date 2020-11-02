using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Recreation.Models;
using Recreation.Services;

namespace Recreation.Controllers
{
    [Route("api/Activity")]
    [ApiController]
    public class ActivityController : ControllerBase
    {
        IDAL db;
        public ActivityController(IDAL _db)
        {
            db = _db;
        }

        [HttpGet]
        [Route("")] // api/Activity   Returns the full list of all activities
        public List<ActivityData> GetActivityData()
        {
            return db.GetActivityDataList();
        }

        [HttpGet]
        [Route("list")] // api/Activity/list   Returns the unique list of activities in table
        public List<string> GetUniqueActivity()
        {
            //List<string> TestList = new List<string>(){"Test","Data"};
            //return TestList;
            return db.GetUniqueActivityList();
        }

        [HttpGet]
        [Route("{activity}")] // api/Activity/(Variable)  : Returns all places that have a certain activity available
        public List<ActivityData> GetActivityDataByActivity(string activity)
        {
            List<ActivityData> actByAct = db.GetActivityDataList();
            List<ActivityData> goodstuff = new List<ActivityData>();
            
            foreach(ActivityData act in actByAct)
            {
                if(act.Activity == activity)
                {
                    goodstuff.Add(act);
                }
            }
            return goodstuff;
        }

        [HttpGet]
        [Route("{activity}/Number")] // api/Activity/(Variable)/Number  : Returns a number that represents the amount of places that have a certain activity available
        public int GetActivityDataByActivityNum(string activity)
        {
            List<ActivityData> actByAct = db.GetActivityDataList();
            List<ActivityData> goodstuff = new List<ActivityData>();

            foreach (ActivityData act in actByAct)
            {
                if (act.Activity == activity)
                {
                    goodstuff.Add(act);
                }
            }

            return goodstuff.Count;
        }


    }
}
