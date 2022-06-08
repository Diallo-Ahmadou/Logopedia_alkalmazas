using Microsoft.Toolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logopédia_WPF.Models;
using Logopédia_WPF.Repositories;
using System.Collections.ObjectModel;
using Logopédia_WPF.Views;
using System.Windows;
using Microsoft.Toolkit.Mvvm.Input;

namespace Logopédia_WPF.ViewModels
{
    public class AdatokViewModel : ViewModelBase
    {
        private GyerekekRepository _repo;
        private OvodakRepository ovodaRepo;
        private DiagnozisokRepository diagnozisRepo;

        private Gyerekek _gyerekek;
        public Gyerekek Gyerekek
        {
            get { return _gyerekek; }
            set { SetProperty(ref _gyerekek, value); }
        }

        private string _saveMessage;
        public string SaveMessage
        {
            get { return _saveMessage; }
            set { SetProperty(ref _saveMessage, value); }
        }

        public ObservableCollection<Ovodak> Ovodak { get; set; }
        public ObservableCollection<Diagnozisok> Diagnozisok { get; set; }

        public RelayCommand CloseCommand { get; set; }
        public RelayCommand SaveCommand { get; set; }

        public AdatokViewModel()
        {
        }

        public AdatokViewModel(Gyerekek gyerekek, GyerekekRepository repo)
        {
            _gyerekek = gyerekek;
            _repo = repo;
            var context = new LogopediaContext();
            ovodaRepo = new OvodakRepository(context);
            diagnozisRepo = new DiagnozisokRepository(context);
            Ovodak = new ObservableCollection<Ovodak>(ovodaRepo.GetAll());
            Diagnozisok = new ObservableCollection<Diagnozisok>(diagnozisRepo.GetAll());
            SaveCommand = new RelayCommand(s => Save(Gyerekek));
            CloseCommand = new RelayCommand(w => Close((Window)w));
        }

        private void Save(Gyerekek gyerekek)
        {
            if (_repo.Exists(gyerekek.oktatasi_azonosito))
            {
                _repo.Update(gyerekek);
                SaveMessage = "A változások mentve!";
            }
            else
            {
                _repo.Insert(gyerekek);
            }
        }

        private void Close(Window window)
        {
            window.Close();
        }
    }
}
