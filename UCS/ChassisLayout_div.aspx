<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ChassisLayout_div.aspx.vb" Inherits="UCS.ChassisLayout_div" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        /* Chassis Layouts
        -------------------------------------------------------------------*/
        #ChassisContainer
        {
            position:relative;
            top: 20px;
            left: 20px;
            width: 626px;
            height: 352px; 
        }
        #ChassisLeftSide 
        {
            position:absolute;
            top: 0px;
            left: 0px;
            width: 38px;
            height: 352px;
            background-image: url('/ModelImages/Chassis-LeftSide.png');   
        }
        #ChassisTop 
        {
            position:absolute;
            top: 0px;
            left: 38px;
            width: 550px;
            height: 3px;
            background-image: url('/ModelImages/Chassis-Top.png'); 
        }
        #ChassisRightSide 
        {
            position:absolute;
            top: 0px;
            left: 588px;
            width: 38px;
            height: 352px; 
            background-image: url('/ModelImages/Chassis-Rightside.png');   
        }
        #ChassisBottom
        {
            position:absolute;
            top: 282px;
            left: 38px;
            width: 550px;
            height: 70px;  
            background-image: url('/ModelImages/Chassis-Bottom.png');      
        }
        #ChassisVD1
        {
            position:absolute;
            top: 3px;
            left: 305px;
            width: 16px;
            height: 66px;
            background-image: url('/ModelImages/Chassis-TopCenter-Divider.png');       
        }
        #ChassisVD2
        {
            position:absolute;
            top: 69px;
            left: 305px;
            width: 16px;
            height: 71px;
            background-image: url('/ModelImages/Chassis-Center-Divider.png');   
        }
        #ChassisVD3
        {
            position:absolute;
            top: 140px;
            left: 305px;
            width: 16px;
            height: 71px; 
            background-image: url('/ModelImages/Chassis-Center-Divider.png');  
        }
        #ChassisVD4
        {
            position:absolute;
            top: 211px;
            left: 305px;
            width: 16px;
            height: 71px;
            background-image: url('/ModelImages/Chassis-Center-Divider.png');   
        }
        #ChassisHD1_1
        {
            position:absolute;
            top: 69px;
            left: 38px;
            width: 267px;
            height: 5px;  
            background-image: url('/ModelImages/Chassis-Verticle-Divider.png'); 
        }
        #ChassisHD1_2
        {
            position:absolute;
            top: 69px;
            left: 321px;
            width: 267px;
            height: 5px;   
            background-image: url('/ModelImages/Chassis-Verticle-Divider.png'); 
        }
        #ChassisHD2_1
        {
            position:absolute;
            top: 140px;
            left: 38px;
            width: 267px;
            height: 5px;  
            background-image: url('/ModelImages/Chassis-Verticle-Divider.png');  
        }
        #ChassisHD2_2
        {
            position:absolute;
            top: 140px;
            left: 321px;
            width: 267px;
            height: 5px;   
            background-image: url('/ModelImages/Chassis-Verticle-Divider.png'); 
        }
        #ChassisHD3_1
        {
            position:absolute;
            top: 211px;
            left: 38px;
            width: 267px;
            height: 5px;
            background-image: url('/ModelImages/Chassis-Verticle-Divider.png');    
        }
        #ChassisHD3_2
        {
            position:absolute;
            top: 211px;
            left: 321px;
            width: 267px;
            height: 5px;  
            background-image: url('/ModelImages/Chassis-Verticle-Divider.png'); 
        }
        
        #ChassisSlot1, #ChassisSlot2, #ChassisSlot3, #ChassisSlot4, #ChassisSlot5, #ChassisSlot6, #ChassisSlot7, #ChassisSlot8
        {
            color:Aqua;
            font-weight:bold;
            font-size:large; 
            text-decoration: underline;
        }
        
        #ChassisSlot1
        {
            position:absolute;
            top: 3px;
            left: 38px;
            width: 267px;
            height: 66px;  
            background-color: Gray; 
        }
        #ChassisSlot2
        {
            position:absolute;
            top: 3px;
            left: 321px;
            width: 267px;
            height: 66px;   
            background-color: Gray; 
        }
        #ChassisSlot3
        {
            position:absolute;
            top: 74px;
            left: 38px;
            width: 267px;
            height: 66px;   
            background-color: Gray; 
        }
        #ChassisSlot4
        {
            position:absolute;
            top: 74px;
            left: 321px;
            width: 267px;
            height: 66px; 
            background-color: Gray;   
        }
        #ChassisSlot5
        {
            position:absolute;
            top: 145px;
            left: 38px;
            width: 267px;
            height: 66px;   
            background-color: Gray; 
        }
        #ChassisSlot6
        {
            position:absolute;
            top: 145px;
            left: 321px;
            width: 267px;
            height: 66px;  
            background-color: Gray;  
        }
        #ChassisSlot7
        {
            position:absolute;
            top: 216px;
            left: 38px;
            width: 267px;
            height: 66px;   
            background-color: Gray; 
        }
        #ChassisSlot8
        {
            position:absolute;
            top: 216px;
            left: 321px;
            width: 267px;
            height: 66px;  
            background-color: Gray;  
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>
