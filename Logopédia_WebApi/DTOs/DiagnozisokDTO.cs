using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Logopédia_WebApi.Models;

namespace Logopédia_WebApi.DTOs
{
    public class DiagnozisokDTO
    {
        public DiagnozisokDTO(string diagnozis_megnevezese, int gyerekSzam)
        {
            this.diagnozis_megnevezese = diagnozis_megnevezese;
            this.gyerekSzam = gyerekSzam;
        }

        public string diagnozis_megnevezese { get; set; }
        public int gyerekSzam { get; set; }
    }
}
