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
    /// Interaction logic for LogopédusView.xaml
    /// </summary>
    public partial class LogopédusView : Window
    {
        public LogopédusView(LogopédusViewModel logopédusVM)
        {
            InitializeComponent();
            DataContext = logopédusVM;
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            azonosito.Opacity = 0.3;
            nev.IsReadOnly = false;
            munkahely.IsReadOnly = false;
            email.IsReadOnly = false;
            telefonszam.IsReadOnly = false;
        }

        private void New_Click(object sender, RoutedEventArgs e)
        {
            azonosito.IsReadOnly = false;
            nev.IsReadOnly = false;
            munkahely.IsReadOnly = false;
            email.IsReadOnly = false;
            telefonszam.IsReadOnly = false;
        }
    }
}
