using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Logopédia_WebApi.Models;

namespace Logopédia_WebApi.DTOs
{
    public class OvodakDTO
    {
        public OvodakDTO(string ovoda_neve, int letszam)
        {
            this.ovoda_neve = ovoda_neve;
            this.letszam = letszam;
        }

        public string ovoda_neve { get; set; }
        public int letszam { get; set; }
    }
}
