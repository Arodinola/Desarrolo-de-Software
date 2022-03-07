using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Farmacia
{
    public class Login : Conexion
    {
        private static string usuario;
        private static string clave;
        private static string tipousuario;
        private static int idusuario;
        public string Usuario { get => usuario; set => usuario = value; }
        public string Clave { get => clave; set => clave = value; }
        public string Tipousuario { get => tipousuario; set => tipousuario = value; }
        public int Idusuario { get => idusuario; set => idusuario = value; }

        public string login()
        {
            abrircn();
            SqlDataAdapter sda = new SqlDataAdapter("EXEC VerificarLogin '" + usuario + "','" + clave + "'", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            cn.Close();

            if (dt.Rows.Count > 0)
            {

                    if (dt.Rows[0][0].ToString() == "Administrador")
                    {
                        tipousuario = "admin";
                    }
                    else if ()
                {

                }
                    else
                    {
                        tipousuario = "admin";
                    }

                    return tipousuario;
            }
            else
            {
                MessageBox.Show("Usuario o contraseña incorrectos", "Acceso", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            return "";
        }
    }
}
