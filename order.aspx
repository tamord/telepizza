<%@ Page Title="טל-פיצה: הדגמת מערכת הזמנת פיצות" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="tele_pizza_order.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style5
        {
            width: 75%;
        }
        .style7
        {
            color: #FF0000;
            font-size: x-large;
        }
        .style8
        {
            width: 64%;
        }
        .style9
        {
            font-size: x-large;
            direction: ltr;
        }
        .style10
        {
            width: 66%;
        }
    .style11
    {
        color: #003300;
        font-size: x-large;
    }
        .style12
        {
            color: #006600;
            font-size: x-large;
        }
        .style13
        {
            color: #339966;
            font-size: x-large;
        }
        .style14
        {
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table align="center" class="style5" dir="rtl">
        <tr>
            <td style="font-size: xx-small">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <span class="style9">ברוכים הבאים לאתר <span class="style2">פיצה ניו יורק</span>, 
                        מה תרצו להזמין?<br /> </span>
                        <br />
                        <span class="style9">ברצוני להזמין:&nbsp;</span><span class="style7">&nbsp; </span>&nbsp;<asp:DropDownList 
                            ID="itemslist" runat="server" style="color: #000099; font-size: medium" 
                            Width="183px" ToolTip="סוג פיצה" 
                            onselectedindexchanged="itemslist_SelectedIndexChanged">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp; <span class="style9">כמה:&nbsp;</span><span class="style7">&nbsp;&nbsp;
                        <asp:DropDownList ID="how_many" runat="server" 
                            style="color: #000099; font-size: medium" Width="48px" 
                            ToolTip="כמה פיצות ברצונך להזמין">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                        </span>
                        <br />
                        <br />
                        <table align="right" class="style8" dir="rtl">
                            <tr>
                                <td>
                                    <span class="style9">תוספות:</span><span class="style7">&nbsp;&nbsp;&nbsp;&nbsp; </span>
                                </td>
                                <td>
                                    <span class="style7">
                                    <asp:CheckBoxList ID="tosafot2" runat="server" BorderWidth="1px" Height="42px" 
                                        RepeatColumns="4" style="font-size: medium; text-align: right; color: #003300" 
                                        Width="423px" ToolTip="תוספות רצויות">
                                        <asp:ListItem Value="1">זיתים</asp:ListItem>
                                        <asp:ListItem>פטריות</asp:ListItem>
                                        <asp:ListItem Value="2">בצל</asp:ListItem>
                                        <asp:ListItem Value="3">עגבניות</asp:ListItem>
                                        <asp:ListItem Value="4">פלפל</asp:ListItem>
                                        <asp:ListItem>תירס</asp:ListItem>
                                    </asp:CheckBoxList>
                                    </span>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        <table align="right" class="style10" dir="rtl">
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" 
                                        style="font-size: medium; color: #CC0000; text-align: right" Visible="False"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label6" runat="server" style="font-size: medium; color: #339966"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<table align="right" class="style14">
                            <tr>
                                <td>
                                    <asp:Button ID="Button3" runat="server" onclick="additem" Text="הוסף לעגלה" 
                                        ToolTip="הוספת פריטים לעגלת הקניות" Width="107px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="clearlist1" runat="server" onclick="clearlist_Click2" 
                                        Text="רוקן עגלה" ToolTip="ריקון עגלת קניות" Width="124px" />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <span class="style9"><span class="style11">אנא המשיכו בהזמנה:<br />
                        <br />
                        </span>שם פרטי:&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                            runat="server" ControlToValidate="name" ErrorMessage="חסר שם פרטי" 
                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="name" runat="server" Width="152px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp; <span class="style9">
                        <br />
                        שם משפחה:&nbsp;&nbsp;*<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator2" runat="server" ControlToValidate="family" 
                            ErrorMessage="חסר שם משפחה" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp; </span>
                        <asp:TextBox ID="family" runat="server" Width="150px"></asp:TextBox>
                        <br />
                        <br />
                        <span class="style9">עיר:&nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="city" runat="server" Enabled="False" 
                            style="font-size: medium" Width="100px">תל אביב</asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp; <span class="style9">
                        <br />
                        כתובת:&nbsp;&nbsp;*<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="ktovet" 
                            ErrorMessage="חסרה כתובת" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="ktovet" runat="server" Width="332px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <span class="style9">אימייל:&nbsp;*<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator4" runat="server" ControlToValidate="mail" 
                            ErrorMessage="חסרה כתובת אימייל" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="mail" ErrorMessage="כתובת אימייל אינה חוקית" 
                            style="color: #CC0000" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="mail" runat="server" Width="195px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;<br /> <span class="style9">טלפון:&nbsp;&nbsp;*<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator5" runat="server" ControlToValidate="phone" 
                            ErrorMessage="חסר מספר טלפון" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="phone" runat="server" Width="195px"></asp:TextBox>
                        <br />
                        <br />
                        <span class="style9">משלוח \ איסוף עצמי:&nbsp;*&nbsp;&nbsp;
                        <asp:DropDownList ID="ship" runat="server" style="font-size: medium" 
                            Height="23px" ToolTip="האם ברצונך לקבל משלוח או לאסוף באופן עצמאי" 
                            onselectedindexchanged="ship_SelectedIndexChanged">
                            <asp:ListItem Value="1">משלוח</asp:ListItem>
                            <asp:ListItem Value="2">איסוף עצמי</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <br />
                        הערות:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="comments" runat="server" Width="328px" 
                            style="text-align: right"></asp:TextBox>
                        <br />
                        </span>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            style="font-size: large; color: #990000;" />
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <span class="style9"><span class="style13">הזמנתך התקבלה!</span><span 
                            class="style12"><br />
                        <br />
                        </span>בקרוב תקבל\י למייל הודעת אישור על כך שהזמנתך<br />
                        התקבלה. לאחר הכנת ושליחת הפיצה תקבל\י הודעה
                        <br />
                        נוספת המאשרת את הקניה. בתיאבון<br />
                        <br />
                        ההודעות יישלחו למייל שציינת:
                        <asp:Label ID="mail4" runat="server" 
                            style="color: #339966; font-weight: 700; font-size: large"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <span class="style12">
                        <br />
                        <br />
                        </span></span>
                    </asp:View>
                </asp:MultiView>
                <br />
                <br />
                <asp:Panel ID="Panel1" runat="server" style="text-align: center">
                    <asp:Label ID="Label2" runat="server" 
    style="font-size: large" Text="סה&quot;כ לתשלום:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="the_total_price" runat="server" Enabled="False" Height="26px" 
                        Width="168px" ToolTip="סכום לתשלום"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="next" runat="server" onclick="next_Click" Text="המשך בהזמנה" 
                        ToolTip="המשך הזמנה" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="previous" runat="server" CausesValidation="False" 
                        onclick="prev_Click" Text="חזור" Visible="False" Width="68px" 
                        ToolTip="חזרה לתפריט קודם" />
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" 
                        style="font-size: medium; color: #CC0000; text-align: right" Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="cart" runat="server" BorderWidth="1px" Height="282px" 
                        style="font-size: large; text-align: right; color: #000000;" Width="586px"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:Timer ID="Timer1" runat="server" Interval="900000" ontick="Timer1_Tick">
                    </asp:Timer>
                    <br />
                    <asp:CheckBox ID="sendsms" runat="server" />
                    <br />
                    <br />
                </asp:Panel>
                <br />
            </td>
        </tr>
    </table>
<p>
</p>
</asp:Content>
