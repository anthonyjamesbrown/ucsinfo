Imports System.Data.SqlClient
Public Class ChassisLayout
    Inherits System.Web.UI.Page
    Dim UCS As String = "JPKUCS001" 'Request.QueryString("UCS")
    Dim ChassisID As String = "1" 'Request.QueryString("ChassisID")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim SQL As String = "SELECT [Ucs], [Name], [Model], [ChassisId], [SlotId], [Serial], [OperState], [WWNs], [BootPolicyName] " & _
                            "FROM [v_Blades_ServiceProfile_General] WHERE [Ucs] = '" & UCS & "' AND [ChassisId] = " & ChassisID & " ORDER BY [Ucs], [ChassisId], [SlotId]"

        Dim table As New DataTable()
        Using conn As New SqlConnection("Data Source=NEDMCSSQL055SG2\INF2;Initial Catalog=UCS;Persist Security Info=True;User ID=UCS_ReadOnly;Password=Re@d0n1y!")
            Dim adapter As New SqlDataAdapter()
            adapter.SelectCommand = New SqlCommand(SQL, conn)
            adapter.Fill(table)
        End Using

        Dim Model1 As String = "Blank"
        Dim Model2 As String = "Blank"
        Dim Model3 As String = "Blank"
        Dim Model4 As String = "Blank"
        Dim Model5 As String = "Blank"
        Dim Model6 As String = "Blank"
        Dim Model7 As String = "Blank"
        Dim Model8 As String = "Blank"

        For Each Data As DataRow In table.Rows
            If Data.Item("SlotID") = 1 Then Model1 = Data.Item("Model").ToString()
            If Data.Item("SlotID") = 2 Then Model2 = Data.Item("Model").ToString()
            If Data.Item("SlotID") = 3 Then Model3 = Data.Item("Model").ToString()
            If Data.Item("SlotID") = 4 Then Model4 = Data.Item("Model").ToString()
            If Data.Item("SlotID") = 5 Then Model5 = Data.Item("Model").ToString()
            If Data.Item("SlotID") = 6 Then Model6 = Data.Item("Model").ToString()
            If Data.Item("SlotID") = 7 Then Model7 = Data.Item("Model").ToString()
            If Data.Item("SlotID") = 8 Then Model8 = Data.Item("Model").ToString()
        Next

        Image16.ImageUrl = ".\ModelImages\" & Model1 & ".png"
        Image17.ImageUrl = ".\ModelImages\" & Model2 & ".png"
        Image18.ImageUrl = ".\ModelImages\" & Model3 & ".png"
        Image19.ImageUrl = ".\ModelImages\" & Model4 & ".png"
        Image20.ImageUrl = ".\ModelImages\" & Model5 & ".png"
        Image21.ImageUrl = ".\ModelImages\" & Model6 & ".png"
        Image22.ImageUrl = ".\ModelImages\" & Model7 & ".png"
        Image23.ImageUrl = ".\ModelImages\" & Model8 & ".png"

    End Sub

End Class