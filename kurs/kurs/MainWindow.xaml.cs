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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace kurs
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Pass.IsEnabled = false;
            Code.IsEnabled = false;
            Log.Focus();
            Refrsh.IsEnabled = false;
            Enter.IsEnabled = false;
        }

        private void Log_KeyUp(object sender, KeyEventArgs e) // при освобожденни клваиши
        {
            if (e.Key == Key.Enter)
            {
                using (var db = new BiblitekaEntities())
                {
                    var number = db.Users.AsNoTracking().FirstOrDefault(m => m.login == // проверка логина в базе данных
   Log.Text.Trim());
                    if (number == null)
                    {
                        MessageBox.Show("Неверный логин"); 
                    }
                    else
                    {
                        Pass.IsEnabled = true;
                        Log.IsEnabled = false;
                        Pass.Focus();

                    }
                }
            }
        }

        private void Pass_KeyUp(object sender, KeyEventArgs e) // при освобожденнии клавиши
        {
            if (e.Key == Key.Enter)
            {
                using (var db = new BiblitekaEntities())
                {
                    var password = db.Users.AsNoTracking().FirstOrDefault(m => m.login == // проверка пароля в базе данных
   Log.Text.Trim() & (m.password == Pass.Password));
                    if (password == null)
                    {
                        MessageBox.Show("Неверный пароль");
                    }
                    else
                    {
                        Pass.IsEnabled = false;
                        gencode();
                        Code.Focus();

                    }
                }
            }
        }

        DispatcherTimer timer = new DispatcherTimer(); // таймер
        string code;
        private void gencode()
        {
            code = null;
            Random random = new Random();
            string[] massiveCharacters = new string[] { "1", "2", "3", "4", "5", "6", "7", "8" };
            for (int i = 0; i < 4; i++)
                code += massiveCharacters[random.Next(0, massiveCharacters.Length)];
            if (MessageBox.Show(code.ToString(), "Code", MessageBoxButton.OK,
    MessageBoxImage.Warning) == MessageBoxResult.OK)
            {
                timer.Interval = TimeSpan.FromSeconds(10);
                timer.Tick += Timer_Tick;
                timer.Start();
                Code.IsEnabled = true;
                Enter.IsEnabled = true;
                Refrsh.IsEnabled = true;
            }
        }

        void Timer_Tick(object sender, EventArgs e)
        {
            code = null;
            MessageBox.Show("Код сброшен. Повторите попытку");
            timer.Stop();
        }

        private void Refrsh_Click(object sender, RoutedEventArgs e)
        {
            timer.Stop();
            gencode();
            Code.Focus();
        }

        private void Enter_Click(object sender, RoutedEventArgs e)
        {
            if (code == Code.Text)
            {
                timer.Stop();
                using (var db = new BiblitekaEntities())
                {
                    var user = db.Users.AsNoTracking().FirstOrDefault(u => u.login == Log.Text && u.password == Pass.Password);
                    if (user.Role == true)
                    {
                        AdminWindow kurs = new AdminWindow();
                        kurs.Show();
                        Application.Current.MainWindow.Close();
                    }
                    else
                    {
                        UserWindow kurs2 = new UserWindow();
                        kurs2.Show();
                        Application.Current.MainWindow.Close();
                    }
                }
                
            }
            else
            {
                timer.Stop();
                MessageBox.Show("Неверный код");
            }
        }

        private void ClearBut_Click(object sender, RoutedEventArgs e)
        {
            Log.Clear();
            Pass.Clear();
            Code.Clear();
            Log.IsEnabled = true;
            Pass.IsEnabled = false;
            Code.IsEnabled = false;
            Enter.IsEnabled = false;
            Refrsh.IsEnabled = false;
            Log.Focus();
        }
    }
}
