<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ChassisLayout.aspx.vb" Inherits="UCS.ChassisLayout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Chassis Layout
    <table border="0" cellpadding="0" cellspacing="0" 
        style="border-collapse: collapse; padding: 0; margin: 0; height: 352px; width: 626px; table-layout: auto; border-spacing: 0px; line-height:0">
        <tr>
            <td rowspan="9">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/ModelImages/Chassis-Leftside.png" /></td>
            <td colspan="3">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/ModelImages/Chassis-Top.png" /></td>
            <td rowspan="9">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/ModelImages/Chassis-Rightside.png" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image16" runat="server" ImageUrl="~/ModelImages/UCSB-B200-M3.png" /></td>
            <td>
                <asp:Image ID="Image15" runat="server" ImageUrl="~/ModelImages/Chassis-TopCenter-Divider.png" /></td>
            <td>
                <asp:Image ID="Image17" runat="server" ImageUrl="~/ModelImages/UCSB-B200-M1-M2.png" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image13" runat="server" ImageUrl="~/ModelImages/Chassis-Verticle-Divider.png" /></td>
            <td rowspan="2">
                <asp:Image ID="Image10" runat="server" ImageUrl="~/ModelImages/Chassis-Center-Divider.png" /></td>
            <td>
                <asp:Image ID="Image14" runat="server" ImageUrl="~/ModelImages/Chassis-Verticle-Divider.png" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image18" runat="server" ImageUrl="~/ModelImages/UCSB-B200-M3.png" /></td>
            <td>
                <asp:Image ID="Image19" runat="server" ImageUrl="~/ModelImages/UCSB-B230-M1-M2.png" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image11" runat="server" ImageUrl="~/ModelImages/Chassis-Verticle-Divider.png" /></td>
            <td rowspan="2">
                <asp:Image ID="Image9" runat="server" ImageUrl="~/ModelImages/Chassis-Center-Divider.png" /></td>
            <td>
                <asp:Image ID="Image12" runat="server" ImageUrl="~/ModelImages/Chassis-Verticle-Divider.png" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image20" runat="server" ImageUrl="~/ModelImages/UCSB-B200-M3.png" /></td>
            <td>
                <asp:Image ID="Image21" runat="server" ImageUrl="~/ModelImages/UCSB-B230-M1-M2.png" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image6" runat="server" ImageUrl="~/ModelImages/Chassis-Verticle-Divider.png" /></td>
            <td rowspan="2">
                <asp:Image ID="Image8" runat="server" ImageUrl="~/ModelImages/Chassis-Center-Divider.png" /></td>
            <td>
                <asp:Image ID="Image7" runat="server" ImageUrl="~/ModelImages/Chassis-Verticle-Divider.png" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image22" runat="server" ImageUrl="~/ModelImages/UCSB-B230-M1-M2.png" /></td>
            <td>
                <asp:Image ID="Image23" runat="server" ImageUrl="~/ModelImages/UCSB-B200-M3.png" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/ModelImages/Chassis-Bottom.png" /></td>
        </tr>
    </table>
</asp:Content>
