using Logopédia_WPF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logopédia_WPF.Repositories
{
    public class DiagnozisokRepository : GenericRepository<Diagnozisok, LogopediaContext>
    {
        public DiagnozisokRepository(LogopediaContext context) : base(context)
        {
        }

        public override List<Diagnozisok> GetAll()
        {
            return _context.Diagnozisok.OrderBy(x => x.diagnozis_megnevezese).ToList();
        }
    }
}
