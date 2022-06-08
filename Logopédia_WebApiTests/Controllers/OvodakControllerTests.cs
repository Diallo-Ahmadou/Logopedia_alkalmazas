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
    public class OvodakControllerTests
    {
        private OvodakController controller = new(new LogopediaContext());

        [TestMethod()]
        public async Task GetOvodak_OvodakSzama()
        {
            var response = await controller.Getovodak();
            var result = response.Value;
            var result2 = response.Value as List<Ovodak>;

            Assert.IsNotNull(result);
            int ovodakSzama = 20;
            Assert.AreEqual(result.Count(), ovodakSzama);
            Assert.AreEqual(result2.Count, ovodakSzama);
        }
    }
}