<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UCSCapacity.aspx.vb" Inherits="UCS.UCSCapacity" EnableEventValidation="false" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 1550px;
        }
        #id1
        {
        }
        #id2
        {
            float:left;
            width: 35%; 
        }
        #chart0 #chart1
        {
            float:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td align="right" class="style4">
                <asp:Button ID="Export_Button" runat="server" Text="XL" BackColor="#009900" 
                    Font-Bold="True" ForeColor="White" />
            </td>
        </tr>
    </table>
    <div id="id1">
        <div id="id2">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" CssClass="mGrid" AlternatingRowStyle-CssClass="alt"
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="DataCenter" HeaderText="Data Center" SortExpression="DataCenter" />
                <asp:BoundField DataField="InstanceName" HeaderText="Instance Name" SortExpression="InstanceName" />
                <asp:BoundField DataField="ChassisCount" HeaderText="Chassis Count" ReadOnly="True" SortExpression="ChassisCount" />
                <asp:BoundField DataField="BladeCount" HeaderText="Blade Count" ReadOnly="True" SortExpression="BladeCount" />
                <asp:BoundField DataField="UnusedBlades" HeaderText="Unused Blades" ReadOnly="True" SortExpression="UnusedBlades" />
                <asp:BoundField DataField="EmptySlots" HeaderText="Empty Slots" ReadOnly="True" SortExpression="EmptySlots" />
                <asp:BoundField DataField="RackUnits" HeaderText="Rack Servers" ReadOnly="True" SortExpression="RackUnits" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                SelectCommand="SELECT * FROM [v_ActiveCapacity] ORDER BY [InstanceName] ASC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                SelectCommand="SELECT * FROM [v_ActiveCapacity] ORDER BY [InstanceName] DESC">
            </asp:SqlDataSource>
        </div>
        <div id="chart1">
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" 
                Width="816px" Height="687px">
                <Series>
                    <asp:Series Name="Blade Count" ChartType="StackedBar" IsXValueIndexed="True" 
                        MarkerSize="1" XValueMember="InstanceName" XValueType="String" 
                        YValueMembers="BladeCount" Legend="Legend1" IsValueShownAsLabel="True">
                    </asp:Series>
                    <asp:Series Name="Unused Blades" ChartType="StackedBar" IsXValueIndexed="True" 
                        MarkerSize="1" XValueMember="InstanceName" XValueType="String" 
                        YValueMembers="UnusedBlades" Legend="Legend1" IsValueShownAsLabel="True">
                    </asp:Series>
                    <asp:Series Name="Empty Slots" ChartType="StackedBar" IsXValueIndexed="True" 
                        MarkerSize="1" XValueMember="InstanceName" XValueType="String" 
                        YValueMembers="EmptySlots" Legend="Legend1" IsValueShownAsLabel="True">
                    </asp:Series>
                    <asp:Series Name="Rack Servers" ChartType="StackedBar" IsXValueIndexed="True" 
                        MarkerSize="1" XValueMember="InstanceName" XValueType="String" 
                        YValueMembers="RackUnits" Legend="Legend1" IsValueShownAsLabel="True">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Interval="1">
                        </AxisX>
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1">
                    </asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Name="Blade Counts" Text="Blade Counts">
                    </asp:Title>
                </Titles>
            </asp:Chart>
        </div>
    </div>
</asp:Content>
