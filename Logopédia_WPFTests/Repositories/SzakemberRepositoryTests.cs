using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logopédia_WPF.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logopédia_WPF.Models;
using Logopédia_WPF.Stores;

namespace Logopédia_WPF.Repositories.Tests
{
    [TestClass()]
    public class SzakemberRepositoryTests
    {
        [TestMethod()]
        public void SzakemberRepositoryTest_SzakemberFelhasznaloNevEgyezes()
        {
            RunEnvironment.ChangeToTestEnvironment();

            LogopediaContext letezoSzakember = new();
            SzakemberRepository szakemberRepository = new(letezoSzakember);

            List<Szakemberek> szakemberek = szakemberRepository.GetAll();

            if (szakemberek.Count > 0)
            {
                Szakemberek meglevoSzakember = szakemberek.ElementAt(0);

                szakemberRepository.Exists(meglevoSzakember.ellato_szakemberID);

                string felhasznalonev = "apan";
                string aktualis = meglevoSzakember.felhasznalo_nev;
                Assert.AreEqual(felhasznalonev, aktualis, "Nincs ilyen felhasználónevű szakember az adatbázisban!");
            }
        }       
    }
}