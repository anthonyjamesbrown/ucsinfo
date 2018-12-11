<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Slots.aspx.vb" Inherits="UCS.Slots" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 100%;
        }
        .style5
        {
            width: 143px;
        }
        .style6
        {
            width: 277px;
        }
        .style7
        {
            width: 71px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Slot Inventory</h2>
    <table class="style4">
        <tr>
            <td class="style5">
                Filter By UCS:</td>
            <td class="style6">
                <asp:DropDownList ID="UCS_DropDownList" runat="server" 
                    DataSourceID="SqlDataSource_UCSNames" DataTextField="InstanceName" 
                    DataValueField="InstanceName" AppendDataBoundItems="True" 
                    AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="%">All</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_UCSNames" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT [InstanceName] FROM [UCSInstances] ORDER BY [InstanceName]">
                </asp:SqlDataSource>
            </td>
            <td class="style7">
                Presence:</td>
            <td>
                <asp:DropDownList ID="Presence_DropDownList" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource_PresenceTypes" DataTextField="Presence" 
                    DataValueField="Presence" AppendDataBoundItems="True">
                    <asp:ListItem Selected="True" Value="%">All</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_PresenceTypes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [Presence] FROM [v_ActiveSlots] ORDER BY [Presence]">
                </asp:SqlDataSource>
            </td>
            <td align="right">
                <asp:Button ID="Export_Button" runat="server" Text="XL" BackColor="#009900" 
                    Font-Bold="True" ForeColor="White" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1"
        CssClass="mGrid"
        PagerStyle-CssClass="pgr"
        AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="30"
        >
        <Columns>
            <asp:BoundField DataField="Ucs" HeaderText="Ucs" SortExpression="Ucs" />
            <asp:BoundField DataField="ChassisID" HeaderText="ChassisID" 
                SortExpression="ChassisID" />
            <asp:BoundField DataField="SlotID" HeaderText="SlotID" 
                SortExpression="SlotID" />
            <asp:BoundField DataField="Presence" HeaderText="Presence" 
                SortExpression="Presence" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
        SelectCommand="SELECT [Ucs], [ChassisID], [SlotID], [Presence] FROM [v_ActiveSlots] WHERE (([Ucs] LIKE '%' + @Ucs + '%') AND ([Presence] LIKE '%' + @Presence + '%')) ORDER BY [Ucs], [ChassisID], [SlotID]">
        <SelectParameters>
		    <asp:ControlParameter ControlID="UCS_DropDownList" PropertyName="SelectedValue" 
                    DefaultValue="%" Name="Ucs" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="Presence_DropDownList" PropertyName="SelectedValue" 
                    DefaultValue="%" Name="Presence" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Records_Label" runat="server" Text="Records Returned"></asp:Label>
</asp:Content>
