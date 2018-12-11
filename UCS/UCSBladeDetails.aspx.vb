Imports System.Data.SqlClient
Public Class UCSBladeDetails
    Inherits System.Web.UI.Page
    Dim DataSetID As Integer
    Dim UCS As String
    Dim DN As String
    Dim Model As String
    Dim ServerName As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("UCS") Is Nothing Then
            UCS = "APNUCS001"
        Else
            UCS = Request.QueryString("UCS")
        End If
        If Request.QueryString("DN") Is Nothing Then
            DN = "sys/chassis-5/blade-1"
        Else
            DN = Request.QueryString("DN")
        End If
        UCS_Label.Text = UCS
        DN_Label.Text = DN
        DataSetID = GetDataSetID(UCS)
        DataSetID_Label.Text = DataSetID
        Model = GetModel(UCS, DN)
        ServerName = GetServerName(UCS, DN)
        Server_Label.Text = ServerName.ToUpper()
        If Model <> "0" Then
            Image2.ImageUrl = ".\ModelImages\" & Model & ".png"
        End If
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
    Function GetModel(ByVal UCS As String, ByVal DN As String) As String
        Dim SQL As String = "Select Model from v_ActiveBlades Where UCS = '" & UCS & "' and DN = '" & DN & "'"

        Dim table As New DataTable()
        Using conn As New SqlConnection("Data Source=NEDMCSSQL055SG2\INF2;Initial Catalog=UCS;Persist Security Info=True;User ID=UCS_ReadOnly;Password=Re@d0n1y!")
            Dim adapter As New SqlDataAdapter()
            adapter.SelectCommand = New SqlCommand(SQL, conn)
            adapter.Fill(table)
        End Using
        If table.Rows.Count > 0 Then
            Return table.Rows(0).Item(0)
        Else
            Return "0"
        End If
    End Function
    Function GetServerName(ByVal UCS As String, ByVal DN As String) As String
        Dim SQL As String = "Select Name from v_ActiveServiceProfiles Where UCS = '" & UCS & "' and PnDn = '" & DN & "'"

        Dim table As New DataTable()
        Using conn As New SqlConnection("Data Source=NEDMCSSQL055SG2\INF2;Initial Catalog=UCS;Persist Security Info=True;User ID=UCS_ReadOnly;Password=Re@d0n1y!")
            Dim adapter As New SqlDataAdapter()
            adapter.SelectCommand = New SqlCommand(SQL, conn)
            adapter.Fill(table)
        End Using
        If table.Rows.Count > 0 Then
            Return table.Rows(0).Item(0)
        Else
            Return "0"
        End If
    End Function
End Class