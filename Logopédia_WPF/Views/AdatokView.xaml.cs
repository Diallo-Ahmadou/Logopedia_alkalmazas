using Logopédia_WPF.Models;
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
using System.Windows.Shapes;

namespace Logopédia_WPF.Views
{
    /// <summary>
    /// Interaction logic for AdatokView.xaml
    /// </summary>
    public partial class AdatokView : Window
    {
        public AdatokView(AdatokViewModel adatokVM)
        {
            InitializeComponent();
            DataContext = adatokVM;

            if (string.IsNullOrEmpty(diagnozisNeve.Text))
            {
                diagnozisNeve.Text = "nincs diagnózis";
            }
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            azonosito.Opacity = 0.3;
            gyerekNeve.Opacity = 0.3;
            szul_hely.Opacity = 0.3;
            szul_ido.Opacity = 0.3;
            anyjaNeve.Opacity = 0.3;
            lakcim.IsReadOnly = false;
            ovodaNeve.IsReadOnly = false;
            ovodaSzama.IsReadOnly = false;
            gondviseloNeve.IsReadOnly = false;
            gondviseloSzama.IsReadOnly = false;
            diagnozisNeve.IsReadOnly = false;
            diagnozisDatuma.IsReadOnly = false;

            ovodaNeve.Visibility = Visibility.Hidden;
            diagnozisNeve.Visibility = Visibility.Hidden;
            diagnozisDatuma.Visibility = Visibility.Hidden;
            ovodaCombo.Visibility = Visibility.Visible;
            diagnozisCombo.Visibility = Visibility.Visible;
            datum.Visibility = Visibility.Visible;
        }
    }
}
