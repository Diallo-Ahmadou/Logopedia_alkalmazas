using Logopédia_WPF.Repositories;
using Logopédia_WPF.Views;
using System.Windows.Input;
using Logopédia_WPF.Models;
using System.Windows;
using Microsoft.Toolkit.Mvvm.ComponentModel;

namespace Logopédia_WPF.ViewModels
{
    public class LoginViewModel : ViewModelBase
    {
        private string _felhasznalo_nev;
        public string Felhasznalonev
        {
            get { return _felhasznalo_nev; }
            set { SetProperty(ref _felhasznalo_nev, value); }
        }

        private string _jelszo;
        public string Jelszo
        {
            get { return _jelszo; }
            set { SetProperty(ref _jelszo, value); ; }
        }

        private string _hibaÜzenet;
        public string HibaÜzenet
        {
            get { return _hibaÜzenet; }
            set { SetProperty(ref _hibaÜzenet, value); }
        }

        private SzakemberRepository repo;
        public RelayCommand LoginCommand { get; set; }
        public RelayCommand CloseCommand { get; set; }

        public LoginViewModel()
        {
            var context = new LogopediaContext();
            repo = new SzakemberRepository(context);
            LoginCommand = new RelayCommand(x => Login(), x => canLogin());
            CloseCommand = new RelayCommand(x => Close());
        }

        private bool canLogin()
        {
            return !string.IsNullOrWhiteSpace(_felhasznalo_nev) && !string.IsNullOrWhiteSpace(_jelszo);
        }

        private void Login()
        {
            HibaÜzenet = repo.Authenticate(_felhasznalo_nev, _jelszo);
            if (HibaÜzenet == "Sikeres bejelentkezés!")
            {
                var mainView = new MainView();
                Application.Current.Windows[0].Close();
                mainView.Show();
            }
        }

        private void Close()
        {
            Application.Current.Windows[0].Close();
        }
    }
}
