Imports System.Data.SqlClient
Public Class UCSInstanceDetails
    Inherits System.Web.UI.Page
    Dim DataSetID As Integer
    Dim UCS As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("UCS") Is Nothing Then
            UCS = "APNUCS001"
        Else
            UCS = Request.QueryString("UCS")
        End If
        UCS_Label.Text = UCS
        DataSetID = GetDataSetID(UCS)
        DataSetID_Label.Text = DataSetID
    End Sub
    Function GetDataSetID(ByVal UCS As String) As Integer
        Dim SQL As String = "Select DataSetID from CollectionData Where UCS = '" & UCS & "' and RecordStatus = 'active'"

        Dim table As New DataTable()
        Using conn As New SqlConnection("Data Source=NEDMCSSQL055SG2\INF2;Initial Catalog=UCS;Persist Security Info=True;User ID=UCS_ReadOnly;Password=Re@d0n1y!")
            Dim adapter As New SqlDataAdapter()
            adapter.SelectCommand = New SqlCommand(SQL, conn)
            adapter.Fill(table)
        End Using
        If table.Rows.Count > 0 Then
            Return table.Rows(0).Item(0)
        Else
            Return 0
        End If
    End Function

    Private Sub GridView17_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView17.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lbl As String = e.Row.Cells(0).Text
            If lbl IsNot Nothing Then
                e.Row.Cells(0).Text = e.Row.Cells(0).Text.ToUpper()
                e.Row.Cells(0).Font.Bold = True
                e.Row.Cells(0).HorizontalAlign = HorizontalAlign.Center
                If lbl = "info" Or lbl = "condition" Then
                    e.Row.Cells(0).BackColor = Drawing.Color.Blue
                    e.Row.Cells(0).ForeColor = Drawing.Color.White
                End If
                If lbl = "critical" Then
                    e.Row.Cells(0).BackColor = Drawing.Color.DarkRed
                    e.Row.Cells(0).ForeColor = Drawing.Color.White
                End If
                If lbl = "major" Then
                    e.Row.Cells(0).BackColor = Drawing.Color.Red
                    e.Row.Cells(0).ForeColor = Drawing.Color.Black
                End If
                If lbl = "minor" Then
                    e.Row.Cells(0).BackColor = Drawing.Color.LightGreen
                    e.Row.Cells(0).ForeColor = Drawing.Color.Black
                End If
                If lbl = "warning" Then
                    e.Row.Cells(0).BackColor = Drawing.Color.Yellow
                    e.Row.Cells(0).ForeColor = Drawing.Color.Black
                End If
                If lbl = "cleared" Then
                    e.Row.Cells(0).BackColor = Drawing.Color.LightSeaGreen
                    e.Row.Cells(0).ForeColor = Drawing.Color.Black
                End If
            End If
        End If
    End Sub
End Class