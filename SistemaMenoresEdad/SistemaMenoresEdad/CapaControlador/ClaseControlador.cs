using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaMenoresEdad.CapaControlador
{
    public class ClaseControlador
    {
        public void limpiarCombobox(ComboBox combo)
        {
            combo.DataSource = null;
            combo.Items.Clear();
        }
    }
}
