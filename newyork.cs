using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tele_pizza_order
{
    public class newyork : pizzeria
    {
        public newyork()
        {
            name = "פיצה ניו-יורק";

            items = new string[] { "פיצה משפחתית", "פיצה גדולה", "פיצה אישית" };
                                 
            //items = new string[] { "ענקית", "כפולה", "אישית" };
                        
            prices = new double[] { 64, 75, 24 };

            //prices = new double[] { 120, 140, 160 };

            minimum_price = 50.00;
            maximum_tosafot = 2;

            //city = "ירושלים";
            city = "תל אביב";

            serverpath = System.IO.Path.GetTempPath();  // for debugging

            //serverpath = @"D:\Domains\new-york-pizzabiz\new-york-pizza.biz\wwwroot";
        }

        override public string get_item_name(int choice)
        {
            if (choice == -1)
                return "";
            return items[choice];
        }

        override public double get_item_price(int choice)
        {
            if (choice == -1)
                return 0;
            return prices[choice];
        }

    }
}

