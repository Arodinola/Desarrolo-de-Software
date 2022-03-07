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
     public class Conexion
    {
        //Yobany
        public SqlConnection cn = new SqlConnection("Data Source = DESKTOP-FT8IN1J\\SQLEXPRESS01; Initial Catalog = FarmaciaDesarrollo; Integrated Security = True");

        public void abrircn()
        {
            try
            {
                cn.Open();
            }
            catch (Exception e)
            {
                MessageBox.Show("Error al conectar a base de datos " + e);
            }
        }
        public void close()
        {
            cn.Close();
        }


    }
}
