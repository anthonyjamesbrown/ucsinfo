Imports System.Data.SqlClient
Public Class UCSCapacity
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Export_Button_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Export_Button.Click

        Dim SQL As String = "SELECT * FROM [v_ActiveCapacity] ORDER BY [InstanceName]"

        Dim table As New DataTable()
        Using conn As New SqlConnection("Data Source=NEDMCSSQL055SG2\INF2;Initial Catalog=UCS;Persist Security Info=True;User ID=UCS_ReadOnly;Password=Re@d0n1y!")
            Dim adapter As New SqlDataAdapter()
            adapter.SelectCommand = New SqlCommand(SQL, conn)
            adapter.Fill(table)
        End Using

        Dim sDate As String = DateTime.Now.ToString("yyyyMMdd")

        Response.Clear()

        Response.AddHeader("content-disposition", "attachment;filename=UCSSlotCapacity" & sDate & ".xls")
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

    Private Sub Chart2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chart2.DataBound
        For Each series As System.Web.UI.DataVisualization.Charting.Series In Chart2.Series
            For Each point As System.Web.UI.DataVisualization.Charting.DataPoint In series.Points
                If point.YValues.Length > 0 And CDbl(point.YValues.GetValue(0)) = 0 Then
                    point.IsValueShownAsLabel = False
                End If
            Next
        Next
    End Sub
End Class