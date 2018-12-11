<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UCSBladeDetails.aspx.vb" Inherits="UCS.UCSBladeDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 227px;
        }
        .style5
        {
            width: 882px;
        }
        .style6
        {
            width: 514px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <tr>
            <td>UCS:</td>
            <td class="style4"><asp:Label ID="UCS_Label" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
            <td class="style5" colspan="2">&nbsp;</td>
            <td class="style6" rowspan="3">
                <asp:Image ID="Image2" runat="server" ImageAlign="Right" />
            </td>
        </tr>
        <tr>
            <td>ID:</td>
            <td class="style4"><asp:Label ID="DataSetID_Label" runat="server" Font-Bold="True"></asp:Label></td>
            <td class="style5" colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td>DN:</td>
            <td class="style4"><asp:Label ID="DN_Label" runat="server" Font-Bold="True"></asp:Label></td>
            <td>Server:</td>
            <td class="style5"><asp:Label ID="Server_Label" runat="server" Font-Bold="True"></asp:Label></td>
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
                                <th><b>Data Center:</b></th>
                                <td><asp:Label ID="DataCenterLabel" runat="server" Text='<%# Bind("DataCenter") %>' /></td>
                            </tr>
                            <tr>
                                <th><b>Chassis ID:</b></th>
                                <td><asp:Label ID="ChassisIdLabel" runat="server" Text='<%# Bind("ChassisId") %>' /></td>
                            </tr>
                            <tr>
                                <th><b>Slot ID:</b></th>
                                <td><asp:Label ID="SlotIdLabel" runat="server" Text='<%# Bind("SlotId") %>' /></td>                            
                            </tr>
                            <tr>
                                <th><b>Model:</b></th>
                                <td><asp:Label ID="ModelLabel" runat="server" Text='<%# Bind("Model") %>' /></td>                            
                            </tr>
                            <tr>
                                <th><b>Dn:</b></th>
                                <td><asp:Label ID="DnLabel" runat="server" Text='<%# Bind("Dn") %>' /></td>                            
                            </tr>
                            <tr>
                                <th><b>Rn:</b></th>
                                <td><asp:Label ID="RnLabel" runat="server" Text='<%# Bind("Rn") %>' /></td>                            
                            </tr>
                            <tr>
                                <th><b>Admin State:</b></th>
                                <td><asp:Label ID="AdminStateLabel" runat="server" Text='<%# Bind("AdminState") %>' /> </td>                            
                            </tr>                                                                                                                         
                            <tr>
                                <th><b>Linked To:</b></th>
                                <td><asp:Label ID="AssignedToDnLabel" runat="server" Text='<%# Bind("AssignedToDn") %>' /></td>                            
                            </tr>                                                   
                            <tr>
                                <th><b>Available Memory:</b></th>
                                <td><asp:Label ID="AvailableMemoryLabel" runat="server" Text='<%# Bind("AvailableMemory") %>' /></td>                            
                            </tr>   
                            <tr>
                                <th><b>Total Memory:</b></th>
                                <td><asp:Label ID="TotalMemoryLabel" runat="server" Text='<%# Bind("TotalMemory") %>' /></td>                            
                            </tr> 
                            <tr>
                                <th><b>Low Voltage Memory:</b></th>
                                <td><asp:Label ID="LowVoltageMemoryLabel" runat="server" Text='<%# Bind("LowVoltageMemory") %>' /></td>                            
                            </tr> 
                            <tr>
                                <th><b>Memory Speed:</b></th>
                                <td><asp:Label ID="MemorySpeedLabel" runat="server" Text='<%# Bind("MemorySpeed") %>' /></td>                            
                            </tr>                                                                                                                                      
                            <tr>
                                <th><b>Description:</b></th>
                                <td><asp:Label ID="DescrLabel" runat="server" Text='<%# Bind("Descr") %>' /></td>                            
                            </tr>                                                                                                     
                            <tr>
                                <th><b>Managing Inst:</b></th>
                                <td><asp:Label ID="ManagingInstLabel" runat="server" Text='<%# Bind("ManagingInst") %>' /></td>                            
                            </tr>                                                                                                                                                                                                                                                                          
                            <tr>
                                <th><b>Name:</b></th>
                                <td><asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Num Of Adaptors:</b></th>
                                <td><asp:Label ID="NumOfAdaptorsLabel" runat="server" Text='<%# Bind("NumOfAdaptors") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Num Of Cores:</b></th>
                                <td><asp:Label ID="NumOfCoresLabel" runat="server" Text='<%# Bind("NumOfCores") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Num Of CPUs:</b></th>
                                <td><asp:Label ID="NumOfCpusLabel" runat="server" Text='<%# Bind("NumOfCpus") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Num Of Cores Enabled:</b></th>
                                <td><asp:Label ID="NumOfCoresEnabledLabel" runat="server" Text='<%# Bind("NumOfCoresEnabled") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Num Of Eth Host Ifs:</b></th>
                                <td><asp:Label ID="NumOfEthHostIfsLabel" runat="server" Text='<%# Bind("NumOfEthHostIfs") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Num Of Fc Host Ifs:</b></th>
                                <td><asp:Label ID="NumOfFcHostIfsLabel" runat="server" Text='<%# Bind("NumOfFcHostIfs") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Num Of Threads:</b></th>
                                <td><asp:Label ID="NumOfThreadsLabel" runat="server" Text='<%# Bind("NumOfThreads") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Oper Power:</b></th>
                                <td><asp:Label ID="OperPowerLabel" runat="server" Text='<%# Bind("OperPower") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Oper State:</b></th>
                                <td><asp:Label ID="OperStateLabel" runat="server" Text='<%# Bind("OperState") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Operability:</b></th>
                                <td><asp:Label ID="OperabilityLabel" runat="server" Text='<%# Bind("Operability") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Part Number:</b></th>
                                <td><asp:Label ID="PartNumberLabel" runat="server" Text='<%# Bind("PartNumber") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Presence:</b></th>
                                <td><asp:Label ID="PresenceLabel" runat="server" Text='<%# Bind("Presence") %>' /></td>                            
                            </tr>                             
                            <tr>
                                <th><b>Serial:</b></th>
                                <td><asp:Label ID="SerialLabel" runat="server" Text='<%# Bind("Serial") %>' /></td>                            
                            </tr>                                                         
                            <tr>
                                <th><b>UsrLbl:</b></th>
                                <td><asp:Label ID="UsrLblLabel" runat="server" Text='<%# Bind("UsrLbl") %>' /></td>                            
                            </tr>                                
                            <tr>
                                <th><b>Vendor:</b></th>
                                <td><asp:Label ID="VendorLabel" runat="server" Text='<%# Bind("Vendor") %>' /></td>                            
                            </tr>                                                                             
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="DS_SQL_GenInfo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>"                     
                    SelectCommand="SELECT [DataCenter], [ChassisId], [SlotId], [Model], [Dn], [Rn], [AdminState], [AssignedToDn], [AvailableMemory], [Descr], [LowVoltageMemory], [ManagingInst], [MemorySpeed], [Name], [NumOfAdaptors], [NumOfCores], [NumOfCpus], [NumOfCoresEnabled], [NumOfEthHostIfs], [NumOfFcHostIfs], [NumOfThreads], [OperPower], [OperState], [Operability], [PartNumber], [Presence], [Serial], [TotalMemory], [UsrLbl], [Vendor] FROM [v_ActiveBlades] WHERE (([Ucs] = @Ucs) AND ([Dn] = @Dn))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="UCS_Label" DefaultValue="APNUCS001" Name="Ucs" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="DN_Label" DefaultValue="sys/chassis-5/blade-1" Name="Dn" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>            
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel runat="server" HeaderText="Adaptors" ID="TabPanel2">
            <ContentTemplate>
                <h2>Adaptors</h2>
                <asp:GridView ID="GridView2" runat="server"
                    CssClass="mGrid"
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="DS_SQL_Adaptors" >
                    <Columns>
                        <asp:BoundField DataField="ChassisId" HeaderText="ChassisId" 
                            SortExpression="ChassisId" />
                        <asp:BoundField DataField="BladeId" HeaderText="BladeId" 
                            SortExpression="BladeId" />
                        <asp:BoundField DataField="Dn" HeaderText="Dn" SortExpression="Dn" />
                        <asp:BoundField DataField="Rn" HeaderText="Rn" SortExpression="Rn" />
                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                        <asp:BoundField DataField="Serial" HeaderText="Serial" 
                            SortExpression="Serial" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DS_SQL_Adaptors" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="SELECT [ChassisId], [BladeId], [Dn], [Rn], [Model], [Serial] FROM [AdaptorUnits] WHERE (([DataSetID] = @DataSetID) AND ([Dn] LIKE '%' + @Dn + '%')) ORDER BY [Dn]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="DN_Label" Name="Dn" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel runat="server" HeaderText="VLANS" ID="TabPanel3">
            <ContentTemplate>
                <h2>VLANS</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CssClass="mGrid"
                    AllowSorting="True" 
                    DataSourceID="DS_SQL_vlans">
                    <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="VNIC" HeaderText="VNIC" SortExpression="Dn" />
                        <asp:BoundField DataField="VLANIDS" HeaderText="VLANs" SortExpression="Name" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DS_SQL_vlans" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UCSConnectionString %>" 
                    SelectCommand="select a.UCS, c.ChassisID, c.SlotID, c.Rn, d.name As [Server], a.name As VNIC, x.VlanIds
                                    from AdaptorHostethif a inner join blades c on a.DataSetID = c.DataSetID and a.DN like c.dn + '%'
                                    inner join ServiceProfiles d on a.DataSetID = d.DataSetID and c.AssignedToDn = d.DN
                                    cross apply 
                                    (SELECT stuff
                                        ((SELECT ', ' + cast(b.ID as varchar)
                                            FROM AdaptorVlan b
                                            WHERE b.DataSetID = a.DataSetID and b.DN like a.DN + '%' Order by b.ID ASC FOR xml path('')), 1, 1, '') AS VlanIds) x
                                    Where a.DataSetID = @DataSetID and a.Dn like @Dn + '%'
                                    Order By a.Name ASC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DataSetID_Label" Name="DataSetID" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="DN_Label" Name="Dn" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
</asp:Content>
