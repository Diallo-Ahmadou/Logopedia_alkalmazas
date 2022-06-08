using Logopédia_WPF.Models;
using Logopédia_WPF.Repositories;
using System.Collections.ObjectModel;
using Microsoft.Toolkit.Mvvm.ComponentModel;
using System.Windows;
using Logopédia_WPF.Views;
using System.Text;

namespace Logopédia_WPF.ViewModels
{
    public class ListázásViewModel : ObservableObject
    {
        private GyerekekRepository gyerekRepo;

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

        public RelayCommand BackCommand { get; set; }
        public RelayCommand SelectCommand { get; set; }

        public ListázásViewModel()
        {
            var context = new LogopediaContext();
            gyerekRepo = new GyerekekRepository(context);
            Gyerekek = new ObservableCollection<Gyerekek>(gyerekRepo.GetAll());
            SelectCommand = new RelayCommand(gyerekek => ShowDetail(_selectedGyerekek));
            BackCommand = new RelayCommand(w => Close((Window)w));           
        }

        private void ShowDetail(Gyerekek _selectedGyerekek)
        {
            var adatokVM = new AdatokViewModel(_selectedGyerekek, gyerekRepo);
            AdatokView adatokView = new(adatokVM);
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
