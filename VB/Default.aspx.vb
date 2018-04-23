Imports System

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not IsPostBack Then
            ASPxGridView1.FilterExpression = ASPxFilterControl1.FilterExpression
        End If
    End Sub
End Class