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
        [Route("")]
        public List<ActivityData> GetActivityData()
        {
            return db.GetActivityDataList();
        }

    }
}
