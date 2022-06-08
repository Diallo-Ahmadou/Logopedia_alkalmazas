using Logopédia_WPF.Models;
using Logopédia_WPF.Views;
using Microsoft.Toolkit.Mvvm.ComponentModel;
using Microsoft.Toolkit.Mvvm.Input;
using Logopédia_WPF.Repositories;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Logopédia_WPF.ViewModels
{
    public class KeresésViewModel : ObservableObject
    {
        private GyerekekRepository gyerekRepo;

        private string _searchKey;
        public string SearchKey
        {
            get { return _searchKey; }
            set { SetProperty(ref _searchKey, value); }
        }

        private ObservableCollection<Gyerekek> _gyerekek;
        public ObservableCollection<Gyerekek> Gyerekek
        {
            get { return _gyerekek; }
            set { SetProperty(ref _gyerekek, value); }
        }

        private Gyerekek _selectedGyerekek;
        public Gyerekek SelectedGyerekek
        {
            get { return _selectedGyerekek; }
            set { SetProperty(ref _selectedGyerekek, value); }
        }

        private string _result;
        public string Result
        {
            get { return _result; }
            set { SetProperty(ref _result, value); }
        }

        public RelayCommand BackCommand { get; set; }
        public RelayCommand SelectCommand { get; set; }
        public RelayCommand ShowDataCommand { get; set; }

        public KeresésViewModel()
        {
            var context = new LogopediaContext();
            gyerekRepo = new GyerekekRepository(context);
            SelectCommand = new RelayCommand(gyerekek => ShowDetail(_selectedGyerekek));
            BackCommand = new RelayCommand(w => Close((Window)w));
            ShowDataCommand = new RelayCommand(s => ShowData());           
        }

        private void ShowData()
        {
            var query = gyerekRepo.GetAll(SearchKey);
            Gyerekek = new ObservableCollection<Gyerekek>(query);
            var talalat = query.Count;
            if (talalat == 0) Result = "Nem található adat!";
            else Result = talalat + " db találat";
        }

        private void ShowDetail(Gyerekek _selectedGyerekek)
        {
            var adatokVM = new AdatokViewModel(_selectedGyerekek, gyerekRepo);
            AdatokView adatokView = new AdatokView(adatokVM);
            adatokView.Show();
        }

        private void Close(Window window)
        {
            var mainView = new MainView();
            window.Close();
            mainView.Show();
        }
    }
}
