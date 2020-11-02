using Recreation.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Recreation.Services
{
    public interface IDAL
    {
        public List<ActivityData> GetActivityDataList();

        public User CreateUser(string userName, string password, string firstName, string lastName, string zip, string city, string state);

        public Object Login(string userName, string password);

        public List<Likes> GetLikes(long userID, long activityID);

        public User GetUser(string userName);

        public long AddLike(long userID, long activityID);

        public void DeleteLike(Likes like);

        public List<string> GetUniqueActivityList();
    }
}
