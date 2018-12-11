<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="BladeInventory.aspx.vb" Inherits="UCS.BladeInventory" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style7
        {
            table-layout: fixed;
            width: 734px;
        }
        .style8
        {
            width: 148px;
        }
        .style9
        {
            width: 355px;
        }
        .style10
        {
            width: 254px;
        }
        .style11
        {
            width: 337px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        UCS Blade Inventory</h2>
    <table>
        <tr>
            <td class="style8">
                Data Center:</td>
            <td class="style8">
                <asp:DropDownList ID="DC_DropDownList" runat="server" 
                    DataSourceID="SqlDataSource_DC" DataTextField="DataCenter" 
                    DataValueField="DataCenter" AppendDataBoundItems="True" 
                    AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="%">All</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_DC" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [DataCenter] FROM [UCSInstances] ORDER BY [DataCenter]">
                </asp:SqlDataSource>
            </td>
            <td class="style8">
                UCS:</td>
            <td class="style11">
                <asp:DropDownList ID="UCS_DropDownList" runat="server" 
                    DataSourceID="SqlDataSource_UCSNames" DataTextField="InstanceName" 
                    DataValueField="InstanceName" AppendDataBoundItems="True" 
                    AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="%">All</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_UCSNames" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT [InstanceName] FROM [UCSInstances] WHERE ([DataCenter] = @DataCenter) ORDER BY [InstanceName]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DC_DropDownList" DefaultValue="%" 
                            Name="DataCenter" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="right" class="style9">
                Filter:</td>
            <td class="style10">
                <asp:TextBox ID="Filter_TextBox" runat="server" Width="287px"></asp:TextBox>
            </td>
            <td align="left" class="style7">
                <asp:Button ID="Button1" runat="server" style="margin-left: 0px" 
                    Text="Submit" />
            </td>
            <td align="right">
                <asp:Button ID="Export_Button" runat="server" Text="XL" BackColor="#009900" 
                    Font-Bold="True" ForeColor="White" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" 
        CssClass="mGrid"
        PagerStyle-CssClass="pgr"
        AlternatingRowStyle-CssClass="alt"
        AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        AllowPaging="True" PageSize="30">
        <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Ucs" HeaderText="Ucs" 
                SortExpression="Ucs" />
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="ChassisId" HeaderText="ChassisId" 
                SortExpression="ChassisId" />
            <asp:BoundField DataField="SlotId" HeaderText="SlotId" 
                SortExpression="SlotId" />
            <asp:BoundField DataField="Serial" HeaderText="Serial" 
                SortExpression="Serial" />
            <asp:BoundField DataField="OperState" HeaderText="OperState" 
                SortExpression="OperState" />
            <asp:BoundField DataField="WWNs" HeaderText="WWPNs" 
                SortExpression="WWNs" ReadOnly="True" />
            <asp:BoundField DataField="Memory" HeaderText="Total Memory"
                SortExpression="Memory" />
            <asp:BoundField DataField="Cores" HeaderText="Cores"
                SortExpression="Cores" />
            <asp:BoundField DataField="FaultCount" HeaderText="Faults"
                SortExpression="FaultCount" />
            <asp:BoundField DataField="BootPolicyName" HeaderText="BootPolicyName" 
                SortExpression="BootPolicyName" />
            <asp:BoundField DataField="HostFwPolicyName" HeaderText="HostFwPolicyName" 
                SortExpression="HostFwPolicyName" />
            <asp:BoundField DataField="SPDN" HeaderText="ORG" 
                SortExpression="SPDN" />
        </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>"    
        SelectCommand="SELECT [Ucs], [Name], [Model], [ChassisId], [SlotId], [Serial], [OperState], [WWNs], ([TotalMemory]/1024) As Memory, [NumOfCores] As Cores, [FaultCount], [BootPolicyName], [HostFwPolicyName], Substring(Replace([SPDN], 'org-root/org-', ''),1, 3) As SPDN FROM [v_Blades_ServiceProfile_General] WHERE ((([Ucs] LIKE '%' + @Ucs + '%') AND ([Ucs] Like @Ucs2)) AND (([Name] LIKE '%' + @Name + '%') OR ([WWNs] LIKE '%' + @WWNs + '%') OR ([Serial] LIKE '%' + @Serial + '%') OR ([Model] LIKE '%' + @Model + '%') OR ([BootPolicyName] LIKE '%' + @BootPolicyName + '%') OR ([HostFwPolicyName] LIKE '%' + @HostFwPolicyName + '%')))  ORDER BY [Ucs], [ChassisId], [SlotId]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DC_DropDownList" DefaultValue="%" Name="Ucs" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="UCS_DropDownList" PropertyName="SelectedValue" 
                DefaultValue="%" Name="Ucs2" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="Filter_TextBox" DefaultValue="%" Name="Name" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Filter_TextBox" DefaultValue="%" Name="WWNs" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Filter_TextBox" DefaultValue="%" Name="Serial" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Filter_TextBox" DefaultValue="%" Name="Model" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Filter_TextBox" DefaultValue="%" Name="BootPolicyName" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Filter_TextBox" DefaultValue="%" Name="HostFwPolicyName" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Records_Label" runat="server" Text="Records Returned"></asp:Label>
</asp:Content>
