Imports System.Data.SqlClient
Public Class ChassisLayout_div
    Inherits System.Web.UI.Page

    Dim UCS As String = "JPKUCS001" 'Request.QueryString("UCS")
    Dim ChassisID As String = "1" 'Request.QueryString("ChassisID")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RenderChassis()
    End Sub
    Protected Sub RenderChassis()
        Dim SQL As String = "SELECT [Ucs], [Name], [Model], [ChassisId], [SlotId], [Serial], [OperState], [WWNs], [BootPolicyName] " & _
                            "FROM [v_Blades_ServiceProfile_General] WHERE [Ucs] = '" & UCS & "' AND [ChassisId] = " & ChassisID & " ORDER BY [Ucs], [ChassisId], [SlotId]"


        Dim SQL2 As String = "Select a.UCS, a.ChassisID, a.SlotID, a.Presence, b.Model, b.Serial, c.name " & _
                             "From v_ActiveSlots a Left Join v_ActiveBlades b on a.DataSetID = b.DataSetID and a.ChassisId = b.ChassisId and a.slotid = b.slotid " & _
                             "Left Join v_ActiveServiceProfiles c On a.DataSetID = c.DataSetID and b.AssignedToDn = c.DN " & _
                             "Where a.UCS = '" & UCS & "' and a.ChassisID = '" & ChassisID & "' Order by a.ChassisID, a.SlotID ASC"


        Dim table As New DataTable()
        Using conn As New SqlConnection("Data Source=NEDMCSSQL055SG2\INF2;Initial Catalog=UCS;Persist Security Info=True;User ID=UCS_ReadOnly;Password=Re@d0n1y!")
            Dim adapter As New SqlDataAdapter()
            adapter.SelectCommand = New SqlCommand(SQL2, conn)
            adapter.Fill(table)
        End Using
        Dim I As Integer = 0

        Dim Model1 As String = "Blank"
        Dim Model2 As String = "Blank"
        Dim Model3 As String = "Blank"
        Dim Model4 As String = "Blank"
        Dim Model5 As String = "Blank"
        Dim Model6 As String = "Blank"
        Dim Model7 As String = "Blank"
        Dim Model8 As String = "Blank"

        Dim Name1 As String = ""
        Dim Name2 As String = ""
        Dim Name3 As String = ""
        Dim Name4 As String = ""
        Dim Name5 As String = ""
        Dim Name6 As String = ""
        Dim Name7 As String = ""
        Dim Name8 As String = ""

        Dim Style1 As String = ""
        Dim Style2 As String = ""
        Dim Style3 As String = ""
        Dim Style4 As String = ""
        Dim Style5 As String = ""
        Dim Style6 As String = ""
        Dim Style7 As String = ""
        Dim Style8 As String = ""

        For Each Data As DataRow In table.Rows
            If Data.Item("SlotID") = 1 Then
                Model1 = Data.Item("Model").ToString()
                Name1 = Data.Item("Name").ToString().ToUpper()
                If Data.Item("Presence").ToString() = "empty" Then Model1 = "Blank"
                If Model1 = "UCSB-B420-M3" Or Model1 = "UCSB-B250-M1-M2" Then
                    Style1 = "    <div id=""ChassisSlot1"" style=""width: 550px; background-image: url('/ModelImages/" & Model1 & ".png')"">" & Name1 & "</div>"
                Else
                    Style1 = "    <div id=""ChassisSlot1"" style=""background-image: url('/ModelImages/" & Model1 & ".png')"">" & Name1 & "</div>"
                End If                
            End If
            If Data.Item("SlotID") = 2 Then
                Model2 = Data.Item("Model").ToString()
                Name2 = Data.Item("Name").ToString().ToUpper()
                If Data.Item("Presence").ToString() = "empty" Then Model2 = "Blank"
                If Data.Item("Presence").ToString() = "equipped-not-primary" Then
                    Style2 = ""
                Else
                    Style2 = "    <div id=""ChassisSlot2"" style=""background-image: url('/ModelImages/" & Model2 & ".png')"">" & Name2 & "</div>"
                End If                
            End If
            If Data.Item("SlotID") = 3 Then
                Model3 = Data.Item("Model").ToString()
                Name3 = Data.Item("Name").ToString().ToUpper()
                If Data.Item("Presence").ToString() = "empty" Then Model3 = "Blank"
                If Model3 = "UCSB-B420-M3" Or Model3 = "UCSB-B250-M1-M2" Then
                    Style3 = "    <div id=""ChassisSlot3"" style=""width: 550px; background-image: url('/ModelImages/" & Model3 & ".png')"">" & Name3 & "</div>"
                Else
                    Style3 = "    <div id=""ChassisSlot3"" style=""background-image: url('/ModelImages/" & Model3 & ".png')"">" & Name3 & "</div>"
                End If                
            End If
            If Data.Item("SlotID") = 4 Then
                Model4 = Data.Item("Model").ToString()
                Name4 = Data.Item("Name").ToString().ToUpper()
                If Data.Item("Presence").ToString() = "empty" Then Model4 = "Blank"
                If Data.Item("Presence").ToString() = "equipped-not-primary" Then
                    Style4 = ""
                Else
                    Style4 = "    <div id=""ChassisSlot4"" style=""background-image: url('/ModelImages/" & Model4 & ".png')"">" & Name4 & "</div>"
                End If            
            End If
            If Data.Item("SlotID") = 5 Then
                Model5 = Data.Item("Model").ToString()
                Name5 = Data.Item("Name").ToString().ToUpper()
                If Data.Item("Presence").ToString() = "empty" Then Model5 = "Blank"
                If Model5 = "UCSB-B420-M3" Or Model5 = "UCSB-B250-M1-M2" Then
                    Style5 = "    <div id=""ChassisSlot5"" style=""width: 550px; background-image: url('/ModelImages/" & Model5 & ".png')"">" & Name5 & "</div>"
                Else
                    Style5 = "    <div id=""ChassisSlot5"" style=""background-image: url('/ModelImages/" & Model5 & ".png')"">" & Name5 & "</div>"
                End If                
            End If
            If Data.Item("SlotID") = 6 Then
                Model6 = Data.Item("Model").ToString()
                Name6 = Data.Item("Name").ToString().ToUpper()
                If Data.Item("Presence").ToString() = "empty" Then Model6 = "Blank"
                If Data.Item("Presence").ToString() = "equipped-not-primary" Then
                    Style6 = ""
                Else
                    Style6 = "    <div id=""ChassisSlot6"" style=""background-image: url('/ModelImages/" & Model6 & ".png')"">" & Name6 & "</div>"
                End If                
            End If
            If Data.Item("SlotID") = 7 Then
                Model7 = Data.Item("Model").ToString()
                Name7 = Data.Item("Name").ToString().ToUpper()
                If Data.Item("Presence").ToString() = "empty" Then Model7 = "Blank"
                If Model7 = "UCSB-B420-M3" Or Model7 = "UCSB-B250-M1-M2" Then
                    Style7 = "    <div id=""ChassisSlot7"" style=""width: 550px; background-image: url('/ModelImages/" & Model7 & ".png')"">" & Name7 & "</div>"
                Else
                    Style7 = "    <div id=""ChassisSlot7"" style=""background-image: url('/ModelImages/" & Model7 & ".png')"">" & Name7 & "</div>"
                End If                
            End If
            If Data.Item("SlotID") = 8 Then
                Model8 = Data.Item("Model").ToString()
                Name8 = Data.Item("Name").ToString().ToUpper()
                If Data.Item("Presence").ToString() = "empty" Then Model8 = "Blank"
                If Data.Item("Presence").ToString() = "equipped-not-primary" Then
                    Style8 = ""
                Else
                    Style8 = "    <div id=""ChassisSlot8"" style=""background-image: url('/ModelImages/" & Model8 & ".png')"">" & Name8 & "</div>"
                End If                
            End If
        Next

        Literal1.Text = "<div id=""ChassisContainer"">" & vbCrLf & _
                        "    <div id=""ChassisLeftSide""></div>" & vbCrLf & _
                        "    <div id=""ChassisTop""></div>" & vbCrLf & _
                        "    <div id=""ChassisRightSide""></div>" & vbCrLf & _
                        "    <div id=""ChassisBottom""></div>" & vbCrLf & _
                        "    <div id=""ChassisVD1""></div>" & vbCrLf & _
                        "    <div id=""ChassisVD2""></div>" & vbCrLf & _
                        "    <div id=""ChassisVD3""></div>" & vbCrLf & _
                        "    <div id=""ChassisVD4""></div>" & vbCrLf & _
                        "    <div id=""ChassisHD1_1""></div>" & vbCrLf & _
                        "    <div id=""ChassisHD1_2""></div>" & vbCrLf & _
                        "    <div id=""ChassisHD2_1""></div>" & vbCrLf & _
                        "    <div id=""ChassisHD2_2""></div>" & vbCrLf & _
                        "    <div id=""ChassisHD3_1""></div>" & vbCrLf & _
                        "    <div id=""ChassisHD3_2""></div>" & vbCrLf & _
                        Style1 & vbCrLf & _
                        Style2 & vbCrLf & _
                        Style3 & vbCrLf & _
                        Style4 & vbCrLf & _
                        Style5 & vbCrLf & _
                        Style6 & vbCrLf & _
                        Style7 & vbCrLf & _
                        Style8 & vbCrLf & _
                        "</div>"

    End Sub

End Class