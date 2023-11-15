using BE;
using DA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
	public class BLBalance
	{
        private readonly DABalance _DABalance = new DABalance();

        public List<BEBalance> ListarBalance()
        {
            List<BEBalance> lst = _DABalance.ListarBalance();
            return lst;
        }
    }
}
