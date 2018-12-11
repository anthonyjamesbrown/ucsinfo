<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="UCS._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        WelCOME to the UCS Data Viewer application</h2>
    <p>
        This application is intended to view data in the UCS database.&nbsp; The data in 
        the database is gathered by the Get-ScanUCSInstance Cmdlet in the AB-UCS PowerShell 
        module.&nbsp; Contact
        <a href="mailto:anthony.brown@asurion.com">anthony.brown@asurion.com</a> for 
        details.</p>
</asp:Content>
