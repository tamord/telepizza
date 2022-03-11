<%@ Page Title="טל-פיצה: הדגמת מערכת רכישת פיצות - אתר מנהל" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="tele_pizza_order.admin2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style9
        {
            font-size: x-large;
            }
        .style10
        {
            text-decoration: underline;
        }
        .style11
        {
            width: 605px;
            text-align: right;
        }
        .style12
        {
            color: maroon;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table align="right" class="style4" dir="rtl">
        <tr>
            <td>
                <span class="style9" __designer:mapid="7d"><span class="style2">
                <span class="style10">תפריט מנהל</span><br />
                </span>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <br />
                        <span class="style9">רשימת הזמנות פעילות&nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" style="color: #339966" 
                            Text="הזמנה חדשה התקבלה!" Visible="False"></asp:Label>
                        <br />
                        <br style="font-size: small" />
                        </span>
                        <asp:ListBox ID="ListBox1" runat="server" Height="98px" 
                            style="text-align: center" Width="476px" AutoPostBack="True" 
                            onselectedindexchanged="Button2_Click"></asp:ListBox>
                        <br />
                        &nbsp;<asp:Button ID="Update1" runat="server" onclick="Update_Click" Text="עדכן תצוגה" 
                            Width="99px" ToolTip="לחץ כאן כדי לעדכן רשימת הזמנות פעילות" />
                        &nbsp;&nbsp;&nbsp;
                        <span class="style9">
                        <asp:Button ID="Update2" runat="server" onclick="Button2_Click" 
                            Text="ניהול הזמנה" Width="99px" 
                            ToolTip="בחר הזמנה מהרשימה ולחץ כאן כדי לנהל אותה" />
                        </span>
                        <br />
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table align="right" class="style4" dir="rtl">
                            <tr>
                                <td class="style11">
                                    <span class="style9">
                                    <asp:TextBox ID="myorder" runat="server" Enabled="False" 
                                        style="text-align: right; margin-left: 0px; font-size: small;" 
                                        Width="419px" Height="44px"></asp:TextBox>
                                    <br />
                                    </span>
                                    <br />
                                    <asp:Button ID="Button3" runat="server" Text="ההזמנה נשלחה" Width="155px" 
                                        onclick="Button3_Click" ToolTip="לחץ כאן כאשר ההזמנה נשלחה" />
                                    <span class="style9">
                                    &nbsp;&nbsp; &nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" style="margin-left: 0px" 
                                        Text="בטל הזמנה" Width="155px" onclick="Button4_Click" 
                                        ToolTip="לחץ כאן כדי לבטל הזמנה" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
                                        style="margin-left: 0px" Text="חזור לרשימת ההזמנות" Width="155px" 
                                        ToolTip="חזור לתפריט ראשי" />
                                    <br />
                                    <asp:Button ID="Button7" runat="server" onclick="Button7_Click" 
                                        style="margin-left: 0px" Text="עיכוב הזמנה" 
                                        ToolTip="לחץ כאן כדי לשלוח הודעת עיכוב" Width="155px" />
                                    <br />
                                    <asp:Panel ID="Panel2" runat="server">
                                        <asp:Panel ID="Panel3" runat="server" Visible="False">
                                            <span class="style9">זמן העיכוב:&nbsp;
                                            <asp:DropDownList ID="DropDownList3" runat="server" Height="23px" 
                                                style="margin-right: 0px" ToolTip="מה סיבת ביטול ההזמנה?" Width="162px">
                                                <asp:ListItem>15 דקות</asp:ListItem>
                                                <asp:ListItem>30 דקות</asp:ListItem>
                                                <asp:ListItem>45 דקות</asp:ListItem>
                                                <asp:ListItem>שעה</asp:ListItem>
                                                <asp:ListItem>שעה ורבע</asp:ListItem>
                                                <asp:ListItem>שעה וחצי</asp:ListItem>
                                                <asp:ListItem>לא ידוע</asp:ListItem>
                                            </asp:DropDownList>
                                            &nbsp;
                                            <asp:Button ID="next1" runat="server" onclick="next0_Click" Text="המשך" 
                                                Width="76px" />
                                            &nbsp;&nbsp;
                                            <asp:Button ID="back0" runat="server" onclick="back2_Click" Text="חזרה" 
                                                Width="76px" />
                                            </span>
                                        </asp:Panel>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel1" runat="server" Visible="False">
                                        <asp:Label ID="Label1" runat="server" Text="סיבת הביטול:"></asp:Label>
                                        &nbsp;&nbsp;
                                        <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" 
                                            style="margin-right: 0px" ToolTip="מה סיבת ביטול ההזמנה?" Width="162px">
                                            <asp:ListItem>עומס</asp:ListItem>
                                            <asp:ListItem>בעיות טכניות</asp:ListItem>
                                            <asp:ListItem>כתובת רחוקה מידי</asp:ListItem>
                                            <asp:ListItem>הפיצריה סגורה</asp:ListItem>
                                            <asp:ListItem>ללא סיבה</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:Button ID="next" runat="server" onclick="next_Click" Text="המשך" 
                                            Width="76px" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="back" runat="server" onclick="back_Click" Text="חזרה" 
                                            Width="76px" />
                                    </asp:Panel>
                                    <br />
                                    <span class="style12">הזמנה בפיצריה:&nbsp;
                                    <asp:TextBox ID="pizzeria_name" runat="server" Enabled="False" 
                                        style="text-align: right"></asp:TextBox>
                                    </span>
                                    <br />
                                    <span class="style12">
                                    <br />
                                    פרטי הלקוח:<br /> </span>שם פרטי:&nbsp;
                                    </span>
                                    <asp:TextBox ID="name" runat="server" Enabled="False"></asp:TextBox>
                                    <br />
                                    שם משפחה: <span class="style9">
                                    <asp:TextBox ID="family" runat="server" style="text-align: right" 
                                        Enabled="False"></asp:TextBox>
                                    <br />
                                    עיר:
                                    </span>
                                    <asp:TextBox ID="city" runat="server" Enabled="False">תל אביב</asp:TextBox>
                                    <br />
                                    כתובת:
                                    <asp:TextBox ID="address" runat="server" style="margin-right: 0px" 
                                        Width="316px" Enabled="False"></asp:TextBox>
                                    <br />
                                    אימייל:
                                    <asp:TextBox ID="mail" runat="server" Width="215px" Enabled="False"></asp:TextBox>
                                    <br />
                                    טלפון:
                                    <asp:TextBox ID="phone" runat="server" Enabled="False"></asp:TextBox>
                                    <br />
                                    <span class="style9">משלוח \ איסוף עצמי:&nbsp;<asp:DropDownList ID="ship" 
                                        runat="server" Height="23px" style="font-size: medium" Enabled="False" 
                                        onselectedindexchanged="ship_SelectedIndexChanged">
                                        <asp:ListItem Value="1">משלוח</asp:ListItem>
                                        <asp:ListItem Value="2">איסוף עצמי</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;
                                    <br />
                                    הערות: </span>
                                    <asp:TextBox ID="comments" runat="server" Width="359px" Enabled="False"></asp:TextBox>
                                    <br />
                                    <span class="style9"><span class="style12">
                                    <br />
                                    סה&quot;כ לתשלום:
                                    <asp:TextBox ID="total_price" runat="server" Enabled="False"></asp:TextBox>
                                    <br />
                                    הזמנה:<br /> </span></span>
                                    <asp:Label ID="cart" runat="server" BorderWidth="1px" Height="282px" 
                                        style="font-size: large" Width="586px"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <span class="style12">לכניסה למערכת נא להקליד שם משתמש וסיסמא<br /> </span>
                        <br />
                        <span class="style9">שם משתמש:&nbsp;&nbsp;
                        <asp:TextBox ID="username" runat="server"></asp:TextBox>
                        <br />
                        סיסמא:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label3" runat="server" style="color: #800000" 
                            Text="שם משתמש או סיסמא אינם נכונים!" Visible="False"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button6" runat="server" Height="30px" onclick="Button6_Click" 
                            Text="המשך" Width="70px" />
                        <br />
                        </span>
                        <br />
                    </asp:View>
                </asp:MultiView>
                <br />
                </span>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <br />
                <asp:Timer ID="Timer1" runat="server" Interval="30000" ontick="Timer1_Tick">
                </asp:Timer>
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>
    <br />
    <br __designer:mapid="f8" />
</asp:Content>
