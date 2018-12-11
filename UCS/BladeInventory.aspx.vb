Imports System.Data.SqlClient
Public Class BladeInventory
    Inherits System.Web.UI.Page
    Dim DataCenter As String = ""
    Dim InstanceName As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        DataCenter = Request.QueryString("UCS")
        InstanceName = Request.QueryString("UCS2")

        If DataCenter <> "" And Not DataCenter Is Nothing Then
            DC_DropDownList.SelectedValue = DataCenter
        End If
        If InstanceName <> "" And Not InstanceName Is Nothing And DataCenter <> "" And Not DataCenter Is Nothing Then
            If InstanceName.StartsWith(DataCenter) Then UCS_DropDownList.SelectedValue = InstanceName
        End If

    End Sub

    Protected Sub DC_DropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DC_DropDownList.SelectedIndexChanged
        If DataCenter <> "" And Not DataCenter Is Nothing Then
            Response.Redirect("BladeInventory.aspx")
        End If

        UCS_DropDownList.Items.Clear()
        UCS_DropDownList.Items.Insert(0, "All")
        UCS_DropDownList.SelectedIndex = 0
        UCS_DropDownList.SelectedItem.Value = "%"
    End Sub

    Private Sub SqlDataSource1_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        Records_Label.Text = "Records Returned: " & e.AffectedRows
    End Sub

    Protected Sub Export_Button_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Export_Button.Click
        Dim UCS2 As String = UCS_DropDownList.SelectedValue
        Dim UCS As String = DC_DropDownList.SelectedValue
        Dim filter As String = Filter_TextBox.Text

        Dim SQL As String = "SELECT [Ucs], [Name], [Model], [ChassisId], [SlotId], [Serial], [OperState], [WWNs], ([TotalMemory]/1024) As Memory, [NumOfCores] As Cores, [FaultCount], [BootPolicyName], [HostFwPolicyName], Substring(Replace([SPDN], 'org-root/org-', ''),1, 3) As SPDN " &
                            "FROM [v_Blades_ServiceProfile_General] WHERE ((([Ucs] LIKE '%" & UCS & "%') AND ([Ucs] Like '" & UCS2 & "')) " &
                            "AND (([Name] LIKE '%" & filter & "%') OR ([WWNs] LIKE '%" & filter & "%') OR ([Serial] LIKE '%" & filter & "%') OR ([Model] LIKE '%" & filter & "%') OR ([BootPolicyName] LIKE '%" & filter & "%') OR ([HostFwPolicyName] LIKE '%" & filter & "%')))  ORDER BY [Ucs], [ChassisId], [SlotId]"

        Dim table As New DataTable()
        Using conn As New SqlConnection("Data Source=NEDMCSSQL055SG2\INF2;Initial Catalog=UCS;Persist Security Info=True;User ID=UCS_ReadOnly;Password=Re@d0n1y!")
            Dim adapter As New SqlDataAdapter()
            adapter.SelectCommand = New SqlCommand(SQL, conn)
            adapter.Fill(table)
        End Using

        Dim sDate As String = DateTime.Now.ToString("yyyyMMdd")

        Response.Clear()

        Response.AddHeader("content-disposition", "attachment;filename=BladeInventory" & sDate & ".xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"

        Dim sw As System.IO.StringWriter = New System.IO.StringWriter
        Dim hw As System.Web.UI.HtmlTextWriter = New HtmlTextWriter(sw)
        Dim dbGrid As New DataGrid()
        dbGrid.DataSource = table
        dbGrid.DataBind()
        dbGrid.RenderControl(hw)

        ' Write out the data  
        Response.Write(sw.ToString)
        Response.End()
    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)


    End Sub
End Class