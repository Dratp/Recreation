using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Recreation.Models
{
    [Table("Users")]
    public class User
    {
        [Key]
        public long UserID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ZIP { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        

    }
}
