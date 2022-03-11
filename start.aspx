<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="start.aspx.cs" Inherits="tele_pizza_order.start" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style6
        {
            color: #3366FF;
            font-size: xx-large;
            text-align: center;
            font-family: Verdana;
            text-decoration: underline;
        }
        .style2
        {
            color: #CC0000;
        }
        .style7
        {
            font-size: xx-large;
        }
a:link
	{color:#6600CC;
	text-decoration:underline;
	text-underline:single;
        }
        .style8
        {
            font-size: x-large;
            color: gray;
        }
        .style9
        {
            height: 20px;
        }
        .style10
        {
            color: #3366FF;
            font-size: xx-large;
            text-align: center;
            font-family: Verdana;
        }
        .style11
        {
            width: 498px;
        }
        .style12
        {
            font-size: x-large;
            color: #3333FF;
        }
        .style13
        {
            text-align: center;
        }
        .style15
        {
            font-size: x-large;
            color: #3E3E3E;
        }
    </style>
</head>
<body style="font-family: Arial">
    <form id="form1" runat="server">
    <p>
        <br />
    </p>
    <table align="center" style="border-style: solid; border-width: 2px">
        <tr>
            <td>
                        <asp:Image ID="Image9" runat="server" Height="182px" 
                            ImageUrl="~/pizza.jpg" Width="265px" />
                    </td>
            <td class="style11">
                <span class="style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <span class="style6">TelePizza</span><span class="style2"><br class="style7" />
                <span class="style7">אתר ההזמנות המקוון לפיצריות</span></span></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right">
                <p class="style13">
                    <span class="style15" dir="RTL" lang="HE" 
                        style="line-height: 150%; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-ascii-font-family: Calibri; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-hansi-font-family: Calibri;">
                    מערכת טל-פיצה מאפשרת קבלת הזמנות מקוונות לפיצריות.</span></p>
                <p class="style13">
                    <span class="style15" dir="RTL" lang="HE" 
                        style="line-height: 150%; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-ascii-font-family: Calibri; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-hansi-font-family: Calibri;">
                    עובדי הפיצריה שמקבלים את ההזמנה יכולים לטפל בה בזמן אמת, תוך אפשרות</span></p>
                <p class="style13">
                    <span class="style15" dir="RTL" lang="HE" 
                        style="line-height: 150%; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-ascii-font-family: Calibri; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-hansi-font-family: Calibri;">
                    לשלוח הודעת אישור שליחת הפיצה, הודעת ביטול וכן הודעת עיכוב ללקוח </span>
                </p>
                <p class="style13">
                    <span class="style15" dir="RTL" lang="HE" 
                        style="line-height: 150%; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-ascii-font-family: Calibri; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-hansi-font-family: Calibri;">
                    ניתן לדגום את המערכת מהקישורים הבאים:</span><span class="style8" dir="RTL" 
                        lang="HE" 
                        style="line-height: 150%; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-ascii-font-family: Calibri; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-hansi-font-family: Calibri;">
                    </span>&nbsp;</p>
                <p class="style13">
                    &nbsp;</p>
                <table align="center" style="border-style: solid; border-width: 1px">
                    <tr>
                        <td>
                            <span class="style12" dir="RTL" lang="HE" 
                                style="line-height: 150%; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-ascii-font-family: Calibri; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-hansi-font-family: Calibri;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            דף&nbsp; לעובדי הפיצריה </span>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td>
                            <span class="style12" dir="RTL" lang="HE" 
                                style="line-height: 150%; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-ascii-font-family: Calibri; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-hansi-font-family: Calibri;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            דף הזמנה ללקוחות</span></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image6" runat="server" BorderWidth="2px" Height="150px" 
                                ImageUrl="~/admin.JPG" Width="230px" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Image ID="Image7" runat="server" BorderWidth="2px" Height="150px" 
                                ImageUrl="~/order.JPG" Width="230px" />
&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:HyperLink ID="HyperLink2" runat="server" 
                                NavigateUrl="http://www.telepizza.co.il/admin.aspx" 
                                style="font-weight: 700; font-size: large" Target="_blank">דגום דף זה</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="style9">
                        </td>
                        <td class="style9">
                            &nbsp;&nbsp;
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl="http://www.telepizza.co.il/order.aspx" 
                                style="text-align: right; font-weight: 700; font-size: large" Target="_blank">דגום דף זה</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    </tr>
                </table>
                <p align="right" class="MsoNormal">
                    &nbsp;</p>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
