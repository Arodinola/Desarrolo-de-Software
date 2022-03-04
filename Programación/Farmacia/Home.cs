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
            BTNcompras.Location = new Point(4, 270);
            panel5.Location = new Point(1, 270);
            BTNinventario.Location = new Point(4, 308);
            panel13.Location = new Point(1, 308);
            BTNproveedores.Location = new Point(4, 346);
            panel7.Location = new Point(1, 346);
            BTNreportes.Location = new Point(4, 384);
            panel8.Location = new Point(1, 384);
            panelempleados.Visible = false;
            panelproductos.Visible = false;
            SUBMENUreportes.Location = new Point(41, 418);
            if (SUBMENUreportes.Visible == false)
            {
                BTNproductos.Location = new Point(4, 156);
                panel2.Location = new Point(1, 156);
                BTNclientes.Location = new Point(4, 194);
                panel4.Location = new Point(1, 194);
                BTNventas.Location = new Point(4, 232);
                panel3.Location = new Point(1, 232);
                BTNcompras.Location = new Point(4, 270);
                panel5.Location = new Point(1, 270);
                BTNinventario.Location = new Point(4, 308);
                panel13.Location = new Point(1, 308);
                BTNproveedores.Location = new Point(4, 346);
                panel7.Location = new Point(1, 346);
                BTNreportes.Location = new Point(4, 384);
                panel8.Location = new Point(1, 384);

            }
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
            AbrirFormEnPanel(new Clientes());
        }

        private void button7_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new Proveedores());

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
            panelempleados.Location = new Point(41,153);
            BTNproductos.Location = new Point(4,217);
            panel2.Location = new Point(1,217);
            BTNclientes.Location = new Point(4, 255);
            panel4.Location = new Point(1, 255);
            BTNventas.Location = new Point(4, 293);
            panel3.Location = new Point(1, 293);
            BTNcompras.Location = new Point(4, 331);
            panel5.Location = new Point(1, 331);
            BTNinventario.Location = new Point(4, 369);
            panel13.Location = new Point(1, 369);
            BTNproveedores.Location = new Point(4, 407);
            panel7.Location = new Point(1, 407);
            BTNreportes.Location = new Point(4, 445);
            panel8.Location = new Point(1, 445);
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
                BTNcompras.Location = new Point(4, 270);
                panel5.Location = new Point(1, 270);
                BTNinventario.Location = new Point(4, 308);
                panel13.Location = new Point(1, 308);
                BTNproveedores.Location = new Point(4, 346);
                panel7.Location = new Point(1, 346);
                BTNreportes.Location = new Point(4, 384);
                panel8.Location = new Point(1, 384);

            }
        }

        private void BTNusuarios_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new FormUsuarios1());
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
            AbrirFormEnPanel(new Perfiles());
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
            panelproductos.Location = new Point(41, 186);
            BTNproductos.Location = new Point(4, 156);
            panel2.Location = new Point(1, 156);

            BTNclientes.Location = new Point(4, 291);
            panel4.Location = new Point(1, 291);
            BTNventas.Location = new Point(4, 329);
            panel3.Location = new Point(1, 329);
            BTNcompras.Location = new Point(4, 367);
            panel5.Location = new Point(1, 367);
            BTNinventario.Location = new Point(4, 405);
            panel13.Location = new Point(1, 405);
            BTNproveedores.Location = new Point(4, 443);
            panel7.Location = new Point(1, 443);
            BTNreportes.Location = new Point(4, 481);
            panel8.Location = new Point(1, 481);
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
                BTNcompras.Location = new Point(4, 270);
                panel5.Location = new Point(1, 270);
                BTNinventario.Location = new Point(4, 308);
                panel13.Location = new Point(1, 308);
                BTNproveedores.Location = new Point(4, 346);
                panel7.Location = new Point(1, 346);
                BTNreportes.Location = new Point(4, 384);
                panel8.Location = new Point(1, 384);

            }
        }

        private void BTNcatalogo_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new Frm_CategoriaProducto());
        }

        private void BTNusos_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new Frm_Usos());
        }

        private void BTNlab_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new Frm_Laboratorios());
        }

        private void BTNventas_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new FormVentas1());
        }

        private void BTNcompras_Click(object sender, EventArgs e)
        {

        }

        private void BTNinventario_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new Frm_Producto());
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
    }
}
