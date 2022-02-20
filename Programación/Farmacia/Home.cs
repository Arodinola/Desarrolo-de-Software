using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace Farmacia
{
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);


        private void Barra_titulo_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panelcontenedor_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void BTNcerrar_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void BTNmaximizar_Click_1(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
            BTNmaximizar.Visible = false;
            BTNrestaurar.Visible = true;
        }

        private void BTNrestaurar_Click_1(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Normal;
            BTNrestaurar.Visible = false;
            BTNmaximizar.Visible = true;
        }

        private void BTNmini_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void BTNreportes_Click(object sender, EventArgs e)
        {
            SUBMENUreportes.Visible = true;
        }

        private void BTNreportV_Click(object sender, EventArgs e)
        {
            SUBMENUreportes.Visible = false;
        }

        private void BTNreportC_Click(object sender, EventArgs e)
        {
            SUBMENUreportes.Visible = false;
        }

        private void BTNreportP_Click(object sender, EventArgs e)
        {
            SUBMENUreportes.Visible = false;
        }

        private void BTNsalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
