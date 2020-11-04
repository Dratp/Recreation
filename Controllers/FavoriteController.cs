//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Threading.Tasks;
//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;
//using Recreation.Services;

//namespace Recreation.Controllers
//{
//    [Route("api/[controller]")]
//    [ApiController]
//    public class FavoriteController : ControllerBase
//    {
//        Services.IDAL db;
//        public FavoriteController(IDAL _db)
//        {
//            db = _db;
//        }

//        [HttpPost]
//        [Route("/{userID}/{RIDBAactivity}")]
//        public void AddFavorite(long userID, string activity)
//        {
//            return db.AddLike(userID, activity);
//        }

//    }



//}
