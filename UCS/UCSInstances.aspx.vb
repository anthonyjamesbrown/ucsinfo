Imports System.Data.SqlClient
Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub SqlDataSource1_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        Records_Label.Text = "Records Returned: " & e.AffectedRows
        GetChassisTotal()
    End Sub
    Protected Sub Export_Button_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Export_Button.Click

        Dim SQL As String = "SELECT * FROM [v_UCS_Geninfo]"

        Dim table As New DataTable()
        Using conn As New SqlConnection("Data Source=NEDMCSSQL055SG2\INF2;Initial Catalog=UCS;Persist Security Info=True;User ID=UCS_ReadOnly;Password=Re@d0n1y!")
            Dim adapter As New SqlDataAdapter()
            adapter.SelectCommand = New SqlCommand(SQL, conn)
            adapter.Fill(table)
        End Using

        Dim sDate As String = DateTime.Now.ToString("yyyyMMdd")

        Response.Clear()

        Response.AddHeader("content-disposition", "attachment;filename=UCSInstances" & sDate & ".xls")
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

    Public Sub GetChassisTotal()
        Dim SQL As String = "SELECT SUM(ChassisCount), SUM(BladeCount), SUM(EmptySlots) FROM [v_UCS_Geninfo]"

        Dim table As New DataTable()
        Using conn As New SqlConnection("Data Source=NEDMCSSQL055SG2\INF2;Initial Catalog=UCS;Persist Security Info=True;User ID=UCS_ReadOnly;Password=Re@d0n1y!")
            Dim adapter As New SqlDataAdapter()
            adapter.SelectCommand = New SqlCommand(SQL, conn)
            adapter.Fill(table)
        End Using
        Dim ChassisTotal As String = table.Rows(0).Item(0)
        Dim BladeTotal As String = table.Rows(0).Item(1)
        Dim EmptySlots As String = table.Rows(0).Item(2)
        Chassis_Label.Text = "  |  Chassis Count Total: " & ChassisTotal & "    |   Blade Count Total: " & BladeTotal & "   |   Empty Slot Total: " & EmptySlots
    End Sub
End Class