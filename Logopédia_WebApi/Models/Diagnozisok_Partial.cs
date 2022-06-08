using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Logopédia_WebApi.Models
{
    public partial class Diagnozisok
    {
        public int gyerekSzam => gyerekek.Count;
    }
}
