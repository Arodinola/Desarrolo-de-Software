using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Farmacia
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Login_cajero inicio = new Login_cajero();

        private void timer1_Tick(object sender, EventArgs e)
        {
            progressBar2.Increment(2);
            label1.Text = progressBar2.Value.ToString() + "%";

            if (progressBar2.Value == progressBar2.Maximum) 
            {
                timer1.Stop();
                this.Hide();
                inicio.ShowDialog();
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
