using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logopédia_WPF.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logopédia_WPF.Stores;

namespace Logopédia_WPF.ViewModels.Tests
{
    [TestClass()]
    public class ListázásViewModelTests
    {
        [TestMethod()]
        public void ListázásViewModelTest_AzÖsszesGyerekListázása()
        {
            RunEnvironment.ChangeToTestEnvironment();
            ListázásViewModel listázásViewModel = new();

            int expected = 100;
            int actual = listázásViewModel.Gyerekek.Count;

            Assert.AreEqual(expected, actual, "Nem olvasta be az összes gyereket!");
        }
    }
}