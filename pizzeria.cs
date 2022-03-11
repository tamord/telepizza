using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tele_pizza_order
{
    public abstract class pizzeria
    {
        public string[] items { get; set; }
        public double[] prices { get; set; }
        public double minimum_price {get; set;}
        public int maximum_tosafot {get; set;}
        public string city { get; set; }
        virtual public string get_item_name(int choice) {return null;}
        virtual public double get_item_price(int choice) {return 0;}
        public string serverpath { get; set; }
        public string name { get; set; }

    }
}