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
   
    public partial class Login_cajero : Form
    {
        public Login_cajero()
        {
            InitializeComponent();
        }


        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);


        private void pictureBox3_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void txtuser_Enter(object sender, EventArgs e)
        {
            if (txtUsuario.Text == "USUARIO"){
                txtUsuario.Text = "";
                txtUsuario.ForeColor = Color.White;
            }
        }

        private void txtuser_Leave(object sender, EventArgs e)
        {
            if (txtUsuario.Text==""){
                txtUsuario.Text = "USUARIO";
                txtUsuario.ForeColor = Color.White;
            }
        }

        private void txtpass_Enter(object sender, EventArgs e)
        {
            if (txtClave.Text == "CONTRASEÑA")
            {
                txtClave.Text = "";
                txtClave.ForeColor = Color.White;
                txtClave.UseSystemPasswordChar = true;
            }
        }

        private void txtpass_Leave(object sender, EventArgs e)
        {
            if (txtClave.Text == "")
            {
                txtClave.Text = "CONTRASEÑA";
                txtClave.ForeColor = Color.White;
                txtClave.UseSystemPasswordChar = false;
            }
        }

        private void Login_cajero_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void Barra_titulo_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Barra_titulo_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        //blablabla
        private void btnlogin_Click(object sender, EventArgs e)
        {
            Home menu = new Home();
           
            
            Login login = new Login();

            string us;
            if (string.IsNullOrEmpty(txtUsuario.Text) || string.IsNullOrEmpty(txtClave.Text))
            {
                MessageBox.Show("Datos Inválidos", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                login.Usuario = txtUsuario.Text;
                login.Clave = txtClave.Text;
                us = login.login();
                if (us == "admin")
                {
                    this.Hide();
                    menu.ShowDialog();
                }
                else if (us == "Ventas")
                {

                }
            }
        }


        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
  
        }

        private void Login_cajero_Load(object sender, EventArgs e)
        {
         
        }

        private void Login_cajero_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void txtuser_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
