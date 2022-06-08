using Logopédia_WPF.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Logopédia_WPF.Views
{
    /// <summary>
    /// Interaction logic for ListázásView.xaml
    /// </summary>
    public partial class ListázásView : Window
    {
        public ListázásView()
        {
            InitializeComponent();

            if (string.IsNullOrEmpty(diagnozis.Text))
            {
                diagnozis.Text = "nincs diagnózis";               
            }
        }
    }
}
