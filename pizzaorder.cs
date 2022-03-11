using System.Collections.Generic;
using System;
using System.Linq;
using System.Web;

namespace tele_pizza_order
{
    [Serializable]
    public class pizzaorder
    {
        public DateTime time { get; set; }
        public Queue<pizza> myPizzaQueue = new Queue<pizza>();
        public string name { get; set; }
        public string family { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string mail { get; set; }
        public string phone { get; set; }
        public string comments { get; set; }
        public bool sendhome { get; set; }
        public string pizzeria_name { get; set; }

        public double Calculate_Total_Price()
        {
            double t = 0;
            foreach (pizza pizza in myPizzaQueue)
                t += pizza.calc_price();
            return t;
        }
    }
}
