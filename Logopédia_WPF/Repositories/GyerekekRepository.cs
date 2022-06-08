using Logopédia_WPF.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logopédia_WPF.Repositories
{
    public class GyerekekRepository : GenericRepository<Gyerekek, LogopediaContext>
    {
        private readonly LogopediaContext ab;

        public GyerekekRepository(LogopediaContext context) : base(context)
        {
            ab = new LogopediaContext();
        }
        
        public List<Gyerekek> GetAll(string search = null)
        {
            var query = _context.Gyerekek.AsNoTracking().Include(x => x.ovodaIDNavigation).Include(x => x.diagnozisIDNavigation).Include(x => x.elerhetosegIDNavigation).AsQueryable();

            if (!string.IsNullOrWhiteSpace(search))
            {
                search = search.ToLower();
                _ = DateTime.TryParse(search, out DateTime szul_ido);

                query = query.Where(x => x.oktatasi_azonosito == search || x.gyerek_neve.ToLower().Contains(search) || x.ovodaIDNavigation.ovoda_neve.ToLower().Contains(search) || x.szul_hely.ToLower().Contains(search) || x.szul_ido == szul_ido);              
            }
           
            return query.ToList();
        }

        public bool Exists(string oktatasi_azonosito)
        {
            return _context.Gyerekek.Any(x => x.oktatasi_azonosito == oktatasi_azonosito);
        }
    }
}
