using Logopédia_WPF.Models;
using Logopédia_WPF.Repositories;
using Logopédia_WPF.Views;
using Microsoft.Toolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Logopédia_WPF.ViewModels
{
    public class SzakemberViewModel : ObservableObject
    {
        private SzakemberRepository szakemberRepo;

        private ObservableCollection<Szakemberek> _szakemberek;
        public ObservableCollection<Szakemberek> Szakemberek
        {
            get { return _szakemberek; }
            set { SetProperty(ref _szakemberek, value); }
        }

        private Szakemberek _selectedSzakemberek;
        public Szakemberek SelectedSzakemberek
        {
            get { return _selectedSzakemberek; }
            set { _selectedSzakemberek = value; }
        }

        public RelayCommand BackCommand { get; set; }
        public RelayCommand SelectCommand { get; set; }
        public RelayCommand ShowDataCommand { get; set; }

        public SzakemberViewModel()
        {
            var context = new LogopediaContext();
            szakemberRepo = new SzakemberRepository(context);
            Szakemberek = new ObservableCollection<Szakemberek>(szakemberRepo.GetAll());
            SelectCommand = new RelayCommand(szakemberek => ShowDetail(_selectedSzakemberek));
            ShowDataCommand = new RelayCommand(s => ShowData());
            BackCommand = new RelayCommand(w => Close((Window)w));
        }

        private void ShowDetail(Szakemberek _selectedSzakemberek)
        {
            var logopédusVM = new LogopédusViewModel(_selectedSzakemberek, szakemberRepo);
            LogopédusView logopédusView = new LogopédusView(logopédusVM);
            logopédusView.Show();
        }

        private void ShowData()
        {
            var query = szakemberRepo.GetAll();
            Szakemberek = new ObservableCollection<Szakemberek>(query);
        }

        private void Close(Window window)
        {
            var mainView = new MainView();
            window.Close();
            mainView.Show();
        }
    }
}
