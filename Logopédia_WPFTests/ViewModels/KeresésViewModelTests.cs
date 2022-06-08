using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logopédia_WPF.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logopédia_WPF.Stores;
using Logopédia_WPF.Models;
using Logopédia_WPF.Repositories;

namespace Logopédia_WPF.ViewModels.Tests
{
    [TestClass()]
    public class KeresésViewModelTests
    {
        [TestMethod()]
        public void KeresésViewModelTest_VanEIlyenOvodaAzAdatbázisban()
        {
            RunEnvironment.ChangeToTestEnvironment();

            LogopediaContext letezoOvoda = new();
            OvodakRepository ovodakRepository = new(letezoOvoda);

            List<Ovodak> ovodak = ovodakRepository.GetAll();

            if (ovodak.Count > 0)
            {
                Ovodak oviNeve = ovodak.ElementAt(4);

                string nev = "Cuki Óvoda";
                string aktualis = oviNeve.ovoda_neve;
                Assert.AreEqual(nev, aktualis, "Nem található ilyen nevű óvoda az adatbázisban!");
            }
        }
    }
}