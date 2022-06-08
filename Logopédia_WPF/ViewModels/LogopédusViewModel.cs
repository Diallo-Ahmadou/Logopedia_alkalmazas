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
    public class LogopédusViewModel : ViewModelBase
    {
        private SzakemberRepository _szakemberRepo;

        private Szakemberek _szakemberek;
        public Szakemberek Szakemberek
        {
            get { return _szakemberek; }
            set { SetProperty(ref _szakemberek, value); }
        }

        private string _saveMessage;
        public string SaveMessage
        {
            get { return _saveMessage; }
            set { SetProperty(ref _saveMessage, value); }
        }

        public RelayCommand CloseCommand { get; set; }
        public RelayCommand SaveCommand { get; set; }
        public RelayCommand NewCommand { get; set; }

        public LogopédusViewModel()
        {
        }

        public LogopédusViewModel(Szakemberek szakemberek, SzakemberRepository szakemberRepo)
        {
            _szakemberek = szakemberek;
            _szakemberRepo = szakemberRepo;
            var context = new LogopediaContext();
            NewCommand = new RelayCommand(n => New());
            SaveCommand = new RelayCommand(s => Save(Szakemberek));
            CloseCommand = new RelayCommand(w => Close((Window)w));
        }

        private void New()
        {
            Szakemberek = new Szakemberek();
        }

        private void Save(Szakemberek szakemberek)
        {
            if (_szakemberRepo.Exists(szakemberek.ellato_szakemberID))
            {
                _szakemberRepo.Update(szakemberek);
                SaveMessage = "Az adatok mentve!";
            }
            else
            {
                _szakemberRepo.Insert(szakemberek);
            }
        }

        private void Close(Window window)
        {
            window.Close();
        }
    }
}
