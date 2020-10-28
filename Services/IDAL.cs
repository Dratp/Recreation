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


    }
}
