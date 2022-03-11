using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tele_pizza_order
{

    
   
    [Serializable]

    public class pizza
    {


        public string name { get; set; }
        public double price { get; set; }
        public double coupon { get; set; }
        public bool זיתים_ירוקים { get; set; }
        public bool זיתים_שחורים { get; set; }
        public bool פטריות { get; set; }
        public bool בצל { get; set; }
        public bool עגבניות { get; set; }
        public bool פלפל_ירוק { get; set; }
        public bool תירס { get; set; }
        public bool טונה { get; set; }
        public bool גבינה_בולגרית { get; set; }
        public bool חצילים { get; set; }


        public pizza(string name, double price)
        {
            reset_tosafot();
            this.name = name;
            this.price = price;
            this.coupon = 0;
        }

        public void reset_tosafot()
        {
            זיתים_ירוקים = false;
            זיתים_שחורים = false;
            פטריות = false;
            בצל = false;
            עגבניות = false;
            פלפל_ירוק = false;
            תירס = false;
            טונה = false;
            גבינה_בולגרית = false;
            חצילים = false;
        }

        public int number_tosafot()
        {
            int count = 0;
            if (זיתים_ירוקים == true) count++; 
            if (זיתים_שחורים == true) count++;
            if (פטריות == true) count++;
            if (בצל == true) count++;
            if (עגבניות == true) count++;
            if (פלפל_ירוק == true) count++;
            if (תירס == true) count++;
            if (טונה == true) count++;
            if (גבינה_בולגרית == true) count++;
            if (חצילים == true) count++;
            return count;
        }

        public string print_tosafot()
        {
            string result = " ";

            if (זיתים_ירוקים == true) result += "זיתים ירוקים ";
            if (זיתים_שחורים == true) result += "זיתים שחורים ";
            if (פטריות == true) result += "פטריות ";
            if (בצל == true) result += "בצל ";
            if (עגבניות == true) result += "עגבניות ";
            if (פלפל_ירוק == true) result += "פלפל ירוק ";
            if (תירס == true) result += "תירס ";
            if (טונה == true) result += "טונה ";
            if (גבינה_בולגרית == true) result += "גבינה בולגרית ";
            if (חצילים == true) result += "חצילים ";
            return result;
        }

        public double calc_price_without_coupon()
        {
            return price + (1 * number_tosafot());
        }

        public double calc_price()
        {
            double discount = 1 - coupon;
            double price2=price+(1*number_tosafot());
            price2 *= discount;
            return price2;
        }
        

        public override string ToString()
        {
            string result=name;
            result += " ";
            result += print_tosafot();
            string price = "   ";
            price += "  מחיר:   " + calc_price_without_coupon().ToString("00.00###") + " ש\"ח";
            if (coupon != 0)
            {
                price += "<br>";
                price += "  לאחר הנחת קופון:   " + calc_price().ToString("00.00###") + " ש\"ח";
            }
            result += price;
            return result;


            

        }
        
    }
}