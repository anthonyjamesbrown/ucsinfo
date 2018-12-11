<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UCSInstances.aspx.vb" Inherits="UCS.WebForm1" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 1550px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
    UCS Instances</h2>
    <table>
        <tr>
            <td align="right" class="style4">
                <asp:Button ID="Export_Button" runat="server" Text="XL" BackColor="#009900" 
                    Font-Bold="True" ForeColor="White" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1"
        CssClass="mGrid"
        PagerStyle-CssClass="pgr"
        AlternatingRowStyle-CssClass="alt" AllowSorting="True">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="DataCenter,InstanceName" 
                DataNavigateUrlFormatString="UCSInstanceDetails.aspx?UCS={1}" 
                DataTextField="InstanceName" HeaderText="InstanceName">
            <ControlStyle ForeColor="#323232" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="IPAddress" HeaderText="IPAddress" 
                SortExpression="IPAddress" />
            <asp:BoundField DataField="Location" HeaderText="Location" 
                SortExpression="Location" />
            <asp:BoundField DataField="RowRack" HeaderText="Row/Rack"
                SortExpression="RowRack" />
            <asp:BoundField DataField="CoreDmz" HeaderText="CoreDmz" 
                SortExpression="CoreDmz" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:BoundField DataField="DataCenter" HeaderText="DataCenter" 
                SortExpression="DataCenter" />
            <asp:BoundField DataField="Version" HeaderText="Version" 
                SortExpression="Version" />
            <asp:BoundField DataField="CallHome" HeaderText="CallHome" 
                SortExpression="CallHome" />
            <asp:BoundField DataField="ChassisCount" HeaderText="ChassisCount" 
                SortExpression="ChassisCount" />
            <asp:BoundField DataField="BladeCount" HeaderText="BladeCount" 
                SortExpression="BladeCount" />
            <asp:BoundField DataField="EmptySlots" HeaderText="EmptySlots" 
                SortExpression="EmptySlots" />
            <asp:BoundField DataField="PrimaryDNS" HeaderText="PrimaryDNS" ReadOnly="True" 
                SortExpression="PrimaryDNS" />
            <asp:BoundField DataField="PrimaryNTP" HeaderText="PrimaryNTP" ReadOnly="True" 
                SortExpression="PrimaryNTP" />
            <asp:BoundField DataField="AdminState" HeaderText="AdminState" 
                SortExpression="AdminState" />
            <asp:BoundField DataField="SysContact" HeaderText="SysContact" 
                SortExpression="SysContact" />
            <asp:BoundField DataField="SysLocation" HeaderText="SysLocation" 
                SortExpression="SysLocation" />
            <asp:BoundField DataField="LastScanned" HeaderText="LastScanned" 
                SortExpression="LastScanned" />
        </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
        SelectCommand="SELECT * FROM [v_UCS_Geninfo] ORDER BY [InstanceName] ASC"></asp:SqlDataSource>
    <asp:Label ID="Records_Label" runat="server" Text="Records Returned"></asp:Label>
    <asp:Label ID="Chassis_Label" runat="server" Text="Chassis Count: "></asp:Label>
</asp:Content>
