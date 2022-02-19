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
    public partial class Home_Admin : Form
    {
        public Home_Admin()
        {
            InitializeComponent();
        }

        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);

        private void btncerrar_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnMaximizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
            btnMaximizar.Visible = false;
            btnrestaurar.Visible = true;
        }

        private void btnrestaurar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Normal;
            btnrestaurar.Visible = false;
            btnMaximizar.Visible = true;
        }

        private void btnminimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
            btnrestaurar.Visible = false;
            btnMaximizar.Visible = true;
        }

        private void Barra_titulo_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel_contenedor_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void submenureportes_Paint(object sender, PaintEventArgs e)
        {
            submenureportes.Visible = true;
        }

        private void btnreporteventas_Click(object sender, EventArgs e)
        {
            submenureportes.Visible = true;
        }

        private void btnreportecompras_Click(object sender, EventArgs e)
        {
            submenureportes.Visible = true;
        }

        private void btnreportespagos_Click(object sender, EventArgs e)
        {
            submenureportes.Visible = true;
        }

        private void btnsalir_Paint(object sender, PaintEventArgs e)
        {
            Application.Exit();
        }
    }
}
