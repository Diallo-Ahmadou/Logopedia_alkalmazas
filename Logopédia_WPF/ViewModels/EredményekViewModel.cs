using Logopédia_WPF.Models;
using Logopédia_WPF.Repositories;
using System.Collections.ObjectModel;
using Microsoft.Toolkit.Mvvm.ComponentModel;
using System.Windows;
using Logopédia_WPF.Views;

namespace Logopédia_WPF.ViewModels
{
    public class EredményekViewModel : ObservableObject
    {
        private EredményekRepository eredményRepo;

        private ObservableCollection<Eredmenyek> _eredmények;
        public ObservableCollection<Eredmenyek> Eredmények
        {
            get { return _eredmények; }
            set { SetProperty(ref _eredmények, value); }
        }

        private Eredmenyek _selectedGyerekek;
        public Eredmenyek SelectedGyerekek
        {
            get { return _selectedGyerekek; }
            set { SetProperty(ref _selectedGyerekek, value); }
        }

        public RelayCommand BackCommand { get; set; }

        public EredményekViewModel()
        {
            var context = new LogopediaContext();
            eredményRepo = new EredményekRepository(context);
            Eredmények = new ObservableCollection<Eredmenyek>(eredményRepo.GetAll());
            BackCommand = new RelayCommand(w => Close((Window)w));
        }

        private void Close(Window window)
        {
            var mainView = new MainView();
            window.Close();
            mainView.Show();
        }
    }
}
