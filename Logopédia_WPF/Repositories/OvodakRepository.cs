using Logopédia_WPF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logopédia_WPF.Repositories
{
    public class OvodakRepository : GenericRepository<Ovodak, LogopediaContext>
    {
        public OvodakRepository(LogopediaContext context) : base(context)
        {
        }

        public override List<Ovodak> GetAll()
        {
            return _context.Ovodak.OrderBy(x => x.ovoda_neve).ToList();
        }
    }

}
