
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tele_pizza_order;
using System.Web.Mail;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using tele_pizza_order.SimpleSmsProxy;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace tele_pizza_order
{
    public partial class order : System.Web.UI.Page
    {

        static Queue<pizza> myPizzaQueue = new Queue<pizza>();

        static pizzeria menu = new newyork();

        static pizzaorder myPizzaOrder = new pizzaorder();

        static Queue<pizzaorder> myPizzaOrderQueue = new Queue<pizzaorder>();

        static bool first_time = true;

        static double coupon = 0;
                               
        
        public void Print()                 // הדפס עגלה
        {
            cart.Text = "";
            double total_price = 0;
            int count = myPizzaQueue.Count();

            foreach (pizza myPizza2 in myPizzaQueue)
            {
                
                cart.Text += myPizza2.ToString();
                cart.Text += " <br>";
                total_price += myPizza2.calc_price();
            }

            the_total_price.Text = total_price.ToString("00.00###");
            the_total_price.Text += " ש\"ח";
        }

        public void SaveQueue(pizzaorder myPizzaOrder)
        {

            string path = menu.serverpath;
            //string path= @"D:\Domains\new-york-pizzabiz\new-york-pizza.biz\wwwroot";             
            
            FileInfo fi2 = new FileInfo(path + @"\data.txt");

            if (fi2.Exists)
                using (FileStream fs = fi2.OpenRead())
                {
                    BinaryFormatter formatter = new BinaryFormatter();
                    myPizzaOrderQueue = (Queue<pizzaorder>)formatter.Deserialize(fs);
                }
            else
                myPizzaOrderQueue.Clear();

            myPizzaOrderQueue.Enqueue(myPizzaOrder);

            
            FileInfo fi = new FileInfo(path + @"\data.txt");

            if (fi.Exists)
            {
                fi.Delete();
            }

            using (FileStream outStream = fi.Create())
            {
                BinaryFormatter formatter = new BinaryFormatter();
                formatter.Serialize(outStream, myPizzaOrderQueue);
            }

            FileInfo fi3 = new FileInfo(path + @"\push.txt");

            if (fi3.Exists)
              fi3.Delete();
            
            using (FileStream outStream = fi3.Create())
            { }
            
        }

        public void Ordermail(string mail,string body)      // שליחת אימייל
        {
            

            System.Net.Mail.MailMessage message=new System.Net.Mail.MailMessage
                ("support@telepizza.co.il", mail, "הזמנתך התקבלה", body);


            try
            {

                SmtpClient objSC = new SmtpClient("mail.telepizza.co.il", 25);
                objSC.UseDefaultCredentials = false;
                objSC.Credentials = new NetworkCredential("support@telepizza.co.il", "tal12345");
                objSC.EnableSsl = false;
                objSC.Send(message);

            }

            catch (Exception errc)
            {
                Label4.Text = "בעיה במערכת, נסו שוב מאוחר יותר " + errc.ToString();
            }
            }


        public void SendSms(string body)      // שליחת אימייל
        {


            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage
                ("support@telepizza.co.il", "0542171663.tamord.b@mail2sms.co.il","התקבלה הזמנה", body);


            try
            {

                SmtpClient objSC = new SmtpClient("mail.telepizza.co.il", 25);
                objSC.UseDefaultCredentials = false;
                objSC.Credentials = new NetworkCredential("support@telepizza.co.il", "tal12345");
                objSC.EnableSsl = false;
                objSC.Send(message);

            }

            catch (Exception errc)
            {
                Label4.Text = "בעיה במערכת, נסו שוב מאוחר יותר " + errc.ToString();
            }
        }

        public void confirmmail(string mail,string name)          // שלח הודעת אישור
        {
            //string body = "שלום רב,";
            
            string body=name;
            body += " ";
            body += "שלום רב, ";

            body += "\n\n";
            body += "הודעה זאת נשלחה כדי להודיע לך שהזמנתך בטל-פיצה התקבלה";
            body += "\n\n";
            body += "לאחר הכנת ושליחת הפיצה תקבל\\י הודעה נוספת לאישור ההזמנה";
            body += "\n\n";
            body += "במידה ולא קיבלת הודעת אישור הזמנה תוך 45 דקות, נסה\\י שוב מאוחר יותר ";
            body += "\n\n";
            body += "תודה ולהתראות,";
            body += "\n";
            body += "צוות טל-פיצה";
            Ordermail(mail, body);
        }

        protected void additem(object sender, EventArgs e)     // הוספת פריט לעגלה
        {

            int choiceindex = itemslist.SelectedIndex;

            string name = menu.get_item_name(choiceindex);
            double price = menu.get_item_price(choiceindex);

            pizza myPizza = new pizza(name,price);
            myPizza.coupon = coupon;
            
            int count = 0;

            for (int i = 0; i < tosafot2.Items.Count; i++)
                if (tosafot2.Items[i].Selected)
                    count++;

            if (count > menu.maximum_tosafot)
            {
                Label3.Visible = true;
                if (menu.maximum_tosafot == 1)
                    Label3.Text = "ניתן להזמין עד תוספת אחת";
                else if (menu.maximum_tosafot>1)
                    Label3.Text = "ניתן להזמין עד  "+menu.maximum_tosafot.ToString() + " תוספות";
                
                return;
            }

            Label3.Visible = false;            
            Label4.Text = "";
                        
            int how_many_pizzas = Convert.ToInt32(how_many.SelectedValue);

            for (int x=1;x<=how_many_pizzas;x++)                // הוספת הפיצות
            {

                for (int i = 0; i < tosafot2.Items.Count; i++)          // בדיקת תוספות

                if (tosafot2.Items[i].Selected)
                {
                    switch (i)
                    {
                        case 0: myPizza.זיתים_ירוקים=true;
                            break;
                        case 1: myPizza.פטריות=true;
                            break;
                        case 2: myPizza.בצל=true;
                            break;
                        case 3: myPizza.עגבניות=true;
                            break;
                        case 4: myPizza.פלפל_ירוק=true;
                            break;
                        case 5: myPizza.תירס=true;
                            break;
                    }
                }
                            myPizzaQueue.Enqueue(myPizza);
                }

                            Panel1.Visible = true;
                            cart.Text = "";
                            Print();                          
                 
        }

        
        protected void next_Click(object sender, EventArgs e)   // מעבר לתפריט 2
        {
            //pizza myPizza3 = new pizza();

            double total_price = 0;
            foreach (pizza myPizza2 in myPizzaQueue)
                total_price += myPizza2.calc_price();

            if (total_price < menu.minimum_price)   // בדיקת מחיר מינימלי
            {
                Label4.Visible = true;
                Label4.Text = "מחיר מינימלי: ";
                Label4.Text += menu.minimum_price.ToString("00.00###");
                Label4.Text += " ש\"ח";
                return;
            }
            
            if (MultiView1.ActiveViewIndex == 1)    // סיום הזמנה
            {
                myPizzaOrder.name = name.Text;
                myPizzaOrder.family = family.Text;
                myPizzaOrder.address = ktovet.Text;
                myPizzaOrder.mail = mail.Text;
                myPizzaOrder.city=city.Text;
                myPizzaOrder.phone = phone.Text;
                myPizzaOrder.comments = comments.Text;
                myPizzaOrder.myPizzaQueue = myPizzaQueue;
                myPizzaOrder.time = DateTime.Now;
                myPizzaOrder.pizzeria_name = menu.name;

                if (ship.Items[0].Selected)
                    myPizzaOrder.sendhome = true;
                else if (ship.Items[1].Selected)
                    myPizzaOrder.sendhome = false;
                
                SaveQueue(myPizzaOrder);

                cart.Text = "";
                Panel1.Visible = false;
                
                Label3.Text = "";
                                
                confirmmail(mail.Text,name.Text);

                Print();

                total_price = 0;
                foreach (pizza myPizza2 in myPizzaQueue)
                    total_price += myPizza2.calc_price();
                myPizzaQueue.Clear();

                string sms;
                sms = "התקבלה הזמנה מאת: ";
                sms += name.Text;
                sms += " טלפון: ";
                sms += phone.Text;
                sms += " ";
                sms += "ב";
                sms += ": ";
                sms += total_price.ToString("00.00###");
                sms += " שקל";
                sms += " , טל-פיצה";
                
                if (sendsms.Checked == true)
                    SendSms(sms);
                
                mail4.Text = mail.Text;
                MultiView1.ActiveViewIndex = 2;
                return;
            } 


            Label4.Visible = false;              // מעבר לתפריט אמצעי
            Label4.Text = "";
            next.Text = "סיום הזמנה";
            next.ToolTip = "סיום ושליחת ההזמנה";
            previous.Visible = true;

            city.Text = menu.city;


            MultiView1.ActiveViewIndex = 1;

        }

        protected void clearlist_Click2(object sender, EventArgs e)  // ריקון עגלה
        {
            itemslist.Items.Clear();
            foreach (string name in menu.items)
            {
                
                string fullname = name;
                itemslist.Items.Add(fullname);
            }
            cart.Text = "";
            Panel1.Visible = false;
            myPizzaQueue.Clear();
            Label3.Text = "";            
        }

        protected void prev_Click(object sender, EventArgs e)   // חזור לתפריט ראשון
        {
            next.Text = "המשך בהזמנה";
            next.ToolTip = "המשך הזמנה";
            previous.Visible = false;
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string coupon2= Request.QueryString.Get("Coupon");
            
            int coupon3 = Convert.ToInt32(coupon2);
            coupon = 0;

            if (coupon3 == 10010)                
              coupon = 0.1;

            //if (coupon3 == 10020)
                //coupon = 0.2;


            if (coupon == 0)
                Label6.Text = "";

            if (coupon != 0)
            {
                string coup = "לרשותך קופון המקנה";
                coup += " ";
                coup += (coupon * 100).ToString();
                coup += "%";
                coup += " ";
                coup += "הנחה";
                Label6.Text = coup;
            }
    
            string total = the_total_price.Text;
            if ((first_time == true)||(the_total_price.Text=="00.00")||(the_total_price.Text==""))
            {
                menu = new newyork();
                itemslist.Items.Clear();
                foreach (string name in menu.items)
                {
                    //string fullname = "פיצה ";
                    string fullname = name;
                    itemslist.Items.Add(fullname);
                }

                cart.Text = "";
                Panel1.Visible = false;
                myPizzaQueue.Clear();
                first_time = false;
            }
                Print();
        }


        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }        
                            

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            cart.Text = "";
            Panel1.Visible = false;
            myPizzaQueue.Clear();
            Label3.Text = "";
        }

        protected void itemslist_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ship_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click1(object sender, EventArgs e)
        {                  
            

            String server, database, uid, password;                       

            server = "localhost";
            database = "1135_pizza";
            uid = "1135_tamord";
            password = "tal12345";
            
            string connectionString;

            connectionString = "SERVER=" + server + ";" + "DATABASE=" +
            database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";

            MySqlConnection mysqlCon = new MySqlConnection(connectionString);
            
            try
            {
                mysqlCon.Open();
            }
            catch (Exception ex)
            {
               // oops
            }
            
            string query = "SELECT * FROM pizza WHERE ID=1";
            MySqlCommand cmd = new MySqlCommand(query, mysqlCon);
            MySqlDataReader dataReader = cmd.ExecuteReader();
            dataReader.Read();
            //LabelTest.Text = (string)dataReader["USERNAME"];

            mysqlCon.Close();



        }

       

    
       

      
    }
}