using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logopédia_WebApi.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logopédia_WebApi.Models;

namespace Logopédia_WebApi.Controllers.Tests
{
    [TestClass()]
    public class SzakemberekControllerTests
    {
        private SzakemberekController controller = new(new LogopediaContext());

        private Szakemberek GetSzakemberek()
        {
            return new Szakemberek()
            {
                ellato_szakemberID = 1,
                nev = "Apró Anita",
                munkahely = "Szegedi Tagintézmény",
                email = "apro@teszt.com",
                telefonszam = "06-70-111-1111"
            };
        }

        [TestMethod()]
        public async Task GetSzakemberek_NevEgyezes()
        {
            var szakember = GetSzakemberek();
            var response = await controller.Getszakemberek(1);
            var result = response.Value;

            Assert.IsNotNull(result);
            Assert.AreEqual(result.nev, szakember.nev);
        }
    }
}