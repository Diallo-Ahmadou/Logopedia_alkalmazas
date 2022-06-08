using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Logopédia_WPF.Models;
using Logopédia_WPF.Repositories;
using Logopédia_WPF.Views;
using Microsoft.Toolkit.Mvvm.ComponentModel;
using Microsoft.Toolkit.Mvvm.Input;
using Logopédia_WPF.Services;

namespace Logopédia_WPF.ViewModels
{
    public class MainViewModel : ObservableObject
    {
        private string _searchKey;
        public string SearchKey
        {
            get { return _searchKey; }
            set
            {
                SetProperty(ref _searchKey, value);
            }
        }

        private Gyerekek _selectedGyerekek;
        public Gyerekek SelectedGyerekek
        {
            get { return _selectedGyerekek; }
            set { SetProperty(ref _selectedGyerekek, value); }
        }

        public RelayCommand LogoutCommand { get; set; }
        public RelayCommand ListázásCommand { get; set; }
        public RelayCommand EredményekCommand { get; set; }
        public RelayCommand SzakemberCommand { get; set; }
        public RelayCommand KeresésCommand { get; set; }

        public MainViewModel()
        {
            LogoutCommand = new RelayCommand(w => Close((Window)w));
            ListázásCommand = new RelayCommand(w => Listázás((Window)w));
            EredményekCommand = new RelayCommand(w => Eredmények((Window)w));
            SzakemberCommand = new RelayCommand(w => Szakember((Window)w));
            KeresésCommand = new RelayCommand(w => Keresés((Window)w));
        }

        private void Listázás(Window window)
        {
            var listázásView = new ListázásView();
            window.Close();
            listázásView.Show();
        }

        private void Eredmények(Window window)
        {
            var eredményekView = new EredményekView();
            window.Close();
            eredményekView.Show();
        }

        private void Szakember(Window window)
        {
            var szakemberView = new SzakemberView();
            window.Close();
            szakemberView.Show();
        }

        private void Keresés(Window window)
        {
            var keresésView = new KeresésView();
            window.Close();
            keresésView.Show();
        }

        private void Close(Window window)
        {
            var loginView = new LoginView();
            window.Close();
            loginView.Show();
        }
    }
}
