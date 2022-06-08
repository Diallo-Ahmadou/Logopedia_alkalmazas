using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Logopédia_WPF.Services;
using Logopédia_WPF.Models;
using BCrypt.Net;

namespace Logopédia_WPF.Repositories
{
    public class SzakemberRepository : GenericRepository<Szakemberek, LogopediaContext>
    {
        private LogopediaContext ab;

        public SzakemberRepository(LogopediaContext context) : base(context)
        {
            ab = new LogopediaContext();
        }

        public List<Szakemberek> GetAll(string search = null)
        {
            var query = _context.Szakemberek.AsQueryable();
            return query.ToList();
        }

        public string Authenticate(string felhasznalonev, string jelszo)
        {
            if (!ab.Database.CanConnect())
            {
                return "Az adatbázis nem elérhető!";
            }
            Szakemberek abUser = ab.Szakemberek.AsNoTracking().SingleOrDefault(x => x.felhasznalo_nev == felhasznalonev);

            if (abUser != null)
            {
                var passwordHash = BCrypt.Net.BCrypt.HashPassword(jelszo);
                bool verified = BCrypt.Net.BCrypt.Verify(jelszo, abUser.jelszo);
                if (verified)
                {
                    CurrentUser.Felhasznalonev = abUser.felhasznalo_nev;
                    CurrentUser.Id = abUser.ellato_szakemberID;
                    CurrentUser.Nev = abUser.nev;

                    return "Sikeres bejelentkezés!";
                }
                else
                {
                    return "Hibás felhasználónév vagy jelszó!";
                }
            }
            else
            {
                return "A felhasználó nem létezik!";
            }
        }

        public bool Exists(int? ellato_szakemberID)
        {
            return _context.Szakemberek.Any(x => x.ellato_szakemberID == ellato_szakemberID);
        }
    }
}
