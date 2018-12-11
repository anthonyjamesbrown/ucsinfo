<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UCSInstanceDetails.aspx.vb" Inherits="UCS.UCSInstanceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>UCS:</td>
            <td><asp:Label ID="UCS_Label" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        </tr>
        <tr>
            <td>ID:</td>
            <td><asp:Label ID="DataSetID_Label" runat="server" Font-Bold="True"></asp:Label></td>
        </tr>
    </table>
    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
        UseVerticalStripPlacement="True" OnDemand="True" ScrollBars="Auto">
        <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="General">
            <ContentTemplate>
                <h2>General Information</h2>
                <asp:FormView ID="FormView1" runat="server" DataSourceID="DS_SQL_GenInfo" 
                    HorizontalAlign="Left" CssClass="mGrid">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <th><b>Instance Name:</b></th>
                                <td><asp:Label ID="InstanceNameLabel" runat="server" Text='<%# Bind("InstanceName") %>' /></td>
                            </tr>
                            <tr>
                                <th><b>IP Address:</b></th>
                                <td><asp:Label ID="IPAddressLabel" runat="server" Text='<%# Bind("IPAddress") %>' /></td>
                            </tr>
                            <tr>
                                <th><b>Location:</b></th>
                                <td><asp:Label ID="LocationLabel" runat="server" Text='<%# Bind("Location") %>' /></td>                            
                            </tr>
                            <tr>
                                <th><b>RowRack:</b></th>
                                <td><asp:Label ID="RowRackLabel" runat="server" Text='<%# Bind("RowRack") %>' /></td>                            
                            </tr>
                            <tr>
                                <th><b>CoreDmz:</b></th>
                                <td><asp:Label ID="CoreDmzLabel" runat="server" Text='<%# Bind("CoreDmz") %>' /></td>                            
                            </tr>
                            <tr>
                                <th><b>Status:</b></th>
                                <td><asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' /></td>                            
                            </tr>
                            <tr>
                                <th><b>Data Center:</b></th>
                                <td><asp:Label ID="DataCenterLabel" runat="server" Text='<%# Bind("DataCenter") %>' /> </td>                            
                            </tr>                                                                                                                         
                            <tr>
                                <th><b>Version:</b></th>
                                <td><asp:Label ID="VersionLabel" runat="server" Text='<%# Bind("Version") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Call Home:</b></th>
                                <td><asp:Label ID="CallHomeLabel" runat="server" Text='<%# Bind("CallHome") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Chassis Count:</b></th>
                                <td><asp:Label ID="ChassisCountLabel" runat="server" Text='<%# Bind("ChassisCount") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Blade Count:</b></th>
                                <td><asp:Label ID="BladeCountLabel" runat="server" Text='<%# Bind("BladeCount") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Empty Slot Count:</b></th>
                                <td><asp:Label ID="EmptySlotsLabel" runat="server" Text='<%# Bind("EmptySlots") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Primary DNS:</b></th>
                                <td><asp:Label ID="PrimaryDNSLabel" runat="server" Text='<%# Bind("PrimaryDNS") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Primary NTP:</b></th>
                                <td><asp:Label ID="PrimaryNTPLabel" runat="server" Text='<%# Bind("PrimaryNTP") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Admin State:</b></th>
                                <td><asp:Label ID="AdminStateLabel" runat="server" Text='<%# Bind("AdminState") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Community String:</b></th>
                                <td><asp:Label ID="CommunityLabel" runat="server" Text='<%# Bind("Community") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Sys Contact:</b></th>
                                <td><asp:Label ID="SysContactLabel" runat="server" Text='<%# Bind("SysContact") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Sys Location:</b></th>
                                <td><asp:Label ID="SysLocationLabel" runat="server" Text='<%# Bind("SysLocation") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Last Scanned:</b></th>
                                <td><asp:Label ID="LastScannedLabel" runat="server" Text='<%# Bind("LastScanned") %>' /></td>                            
                            </tr>                                                   
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="DS_SQL_GenInfo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT [InstanceName], [IPAddress], [Location], [RowRack], [CoreDmz], [Status], [DataCenter], [Version], [CallHome], [ChassisCount], [BladeCount], [EmptySlots], [PrimaryDNS], [PrimaryNTP], [AdminState], [Community], [SysContact], [SysLocation], [LastScanned] FROM [v_UCS_Geninfo] WHERE ([InstanceName] = @InstanceName)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="APNUCS001" Name="InstanceName" 
                            QueryStringField="UCS" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>            
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel runat="server" HeaderText="Chassis" ID="TabPanel2">
            <ContentTemplate>
                <h2>Chassis Information</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CssClass="mGrid"
                    AllowSorting="True" 
                    DataSourceID="DS_SQL_ActiveChassis">
                    <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="Rn" HeaderText="Rn" SortExpression="Rn" />
                        <asp:BoundField DataField="AdminState" HeaderText="AdminState" SortExpression="AdminState" />
                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                        <asp:BoundField DataField="OperState" HeaderText="OperState" SortExpression="OperState" />
                        <asp:BoundField DataField="LicState" HeaderText="LicState" SortExpression="LicState" />
                        <asp:BoundField DataField="Power" HeaderText="Power" SortExpression="Power" />
                        <asp:BoundField DataField="Thermal" HeaderText="Thermal" SortExpression="Thermal" />
                        <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />
                        <asp:BoundField DataField="ChassisID" HeaderText="ChassisID" SortExpression="ChassisID" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DS_SQL_ActiveChassis" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT [Rn], [AdminState], [Model], [OperState], [LicState], [Power], [Thermal], [Serial], [ChassisID] FROM [v_ActiveChassis] WHERE ([Ucs] = @Ucs) ORDER BY [ChassisID]">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="APNUCS001" Name="Ucs" QueryStringField="UCS" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel runat="server" HeaderText="Blades" ID="TabPanel3" ScrollBars="Auto">
            <ContentTemplate>
                <h2>Blade Information</h2>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="DS_SQL_ActiveBlades"
                    CssClass="mGrid"
                    AllowSorting="True" AllowPaging="True" PageSize="14" >
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="Ucs,DN" 
                            DataNavigateUrlFormatString="UCSBladeDetails.aspx?UCS={0}&DN={1}" 
                            HeaderText="Details" Text="Details">
                        <ControlStyle ForeColor="#323232" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="ChassisId" HeaderText="ChassisId" SortExpression="ChassisId" />
                        <asp:BoundField DataField="SlotId" HeaderText="SlotId" SortExpression="SlotId" />
                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                        <asp:BoundField DataField="AdminState" HeaderText="Admin State" SortExpression="AdminState" />
                        <asp:BoundField DataField="AssignedToDn" HeaderText="AssignedToDn" SortExpression="AssignedToDn" />
                        <asp:BoundField DataField="ManagingInst" HeaderText="Managing Inst" SortExpression="ManagingInst" />
                        <asp:BoundField DataField="MemorySpeed" HeaderText="Memory Speed" SortExpression="MemorySpeed" />
                        <asp:BoundField DataField="TotalMemory" HeaderText="Total Memory" SortExpression="TotalMemory" />
                        <asp:BoundField DataField="NumOfAdaptors" HeaderText="# Adaptors" 
                            SortExpression="NumOfAdaptors" >
                        <ItemStyle CssClass="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NumOfCores" HeaderText="# Cores" 
                            SortExpression="NumOfCores" >
                        <ItemStyle CssClass="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NumOfCoresEnabled" HeaderText="# CoresEnabled" 
                            SortExpression="NumOfCoresEnabled" >
                        <ItemStyle CssClass="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NumOfCpus" HeaderText="# Cpus" 
                            SortExpression="NumOfCpus" >
                        <ItemStyle CssClass="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NumOfEthHostIfs" HeaderText="# EthHostIfs" 
                            SortExpression="NumOfEthHostIfs" >
                        <ItemStyle CssClass="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NumOfFcHostIfs" HeaderText="# FcHostIfs" 
                            SortExpression="NumOfFcHostIfs" >
                        <ItemStyle CssClass="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NumOfThreads" HeaderText="# Threads" 
                            SortExpression="NumOfThreads" >
                        <ItemStyle CssClass="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OperPower" HeaderText="OperPower" SortExpression="OperPower" />
                        <asp:BoundField DataField="OperState" HeaderText="OperState" SortExpression="OperState" />
                        <asp:BoundField DataField="Operability" HeaderText="Operability" SortExpression="Operability" />
                        <asp:BoundField DataField="PartNumber" HeaderText="PartNumber" SortExpression="PartNumber" />
                        <asp:BoundField DataField="Presence" HeaderText="Presence" SortExpression="Presence" />
                        <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />                        
                    </Columns>
                <PagerStyle CssClass="pgr"></PagerStyle>
                </asp:GridView>
                <asp:SqlDataSource ID="DS_SQL_ActiveBlades" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT [DN], [UCS], [ChassisId], [SlotId], [Model], [AdminState], [AssignedToDn], [ManagingInst], [MemorySpeed], [NumOfAdaptors], [NumOfCores], [NumOfCoresEnabled], [NumOfCpus], [NumOfEthHostIfs], [NumOfFcHostIfs], [NumOfThreads], [OperPower], [OperState], [Operability], [PartNumber], [Presence], [Serial], [TotalMemory] FROM [v_ActiveBlades] WHERE ([Ucs] = @Ucs) ORDER BY [ChassisId], [SlotId]">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="APNUCS001" Name="Ucs" 
                            QueryStringField="UCS" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel runat="server" HeaderText="Rack Unit" ID="TabPanel12" ScrollBars="Auto">
            <ContentTemplate>
                <h2>Rack Unit Information</h2>
                <asp:GridView ID="GridView19" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="DS_SQL_ActiveRackUnit"
                    CssClass="mGrid"
                    AllowSorting="True" AllowPaging="True" PageSize="14" >
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                        <asp:BoundField DataField="AdminState" HeaderText="Admin State" SortExpression="AdminState" />
                        <asp:BoundField DataField="AssignedToDn" HeaderText="AssignedToDn" SortExpression="AssignedToDn" />
                        <asp:BoundField DataField="ManagingInst" HeaderText="Managing Inst" SortExpression="ManagingInst" />
                        <asp:BoundField DataField="MemorySpeed" HeaderText="Memory Speed" SortExpression="MemorySpeed" />
                        <asp:BoundField DataField="TotalMemory" HeaderText="Total Memory" SortExpression="TotalMemory" />
                        <asp:BoundField DataField="NumOfAdaptors" HeaderText="# Adaptors" SortExpression="NumOfAdaptors" ItemStyle-CssClass="center" />
                        <asp:BoundField DataField="NumOfCores" HeaderText="# Cores" SortExpression="NumOfCores" ItemStyle-CssClass="center" />
                        <asp:BoundField DataField="NumOfCoresEnabled" HeaderText="# CoresEnabled" SortExpression="NumOfCoresEnabled" ItemStyle-CssClass="center" />
                        <asp:BoundField DataField="NumOfCpus" HeaderText="# Cpus" SortExpression="NumOfCpus" ItemStyle-CssClass="center" />
                        <asp:BoundField DataField="NumOfEthHostIfs" HeaderText="# EthHostIfs" SortExpression="NumOfEthHostIfs" ItemStyle-CssClass="center" />
                        <asp:BoundField DataField="NumOfFcHostIfs" HeaderText="# FcHostIfs" SortExpression="NumOfFcHostIfs" ItemStyle-CssClass="center" />
                        <asp:BoundField DataField="NumOfThreads" HeaderText="# Threads" SortExpression="NumOfThreads" ItemStyle-CssClass="center" />
                        <asp:BoundField DataField="OperPower" HeaderText="OperPower" SortExpression="OperPower" />
                        <asp:BoundField DataField="OperState" HeaderText="OperState" SortExpression="OperState" />
                        <asp:BoundField DataField="Operability" HeaderText="Operability" SortExpression="Operability" />
                        <asp:BoundField DataField="PartNumber" HeaderText="PartNumber" SortExpression="PartNumber" />
                        <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />                        
                    </Columns>
                <PagerStyle CssClass="pgr"></PagerStyle>
                </asp:GridView>
                <asp:SqlDataSource ID="DS_SQL_ActiveRackUnit" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT [Id], [Model], [AdminState], [AssignedToDn], [ManagingInst], [MemorySpeed], [NumOfAdaptors], [NumOfCores], [NumOfCoresEnabled], [NumOfCpus], [NumOfEthHostIfs], [NumOfFcHostIfs], [NumOfThreads], [OperPower], [OperState], [Operability], [PartNumber], [Serial], [TotalMemory] FROM [v_ActiveRackUnits] WHERE ([Ucs] = @Ucs) ORDER BY [Id]">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="APNUCS001" Name="Ucs" 
                            QueryStringField="UCS" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel runat="server" HeaderText="Service Profiles" ID="TabPanel4">
            <ContentTemplate>
                <h2>Service Profiles</h2>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="DS_SQL_ActiveServiceProfiles"
                    CssClass="mGrid"
                    AllowSorting="True" AllowPaging="True" PageSize="14" >
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:HyperLinkField DataNavigateUrlFields="Ucs,PnDn"
                            DataNavigateUrlFormatString="UCSBladeDetails.aspx?UCS={0}&DN={1}"
                            HeaderText="PnDn" DataTextField="PnDn">
                            <ControlStyle ForeColor="#323232" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="BootPolicyName" HeaderText="BootPolicyName" SortExpression="BootPolicyName" />
                        <asp:BoundField DataField="HostFwPolicyName" HeaderText="HostFwPolicyName" SortExpression="HostFwPolicyName" />
                        <asp:BoundField DataField="LocalDiskPolicyName" HeaderText="LocalDiskPolicyName" SortExpression="LocalDiskPolicyName" />
                        <asp:BoundField DataField="MaintPolicyName" HeaderText="MaintPolicyName" SortExpression="MaintPolicyName" />
                        <asp:BoundField DataField="AssocState" HeaderText="AssocState" SortExpression="AssocState" />
                        <asp:BoundField DataField="IdentPoolName" HeaderText="IdentPoolName" SortExpression="IdentPoolName" />
                        <asp:BoundField DataField="OperState" HeaderText="OperState" SortExpression="OperState" />
                    </Columns>
                    <PagerStyle CssClass="pgr"></PagerStyle>
                </asp:GridView>
                <asp:SqlDataSource ID="DS_SQL_ActiveServiceProfiles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT [Ucs], [Type], [Dn], [Name], [PnDn], [BootPolicyName], [HostFwPolicyName], [LocalDiskPolicyName], [MaintPolicyName], [AssocState], [IdentPoolName], [OperState] FROM [v_ActiveServiceProfiles] WHERE ([Ucs] = @Ucs) AND ([TYPE] <> 'initial-template') ORDER BY [PnDn]">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="APNUCS001" Name="Ucs" 
                            QueryStringField="UCS" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="FI\IO">
            <ContentTemplate>
                <h2>FI\IO</h2>
                <ajaxToolkit:TabContainer ID="TabContainer5" runat="server" OnDemand="true">
                    <ajaxToolkit:TabPanel ID="TabPanel501" runat="server" HeaderText="Fabric Interconnects">
                        <ContentTemplate>
                            <h3>Fabric Interconnects</h3>
                            <asp:GridView ID="GridView4" runat="server" 
                                DataSourceID="DS_SQL_FI_NETWORK_ELEMENTS" AutoGenerateColumns="False"
                                CssClass="mGrid"
                                AllowSorting="True" AllowPaging="True" PageSize="25" >
                                <AlternatingRowStyle CssClass="alt" />
                                <PagerStyle CssClass="pgr"></PagerStyle>
                                    <Columns>
                                        <asp:BoundField DataField="Rn" HeaderText="Rn" SortExpression="Rn" />
                                        <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                        <asp:BoundField DataField="OobIfIP" HeaderText="OobIfIP" SortExpression="OobIfIP" />
                                        <asp:BoundField DataField="OobIfMask" HeaderText="OobIfMask" SortExpression="OobIfMask" />
                                        <asp:BoundField DataField="OobIfGw" HeaderText="OobIfGw" SortExpression="OobIfGw" />
                                        <asp:BoundField DataField="Operability" HeaderText="Operability" SortExpression="Operability" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                        <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />
                                    </Columns>
                                </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_FI_NETWORK_ELEMENTS" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Rn], [Dn], [OobIfIP], [OobIfMask], [OobIfGw], [Operability], [Model], [Serial] FROM [NetworkElements] WHERE ([DataSetID] = @DataSetID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                        
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel502" runat="server" HeaderText="Fabric Interconnect Inventory">
                        <ContentTemplate>
                            <h3>Fabric Interconnect Inventory</h3>
                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_FiModules"
                                CssClass="mGrid"
                                AllowSorting="True" AllowPaging="True" PageSize="25" >
                                <AlternatingRowStyle CssClass="alt" />
                                <PagerStyle CssClass="pgr"></PagerStyle>
                                    <Columns>
                                        <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                        <asp:BoundField DataField="Rn" HeaderText="Rn" SortExpression="Rn" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                        <asp:BoundField DataField="Descr" HeaderText="Descr" SortExpression="Descr" />
                                        <asp:BoundField DataField="OperState" HeaderText="OperState" SortExpression="OperState" />
                                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                        <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />
                                    </Columns>
                                </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_FiModules" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Dn], [Rn], [Model], [Descr], [OperState], [State], [Serial] FROM [FiModules] WHERE ([DataSetID] = @DataSetID) ORDER BY [Dn]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                        
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel503" runat="server" HeaderText="Fabric Interconnect License Usage">
                        <ContentTemplate>
                            <h3>Fabric Interconnect License Usage</h3>
                                <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_Licenses"
                                CssClass="mGrid"
                                AllowSorting="True" AllowPaging="True" PageSize="25" >
                                <AlternatingRowStyle CssClass="alt" />
                                <PagerStyle CssClass="pgr"></PagerStyle>
                                    <Columns>
                                        <asp:BoundField DataField="Sku" HeaderText="Sku" SortExpression="Sku" />
                                        <asp:BoundField DataField="Scope" HeaderText="Scope" SortExpression="Scope" />
                                        <asp:BoundField DataField="AbsQuant" HeaderText="AbsQuant" SortExpression="AbsQuant" />
                                        <asp:BoundField DataField="UsedQuant" HeaderText="UsedQuant" SortExpression="UsedQuant" />
                                        <asp:BoundField DataField="PeerStatus" HeaderText="PeerStatus" SortExpression="PeerStatus" />
                                        <asp:BoundField DataField="OperState" HeaderText="OperState" SortExpression="OperState" />
                                    </Columns>
                                </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_Licenses" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Sku], [Scope], [AbsQuant], [UsedQuant], [PeerStatus], [OperState] FROM [Licenses] WHERE ([DataSetID] = @DataSetID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                        
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel504" runat="server" HeaderText="IO Module (FEX) Inventory">
                        <ContentTemplate>
                            <h3>IO Module (FEX) Inventory</h3>
                                <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_IOM"
                                CssClass="mGrid"
                                AllowSorting="True" >
                                <AlternatingRowStyle CssClass="alt" />
                                <PagerStyle CssClass="pgr"></PagerStyle>
                                    <Columns>
                                        <asp:BoundField DataField="ChassisId" HeaderText="ChassisId" SortExpression="ChassisId" />
                                        <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                        <asp:BoundField DataField="Rn" HeaderText="Rn" SortExpression="Rn" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                        <asp:BoundField DataField="Discovery" HeaderText="Discovery" SortExpression="Discovery" />
                                        <asp:BoundField DataField="ConfigState" HeaderText="ConfigState" SortExpression="ConfigState" />
                                        <asp:BoundField DataField="OperState" HeaderText="OperState" SortExpression="OperState" />
                                        <asp:BoundField DataField="Side" HeaderText="Side" SortExpression="Side" />
                                        <asp:BoundField DataField="Thermal" HeaderText="Thermal" SortExpression="Thermal" />
                                        <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />
                                        <asp:BoundField DataField="SwitchId" HeaderText="SwitchId" SortExpression="SwitchId" />
                                    </Columns>
                                </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_IOM" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [ChassisId], [Dn], [Rn], [Model], [Discovery], [ConfigState], [OperState], [Side], [Thermal], [Serial], [SwitchId] FROM [IOM] WHERE ([DataSetID] = @DataSetID) ORDER BY [ChassisId]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                        
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel505" runat="server" HeaderText="Fabric Interconnect Chassis IOM Mappings">
                        <ContentTemplate>
                            <h3>Fabric Interconnect Chassis IOM Mappings</h3>
                                <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_EtherSwitchFlo"
                                CssClass="mGrid"
                                AllowSorting="True" AllowPaging="True" PageSize="15" >
                                <AlternatingRowStyle CssClass="alt" />
                                <PagerStyle CssClass="pgr"></PagerStyle>
                                    <Columns>
                                        <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                        <asp:BoundField DataField="Rn" HeaderText="Rn" SortExpression="Rn" />
                                        <asp:BoundField DataField="ChassisId" HeaderText="ChassisId" SortExpression="ChassisId" />
                                        <asp:BoundField DataField="SlotId" HeaderText="SlotId" SortExpression="SlotId" />
                                        <asp:BoundField DataField="PeerDn" HeaderText="PeerDn" SortExpression="PeerDn" />
                                        <asp:BoundField DataField="Discovery" HeaderText="Discovery" SortExpression="Discovery" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                        <asp:BoundField DataField="OperState" HeaderText="OperState" SortExpression="OperState" />
                                        <asp:BoundField DataField="SwitchId" HeaderText="SwitchId" SortExpression="SwitchId" />
                                        <asp:BoundField DataField="PeerSlotId" HeaderText="PeerSlotId" SortExpression="PeerSlotId" />
                                        <asp:BoundField DataField="PeerPortId" HeaderText="PeerPortId" SortExpression="PeerPortId" />
                                        <asp:BoundField DataField="PortId" HeaderText="PortId" SortExpression="PortId" />
                                        <asp:BoundField DataField="XcvrType" HeaderText="XcvrType" SortExpression="XcvrType" />
                                    </Columns>
                                </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_EtherSwitchFlo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Dn], [Rn], [ChassisId], [SlotId], [PeerDn], [Discovery], [Model], [OperState], [SwitchId], [PeerSlotId], [PeerPortId], [PortId], [XcvrType] FROM [EtherSwitchIntFIos] WHERE ([DataSetID] = @DataSetID) ORDER BY [ChassisId], [SlotId]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                        
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel6" runat="server" HeaderText="Misc Inventory">
            <ContentTemplate>
                <h2>Misc Inventory</h2>
                <ajaxToolkit:TabContainer ID="TabContainer6" runat="server" OnDemand="true">
                    <ajaxToolkit:TabPanel ID="TabPanel601" runat="server" HeaderText="Server Adaptor Inventory">
                        <ContentTemplate>
                            <h3>Server Adaptor Inventory</h3>
                            <asp:GridView ID="GridView15" runat="server" 
                                AutoGenerateColumns="False"
                                DataSourceID="DS_SQL_AdaptorUnit"
                                CssClass="mGrid"
                                AllowSorting="True" AllowPaging="True" PageSize="25" >
                                <AlternatingRowStyle CssClass="alt" />
                                <PagerStyle CssClass="pgr"></PagerStyle>
                                    <Columns>
                                        <asp:BoundField DataField="ChassisId" HeaderText="ChassisId" SortExpression="ChassisId" />
                                        <asp:BoundField DataField="BladeId" HeaderText="BladeId" SortExpression="BladeId" />
                                        <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                        <asp:BoundField DataField="Rn" HeaderText="Rn" SortExpression="Rn" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                        <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />
                                    </Columns>                
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_AdaptorUnit" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT ChassisID, BladeID, DN, RN, Model, Serial FROM [AdaptorUnits] WHERE ([DataSetID] = @DataSetID) ORDER BY [ChassisId], [BladeId]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                        
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel602" runat="server" HeaderText="Server CPU Inventory">
                        <ContentTemplate>
                            <h3>Server CPU Inventory</h3>
                            <asp:GridView ID="GridView16" runat="server"
                                AutoGenerateColumns="False"
                                DataSourceID="DS_SQL_ProcessorUnit"
                                CssClass="mGrid"
                                AllowSorting="True" AllowPaging="True" PageSize="25" >
                                <AlternatingRowStyle CssClass="alt" />
                                <PagerStyle CssClass="pgr"></PagerStyle>
                                    <Columns>
                                        <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                        <asp:BoundField DataField="Rn" HeaderText="Rn" SortExpression="Rn" />
                                        <asp:BoundField DataField="SocketDesignation" HeaderText="SocketDesignation" SortExpression="SocketDesignation" />
                                        <asp:BoundField DataField="Cores" HeaderText="Cores" SortExpression="Cores" />
                                        <asp:BoundField DataField="CoresEnabled" HeaderText="CoresEnabled" SortExpression="CoresEnabled" />
                                        <asp:BoundField DataField="Threads" HeaderText="Threads" SortExpression="Threads" />
                                        <asp:BoundField DataField="Speed" HeaderText="Speed" SortExpression="Speed" />
                                        <asp:BoundField DataField="OperState" HeaderText="OperState" SortExpression="OperState" />
                                        <asp:BoundField DataField="Thermal" HeaderText="Thermal" SortExpression="Thermal" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                    </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_ProcessorUnit" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT Dn, Rn, SocketDesignation, Cores, CoresEnabled, Threads, Speed, OperState, Thermal, Model FROM ProcessorUnit WHERE ([DataSetID] = @DataSetID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                        
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel603" runat="server" HeaderText="Server Local Disk Inventory">
                        <ContentTemplate>
                            <h3>Server Local Disk Inventory</h3>
                            <asp:GridView ID="GridView18" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_LocalStorageDisk"
                                CssClass="mGrid"
                                AllowSorting="True" AllowPaging="True" PageSize="25" >
                                <AlternatingRowStyle CssClass="alt" />
                                <PagerStyle CssClass="pgr"></PagerStyle>
                                <Columns>
                                    <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                    <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                                    <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_LocalStorageDisk" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Dn], [Model], [Size], [Serial] FROM [StorageLocalDisk] WHERE ([DataSetID] = @DataSetID) ORDER BY [Dn]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                        
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel7" runat="server" HeaderText="Firmware">
            <ContentTemplate>
            <h2>Firmware</h2>
                <ajaxToolkit:TabContainer ID="TabContainer7" runat="server" ActiveTabIndex="0" OnDemand="true">
                    <ajaxToolkit:TabPanel ID="TabPanel701" runat="server" HeaderText="UCS Manager Firmware Version">
                        <ContentTemplate>
                            <h3>UCS Manager Firmware Version</h3>
                            <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_FirmwareRunning"
                                CssClass="mGrid">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Deployment" HeaderText="Deployment" SortExpression="Deployment" />
                                    <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                    <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                                    <asp:BoundField DataField="PackageVersion" HeaderText="PackageVersion" SortExpression="PackageVersion" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_FirmwareRunning" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Type], [Deployment], [Dn], [Version], [PackageVersion] FROM [Firmware] WHERE (([DataSetID] = @DataSetID) AND ([Type] = @Type))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" PropertyName="Text" Type="Int32" />
                                    <asp:Parameter DefaultValue="mgmt-ext" Name="Type" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel702" runat="server" HeaderText="Fabric Interconnect Firmware Versions">
                        <ContentTemplate>
                            <h3>Fabric Interconnect Firmware Versions</h3>
                            <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_FirmwareRunning2"
                                CssClass="mGrid">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Deployment" HeaderText="Deployment" SortExpression="Deployment" />
                                    <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                    <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                                    <asp:BoundField DataField="PackageVersion" HeaderText="PackageVersion" SortExpression="PackageVersion" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_FirmwareRunning2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Type], [Deployment], [Dn], [Version], [PackageVersion] FROM [Firmware] WHERE (([DataSetID] = @DataSetID) AND ([Type] like 'switch%'))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                        
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel703" runat="server" HeaderText="IO Module (FEX) Firmware Versions">
                        <ContentTemplate>
                            <h3>IO Module (FEX) Firmware Versions</h3>
                            <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_FirmwareRunning3"
                                CssClass="mGrid">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Deployment" HeaderText="Deployment" SortExpression="Deployment" />
                                    <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                    <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                                    <asp:BoundField DataField="PackageVersion" HeaderText="PackageVersion" SortExpression="PackageVersion" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_FirmwareRunning3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Type], [Deployment], [Dn], [Version], [PackageVersion] FROM [Firmware] WHERE (([DataSetID] = @DataSetID) AND ([Type] = 'iocard') AND [Deployment] <> 'boot-loader')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                         
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel704" runat="server" HeaderText="Server CIMC Firmware Versions">
                        <ContentTemplate>
                            <h3>Server CIMC Firmware Versions</h3>
                            <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_FirmwareRunning4"
                                CssClass="mGrid">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Deployment" HeaderText="Deployment" SortExpression="Deployment" />
                                    <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                    <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                                    <asp:BoundField DataField="PackageVersion" HeaderText="PackageVersion" SortExpression="PackageVersion" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_FirmwareRunning4" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Type], [Deployment], [Dn], [Version], [PackageVersion] FROM [Firmware] WHERE (([DataSetID] = @DataSetID) AND ([Type] = 'blade-controller') AND [Deployment] <> 'boot-loader')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                         
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel705" runat="server" HeaderText="Server Adaptor Firmware Versions">
                        <ContentTemplate>
                            <h3>Server Adaptor Firmware Versions</h3>
                            <asp:GridView ID="GridView13" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_FirmwareRunning5"
                                CssClass="mGrid">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Deployment" HeaderText="Deployment" SortExpression="Deployment" />
                                    <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                    <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                                    <asp:BoundField DataField="PackageVersion" HeaderText="PackageVersion" SortExpression="PackageVersion" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_FirmwareRunning5" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Type], [Deployment], [Dn], [Version], [PackageVersion] FROM [Firmware] WHERE (([DataSetID] = @DataSetID) AND ([Type] = 'adaptor') AND [Deployment] <> 'boot-loader')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                         
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel706" runat="server" HeaderText="Server BIOS Versions">
                        <ContentTemplate>
                            <h3>Server BIOS Versions</h3>
                            <asp:GridView ID="GridView14" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="DS_SQL_FirmwareRunning6"
                                CssClass="mGrid">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Deployment" HeaderText="Deployment" SortExpression="Deployment" />
                                    <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                                    <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                                    <asp:BoundField DataField="PackageVersion" HeaderText="PackageVersion" SortExpression="PackageVersion" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_SQL_FirmwareRunning6" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                                SelectCommand="SELECT [Type], [Deployment], [Dn], [Version], [PackageVersion] FROM [Firmware] WHERE (([DataSetID] = @DataSetID) AND ([Type] = 'blade-bios'))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>                         
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel8" runat="server" HeaderText="Pools">
            <ContentTemplate>
                <h2>Pools</h2>
                <ajaxToolkit:TabContainer ID="TabContainer8" runat="server"  OnDemand="true">
                    <ajaxToolkit:TabPanel ID="TabPanel801" runat="server" HeaderText="IP Pools">
                        <ContentTemplate>
                            <h3>IP Pools</h3>

                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel802" runat="server" HeaderText="IP Pool Blocks">
                        <ContentTemplate>
                            <h3>IP Pool Blocks</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel803" runat="server" HeaderText="CIMC IP Pool Assignemnts">
                        <ContentTemplate>
                            <h3>CIMC IP Pool Assignemnts</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel804" runat="server" HeaderText="UUID Pools">
                        <ContentTemplate>
                            <h3>UUID Pools</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel805" runat="server" HeaderText="UUID Pool Assignments">
                        <ContentTemplate>
                            <h3>UUID Pool Assignments</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel806" runat="server" HeaderText="MAC Address Pools">
                        <ContentTemplate>
                            <h3>MAC Address Pools</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel807" runat="server" HeaderText="MAC Address Pool Blocks">
                        <ContentTemplate>
                            <h3>MAC Address Pool Blocks</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel808" runat="server" HeaderText="MAC Address Pool Assignments">
                        <ContentTemplate>
                            <h3>MAC Address Pool Assignments</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel809" runat="server" HeaderText="WWN Pools">
                        <ContentTemplate>
                            <h3>WWN Pools</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel810" runat="server" HeaderText="WWN Pool Assignments">
                        <ContentTemplate>
                            <h3>WWN Pool Assignments</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel811" runat="server" HeaderText="Server Pools">
                        <ContentTemplate>
                            <h3>Server Pools</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel812" runat="server" HeaderText="Server Pool Assignments">
                        <ContentTemplate>
                            <h3>Server Pool Assignments</h3>
                        </ContentTemplate>                    
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>  
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel9" runat="server" HeaderText="LAN Config">
            <ContentTemplate>
                <h2>LAN Configuration</h2>
                <ajaxToolkit:TabContainer ID="TabContainer9" runat="server" OnDemand="true">
                    <ajaxToolkit:TabPanel ID="TabPanel901" runat="server" HeaderText="FI Ethernet Switching Mode">
                        <ContentTemplate>
                            <h3>Fabric Interconnect Ethernet Switching Mode</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel902" runat="server" HeaderText="FI Ethernet Port Configuration">
                        <ContentTemplate>
                            <h3>Fabric Interconnect Ethernet Port Configuration</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel903" runat="server" HeaderText="FI Ethernet Uplink Port Channels">
                        <ContentTemplate>
                            <h3>Fabric Interconnect Ethernet Uplink Port Channels</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel904" runat="server" HeaderText="FI Ethernet Uplink Port Channel Members">
                        <ContentTemplate>
                            <h3>Fabric Interconnect Ethernet Uplink Port Channel Members</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel905" runat="server" HeaderText="QoS System Class Configuration">
                        <ContentTemplate>
                            <h3>QoS System Class Configuration</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel906" runat="server" HeaderText="QoS Policies">
                        <ContentTemplate>
                            <h3>QoS Policies</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel907" runat="server" HeaderText="QoS vNIC Policy Map">
                        <ContentTemplate>
                            <h3>QoS vNIC Policy Map</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel908" runat="server" HeaderText="Network Control Policies">
                        <ContentTemplate>
                            <h3>Network Control Policies</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel909" runat="server" HeaderText="vNIC Templates">
                        <ContentTemplate>
                            <h3>vNIC Templates</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel910" runat="server" HeaderText="Ethernet VLANs">
                        <ContentTemplate>
                            <h3>Ethernet VLANs</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel911" runat="server" HeaderText="Ethernet VLAN to vNIC Mappings">
                        <ContentTemplate>
                            <h3>Ethernet VLAN to vNIC Mappings</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer> 
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel10" runat="server" HeaderText="SAN Config">
            <ContentTemplate>
                <h2>SAN Configuration</h2>
                <ajaxToolkit:TabContainer ID="TabContainer10" runat="server" OnDemand="true">
                    <ajaxToolkit:TabPanel ID="TabPanel1001" runat="server" HeaderText="FI Fibre Channel Switching Mode">
                        <ContentTemplate>
                            <h3>Fabric Interconnect Fibre Channel Switching Mode</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1002" runat="server" HeaderText="FI FC Uplink Ports">
                        <ContentTemplate>
                            <h3>Fabric Interconnect FC Uplink Ports</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1003" runat="server" HeaderText="FI FC Uplink Port Channels">
                        <ContentTemplate>
                            <h3>Fabric Interconnect FC Uplink Port Channels</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1004" runat="server" HeaderText="FI FCoE Uplink Ports">
                        <ContentTemplate>
                            <h3>Fabric Interconnect FCoE Uplink Ports</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1005" runat="server" HeaderText="FI FCoE Uplink Port Channels">
                        <ContentTemplate>
                            <h3>Fabric Interconnect FCoE Uplink Port Channels</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1006" runat="server" HeaderText="FI FCoE Uplink Port Channel Members">
                        <ContentTemplate>
                            <h3>Fabric Interconnect FCoE Uplink Port Channel Members</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1007" runat="server" HeaderText="FC VSANs">
                        <ContentTemplate>
                            <h3>FC VSANs</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1008" runat="server" HeaderText="FC VSAN to FC Port Mappings">
                        <ContentTemplate>
                            <h3>FC VSAN to FC Port Mappings</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1009" runat="server" HeaderText="vHBA Templates">
                        <ContentTemplate>
                            <h3>vHBA Templates</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1010" runat="server" HeaderText="vHBA Details">
                        <ContentTemplate>
                            <h3>vHBA Details</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="TabPanel1011" runat="server" HeaderText="vHBA to VSAN Mappings">
                        <ContentTemplate>
                            <h3>vHBA to VSAN Mappings</h3>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>                
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel11" runat="server" HeaderText="Faults">
            <ContentTemplate>
                <h2>Faults</h2>
                <table>
                    <tr>
                        <td>
                            Filter by Severity : 
                            <asp:DropDownList ID="Severity_DropDown" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="%">All</asp:ListItem>
                                <asp:ListItem>cleared</asp:ListItem>
                                <asp:ListItem>condition</asp:ListItem>
                                <asp:ListItem>critical</asp:ListItem>
                                <asp:ListItem>info</asp:ListItem>
                                <asp:ListItem>major</asp:ListItem>
                                <asp:ListItem>minor</asp:ListItem>
                                <asp:ListItem>warning</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="GridView17" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="DS_SQL_Faults"
                    CssClass="mGrid">
                    <Columns>
                        <asp:BoundField DataField="Severity" HeaderText="Severity" SortExpression="Severity" />                        
                        <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                        <asp:BoundField DataField="Descr" HeaderText="Description" SortExpression="Descr" />
                        <asp:BoundField DataField="dn" HeaderText="DN" SortExpression="dn" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DS_SQL_Faults" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    
                    SelectCommand="SELECT [Severity], [Created], [Descr], [dn] FROM [Fault] WHERE (([DataSetID] = @DataSetID) AND ([Severity] LIKE '%' + @Severity + '%')) ORDER BY [Created]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="Severity_DropDown" DefaultValue="%" 
                            Name="Severity" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
</asp:Content>
