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
           // customizeDesign();
        }
     /*
        private void customizeDesign()
        {
            panelempleados.Visible = false;
            panelproductos.Visible = false;
            SUBMENUreportes.Visible = false;
        }
     */
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);

       /* private void hideSubMenu()
        {
            if (panelempleados.Visible == true)
            {
                panelempleados.Visible = false;
            }
            if (panelproductos.Visible == true)
            {
                panelproductos.Visible = false;
            }
            if (SUBMENUreportes.Visible == true)
            {
                SUBMENUreportes.Visible = false;
            }

        }

        private void showSubMenu(Panel subMenu)
        {
            if (subMenu.Visible == false)
            {
                hideSubMenu();
                subMenu.Visible = true;
            }
            else
            {
                subMenu.Visible = false;
            }
        }
        */

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
            BTNsalir.Location = new Point(1, 670);
        }

        private void BTNrestaurar_Click_1(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Normal;
            BTNrestaurar.Visible = false;
            BTNmaximizar.Visible = true;
            BTNsalir.Location = new Point(1, 533);
        }

        private void BTNmini_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void BTNreportes_Click(object sender, EventArgs e)
        {
            if (SUBMENUreportes.Visible == true)
            {
                SUBMENUreportes.Visible = false;
            }
            else
            {
                SUBMENUreportes.Visible = true;
            }

            //Coordenadas de los botones
            //posiciones finales
            BTNproductos.Location = new Point(4, 156);
            panel2.Location = new Point(1, 156);
            BTNclientes.Location = new Point(4, 194);
            panel4.Location = new Point(1, 194);
            BTNventas.Location = new Point(4, 232);
            panel3.Location = new Point(1, 232);
            BTNproveedores.Location = new Point(4, 272);
            panel7.Location = new Point(1, 272);
            BTNreportes.Location = new Point(4, 310);
            panel8.Location = new Point(1, 310);
            panelempleados.Visible = false;
            panelproductos.Visible = false;
            SUBMENUreportes.Location = new Point(41, 344);
            if (SUBMENUreportes.Visible == false)
            {
                BTNproductos.Location = new Point(4, 156);
                panel2.Location = new Point(1, 156);
                BTNclientes.Location = new Point(4, 194);
                panel4.Location = new Point(1, 194);
                BTNventas.Location = new Point(4, 232);
                panel3.Location = new Point(1, 232);
                BTNproveedores.Location = new Point(4, 272);
                panel7.Location = new Point(1, 272);
                BTNreportes.Location = new Point(4, 310);
                panel8.Location = new Point(1, 310);

            }
        }


        private void MostrarLogo()
        {
            AbrirFormEnPanel(new FormLogo());
        }

        private void MostrarLogoAlCerrar(object sender, FormClosedEventArgs e)
        {
            MostrarLogo();
        }

        private void BTNreportV_Click(object sender, EventArgs e)
        {

        }

        private void BTNsalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void AbrirFormEnPanel(object formhija)
        {
            if (this.panelCont.Controls.Count > 0)
                this.panelCont.Controls.RemoveAt(0);
            Form fh = formhija as Form;
            fh.TopLevel = false;
            fh.Dock = DockStyle.Fill;
            this.panelCont.Controls.Add(fh);
            this.panelCont.Tag = fh;
            fh.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Clientes frm = new Clientes();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Proveedores frm = new Proveedores();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);

        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (panelempleados.Visible == true)
            {
                panelempleados.Visible = false;
            }
            else
            {
                panelempleados.Visible = true;
            }

            //Coordenadas de los botones
            //posiciones finales
            panelempleados.Location = new Point(41,151);
            BTNproductos.Location = new Point(4,251);
            panel2.Location = new Point(1,251);
            BTNclientes.Location = new Point(4, 289);
            panel4.Location = new Point(1, 289);
            BTNventas.Location = new Point(4, 327);
            panel3.Location = new Point(1, 327);
            BTNproveedores.Location = new Point(4, 365);
            panel7.Location = new Point(1, 365);
            BTNreportes.Location = new Point(4, 403);
            panel8.Location = new Point(1, 403);
            panelproductos.Visible = false;
            SUBMENUreportes.Visible = false;
            if (panelempleados.Visible == false)
            {
                BTNproductos.Location = new Point(4,156);
                panel2.Location = new Point(1, 156);
                BTNclientes.Location = new Point(4, 194);
                panel4.Location = new Point(1, 194);
                BTNventas.Location = new Point(4, 232);
                panel3.Location = new Point(1, 232);
                BTNproveedores.Location = new Point(4, 272);
                panel7.Location = new Point(1, 272);
                BTNreportes.Location = new Point(4, 310);
                panel8.Location = new Point(1, 310);

            }
        }

        private void BTNusuarios_Click(object sender, EventArgs e)
        {
            FormUsuarios1 frm = new FormUsuarios1();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }
        private void Abrirusuarios(object FUsuarios)
        {
            if(this.panelcontenedor.Controls.Count > 0)
            {
                this.panelcontenedor.Controls.RemoveAt(0);
            }
            Form fh = FUsuarios as Form;
            fh.TopLevel = false;
            fh.Dock = DockStyle.Fill;
            this.panelcontenedor.Controls.Add(fh);
            this.panelcontenedor.Tag = fh;
            fh.Show();
        }

        private void BTNperfiles_Click(object sender, EventArgs e)
        {
            Perfiles frm = new Perfiles();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }

        private void BTNproductos_Click(object sender, EventArgs e)
        {
            if (panelproductos.Visible == true)
            {
                panelproductos.Visible = false;
            }
            else
            {
                panelproductos.Visible = true;
            }

            //Coordenadas de los botones
            //posiciones finales
            panelproductos.Location = new Point(41, 190);
            BTNproductos.Location = new Point(4, 156);
            panel2.Location = new Point(1, 156);

            BTNclientes.Location = new Point(4, 328);
            panel4.Location = new Point(1, 328);
            BTNventas.Location = new Point(4, 366);
            panel3.Location = new Point(1, 366);
            BTNproveedores.Location = new Point(4, 404);
            panel7.Location = new Point(1, 404);
            BTNreportes.Location = new Point(4, 442);
            panel8.Location = new Point(1, 442);
            panelempleados.Visible = false;
            SUBMENUreportes.Visible = false;
            if (panelproductos.Visible == false)
            {
                BTNproductos.Location = new Point(4, 156);
                panel2.Location = new Point(1, 156);
                BTNclientes.Location = new Point(4, 194);
                panel4.Location = new Point(1, 194);
                BTNventas.Location = new Point(4, 232);
                panel3.Location = new Point(1, 232);
                BTNproveedores.Location = new Point(4, 272);
                panel7.Location = new Point(1, 272);
                BTNreportes.Location = new Point(4, 310);
                panel8.Location = new Point(1, 310);

            }
        }

        private void BTNcatalogo_Click(object sender, EventArgs e)
        {
            Frm_CategoriaProducto frm = new Frm_CategoriaProducto();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }

        private void BTNusos_Click(object sender, EventArgs e)
        {
            Frm_Usos frm = new Frm_Usos();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }

        private void BTNlab_Click(object sender, EventArgs e)
        {
            Frm_Laboratorios frm = new Frm_Laboratorios();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }

        private void BTNventas_Click(object sender, EventArgs e)
        {
            FormVentas1 frm = new FormVentas1();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }

        private void BTNcompras_Click(object sender, EventArgs e)
        {

        }

        private void BTNinventario_Click(object sender, EventArgs e)
        {
            Frm_Producto frm = new Frm_Producto();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Home principal = new Home();
            principal.ShowDialog();
        }

        private void Home_Load(object sender, EventArgs e)
        {
            BTNproductos.Location = new Point(4, 118);
            panel2.Location = new Point(1, 118);
            panelempleados.Hide();

        }

        private void HoraFecha_Tick(object sender, EventArgs e)
        {
            lblHora.Text = DateTime.Now.ToString("HH:mm:ss");
            lblFecha.Text = DateTime.Now.ToLongDateString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Frm_Producto frm = new Frm_Producto();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }

        private void BTNregistro_emp_Click(object sender, EventArgs e)
        {
            Registro_emp frm = new Registro_emp();
            frm.FormClosed += new FormClosedEventHandler(MostrarLogoAlCerrar);
            AbrirFormEnPanel(frm);
        }
    }
}
