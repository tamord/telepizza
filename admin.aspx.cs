using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Net;
using System.Net.Mail;

namespace tele_pizza_order
{
    public partial class admin2 : System.Web.UI.Page
    {
        static Queue<pizza> myPizzaQueue = new Queue<pizza>();
        static pizzeria menu = new newyork();
        static pizzaorder myPizzaOrder = new pizzaorder();
        static Queue<pizzaorder> myPizzaOrderQueue = new Queue<pizzaorder>();
               

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


        }

        public void Ordermail(string mail, string body, string subject)      // שליחת אימייל
        {


            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage
                ("support@telepizza.co.il", mail, subject, body);


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
                string s = errc.ToString();
            }
        }


        public void cancelmail(string mail)          // שלח הודעת אישור
        {
            string body = "שלום רב,";
            body += "\n\n";
            body += "הודעה זאת נשלחה כדי להודיע לך שהזמנתך בטל-פיצה בוטלה";
            body += "\n\n";
            if (DropDownList1.Text != "ללא סיבה")
            {
                body += "סיבת הביטול: ";
                body += DropDownList1.Text;
                body += "\n\n";
            }
                        body += "אנו מודים לך על השימוש במערכת טל-פיצה, ומקווים לשרת אותך בעתיד.";
            body += "\n\n";
            body += "תודה ולהתראות,";
            body += "\n";
            body += "צוות טל-פיצה";
            Ordermail(mail, body,"הזמנתך בוטלה");
        }
        public void delaymail(string mail)          // שלח הודעת אישור
        {
            string body = "שלום רב,";
            body += "\n\n";
            body += "הודעה זאת נשלחה כדי להודיע לך שהזמנתך בטל-פיצה מתעכבת";
            body += "\n\n";
            body += "זמן העיכוב המוערך הוא: " + DropDownList3.SelectedValue;
            body += "\n\n";
            body += "אנו מתנצלים על העיכוב ומודים לך על השימוש במערכת טל-פיצה";
            body += "\n\n";
            body += "תודה ולהתראות,";
            body += "\n";
            body += "צוות טל-פיצה";
            Ordermail(mail, body, "הזמנתך מתעכבת");
        }

        public void successmail(string mail,string str)          // שלח הודעת אישור
        {
            string body = "שלום רב,";
            body += "\n\n";
            body += "הודעה זאת נשלחה כדי להודיע לך שהזמנתך בטל-פיצה אושרה";
            body += "\n\n";
            body += "הזמנת: ";
            body += str;
            body += "\n\n";
            body += "הפיצה כבר בדרך! היא תגיע בקרוב בהתאם לזמני המשלוח";            
            body += "\n\n";
            body += "אנו מודים לך על השימוש במערכת טל-פיצה, ומקווים לשרת אותך בעתיד.";
            body += "\n\n";
            body += "תודה ולהתראות,";
            body += "\n";
            body += "צוות טל-פיצה";
            Ordermail(mail, body, "הזמנתך אושרה - המשלוח בדרך");
        }

        protected void Update_Click(object sender, EventArgs e)

        {
            // update view

            string path = menu.serverpath;
            //string path = @"D:\Domains\new-york-pizzabiz\new-york-pizza.biz\wwwroot";

            FileInfo fi = new FileInfo(path + @"\push.txt");
            if (fi.Exists)
            {
                fi.Delete();
                Label2.Visible=true;
            }
            else 
                Label2.Visible=false;

            FileInfo fi2 = new FileInfo(path + @"\data.txt");
            if (fi2.Exists)
                using (FileStream fs = fi2.OpenRead())
                {
                    BinaryFormatter formatter = new BinaryFormatter();
                    myPizzaOrderQueue = (Queue<pizzaorder>)formatter.Deserialize(fs);
                }
            else
                myPizzaOrderQueue.Clear();

            ListBox1.Items.Clear();

            foreach (pizzaorder pizord in myPizzaOrderQueue)
            {
                string str4 = pizord.time.Date.Day.ToString() + '/' + pizord.time.Date.Month.ToString()
                + '/' + pizord.time.Date.Year.ToString();

                string str5=extract_minutes(pizord.time.Minute.ToString());
                string str6 = extract_hours(pizord.time.Hour.ToString());
                   
                string str = str4;
                
                str += "     ";
                str += str6 + ":" + str5;                                

                str += "     ";
                str += pizord.name.ToString() + " " + pizord.family.ToString();
                str += "     ";
              
                

                myPizzaQueue = pizord.myPizzaQueue;

                double total = 0;
                int count = 0;

                foreach (pizza pz in myPizzaQueue)
                {
                    total += pz.calc_price();
                    count++;
                }

                if (count == 1)
                    str += "פיצה אחת: ";
                else 
                   str += count.ToString() + " פיצות: ";

                str += total.ToString("00.00###");
                str +=  " ש\"ח";

                str = str.Replace(' ', '\xA0');

                ListItem listitem = new ListItem(str);
                ListBox1.Items.Add(listitem);
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)

        // נהל הזמנה נלחץ
        {                       
            
            if (myPizzaOrderQueue.Count == 0)
                return;
            
            int index = ListBox1.SelectedIndex;
            if (index == -1)
                return;

            MultiView1.ActiveViewIndex = 1;

            pizzaorder[] myArray = myPizzaOrderQueue.ToArray();
            pizzaorder pizord = myArray[index];

            string str4 = pizord.time.Date.Day.ToString() + '/' + pizord.time.Date.Month.ToString()
                +'/'+pizord.time.Date.Year.ToString();
            
            
            string str = str4;
            string str6 = extract_hours(pizord.time.Hour.ToString());
            string str5 = extract_minutes(pizord.time.Minute.ToString());
                        
            
            str += "     ";
            str += str6 + ":" + str5;
            str += "     ";
            str += pizord.name.ToString() + " " + pizord.family.ToString();
            str += "     ";
            
            double total=0; int count=0;

            foreach (pizza pz in pizord.myPizzaQueue)
            {
                total += pz.calc_price();
                count++;
            }
            if (count == 1)
                str += "פיצה אחת: ";
            else
                str += count.ToString() + " פיצות: ";

            string str2="";
            str += total.ToString("00.00###");
            str2 += total.ToString("00.00###");
            str += " ש\"ח";
            str2 += " ש\"ח";

            myorder.Text = str;
            total_price.Text=str2;

            name.Text = pizord.name;
            family.Text=pizord.family;
            address.Text=pizord.address;
            city.Text=pizord.city;
            mail.Text=pizord.mail;
            pizzeria_name.Text = pizord.pizzeria_name;
            phone.Text=pizord.phone;            
            comments.Text = pizord.comments;
            if (pizord.sendhome == true)
                ship.SelectedIndex = 0;
            else
                ship.SelectedIndex=1;


            myPizzaQueue = pizord.myPizzaQueue;
            Print();            

        }

        protected void Button5_Click(object sender, EventArgs e)

            // back to menu 0
        {
            MultiView1.ActiveViewIndex =0;
            Panel1.Visible = false;
            Panel3.Visible = false;
        }

        protected void Button4_Click(object sender, EventArgs e)

            // cancel menu
        {
            Panel1.Visible = true;
        }

        protected void next_Click(object sender, EventArgs e)
        {

            // cancel order clicked 

            
            Panel1.Visible = false;

            int index = ListBox1.SelectedIndex;
            if (index == -1)
                return;

            Queue<pizzaorder> myPizzaOrderQueue2 = new Queue<pizzaorder>();
            int count=0;

            foreach (pizzaorder piz in myPizzaOrderQueue)
            {
                if (index != count)
                    myPizzaOrderQueue2.Enqueue(piz);
                count++;
            }
            
            
            MultiView1.ActiveViewIndex = 0;

            string path = menu.serverpath;
            //string path = @"D:\Domains\new-york-pizzabiz\new-york-pizza.biz\wwwroot";

            FileInfo fi = new FileInfo(path + @"\data.txt");
            if (fi.Exists)
            {
                fi.Delete();
            }

            using (FileStream outStream = fi.Create())
            {
                BinaryFormatter formatter = new BinaryFormatter();
                formatter.Serialize(outStream, myPizzaOrderQueue2);
            }
            cancelmail(mail.Text);
            Update_Click(sender, e);
            Panel1.Visible = false;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // pizza sent menu

            int index = ListBox1.SelectedIndex;
            if (index == -1)
                return;

            Queue<pizzaorder> myPizzaOrderQueue2 = new Queue<pizzaorder>();
            int count=0;

            foreach (pizzaorder piz in myPizzaOrderQueue)
            {
                if (index != count)
                    myPizzaOrderQueue2.Enqueue(piz);
                count++;
            }



            string path = menu.serverpath;
            //string path = @"D:\Domains\new-york-pizzabiz\new-york-pizza.biz\wwwroot";

            FileInfo fi = new FileInfo(path + @"\data.txt");
            if (fi.Exists)
            {
                fi.Delete();
            }

            using (FileStream outStream = fi.Create())
            {
                BinaryFormatter formatter = new BinaryFormatter();
                formatter.Serialize(outStream, myPizzaOrderQueue2);
            }
            MultiView1.ActiveViewIndex = 0;

            double total = 0;
            int count2 = 0;
            string str="";

            foreach (pizza pz in myPizzaQueue)
            {
                total += pz.calc_price();
                count2++;
            }
            if (count2 == 1)
                str += "פיצה אחת: ";
            else
                str += count2.ToString() + " פיצות: ";

            str += total.ToString("00.00###");
            str += " ש\"ח";
            successmail(mail.Text,str);
            successmail("tamord@gmail.com",str);
            Update_Click(sender, e);

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            // timer 

            if (MultiView1.ActiveViewIndex==0)
                Update_Click(sender, e);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            // admin login

            if ((username.Text == "admin") && (password.Text == "admin"))
                MultiView1.ActiveViewIndex = 0;
            Label3.Visible = true;
            return;
        }

        protected void next0_Click(object sender, EventArgs e)
        {
            // delay clicked 

            Panel3.Visible = false;
            delaymail(mail.Text);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            // go to delay menu

            Panel3.Visible = true;
        }

        protected void back_Click(object sender, EventArgs e)
        {
            // return from cancel menu
            Panel1.Visible = false;
        }

        protected void back2_Click(object sender, EventArgs e)
        {
            // return from delay menu
            Panel3.Visible = false;
        }

        public string extract_minutes(string minutes)
        {
            if (minutes == "0") return "00";
            if (minutes == "1") return "01";
            if (minutes == "2") return "02";
            if (minutes == "3") return "03";
            if (minutes == "4") return "04";
            if (minutes == "5") return "05";
            if (minutes == "6") return "06";
            if (minutes == "7") return "07";
            if (minutes == "8") return "08";
            if (minutes == "9") return "09";
            return minutes;
        }

        public string extract_hours(string minutes)
        {
            if (minutes == "0") return "00";
            if (minutes == "1") return "01";
            if (minutes == "2") return "02";
            if (minutes == "3") return "03";
            if (minutes == "4") return "04";
            if (minutes == "5") return "05";
            if (minutes == "6") return "06";
            if (minutes == "7") return "07";
            if (minutes == "8") return "08";
            if (minutes == "9") return "09";
            return minutes;
        }

        protected void ship_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        
       
    }
}