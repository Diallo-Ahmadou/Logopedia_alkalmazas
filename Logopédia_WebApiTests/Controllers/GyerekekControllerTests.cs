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
    public class GyerekekControllerTests
    {
        private GyerekekController controller = new(new LogopediaContext());

        [TestMethod()]
        public async Task Getgyerekek_GyerekekSzáma()
        {
            var response = await controller.Getgyerekek();
            var result = response.Value;
            var result2 = response.Value as List<Gyerekek>;

            Assert.IsNotNull(result);
            int gyerekSzam = 100;
            Assert.AreEqual(result.Count(), gyerekSzam);
            Assert.AreEqual(result2.Count(), gyerekSzam);
        }
    }
}