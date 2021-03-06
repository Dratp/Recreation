﻿using Recreation.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Recreation.Services
{
    public interface IDAL
    {
        public List<ActivityData> GetActivityDataList();

        public User CreateUser(User newUser);

        public Object Login(string userName, string password);

        public List<Likes> GetLikes(long userID, long activityID);

        public List<SavedLikeInfo> GetLikes(long userID);

        public User GetUser(string userName);

        public long AddLike(long userID, long activityID);

        public void DeleteLike(Likes like);

        public List<string> GetUniqueActivityList();
        public List<ActivityData> GetActivityDataList(long userID);
        public void DeleteFavorite(long LikeID);
            
    }
}
