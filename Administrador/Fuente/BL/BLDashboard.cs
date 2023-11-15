using BE;
using DA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class BLDashboard
    {
        private readonly DADashboard _DADashboard = new DADashboard();

        public List<int> ListarDatosDashboard()
        {
            List<int> lst = _DADashboard.ValoresDashboard();
            return lst;
        }
    }
}
