<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GridViewHideEmpty</title>
    <script type="text/javascript">
        function AdjustVisibility(s, e) {
            s.SetVisible(s.GetVisibleRowsOnPage() > 0)
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxButton runat="server" ID="btnApply" Text="Apply Filter" AutoPostBack="false">
            <ClientSideEvents Click="function(s, e) { filter.Apply(); }" />
        </dx:ASPxButton>

        <dx:ASPxFilterControl ID="ASPxFilterControl1" runat="server" ClientInstanceName="filter" FilterExpression="UnitsOnOrder > 150">
            <Columns>
                <dx:FilterControlComboBoxColumn PropertyName="ProductName">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Value="Chai" Text="Chai" />
                            <dx:ListEditItem Value="Chang" Text="Chang" />
                        </Items>
                    </PropertiesComboBox>
                </dx:FilterControlComboBoxColumn>
                <dx:FilterControlSpinEditColumn PropertyName="UnitsOnOrder" />
            </Columns>
            <ClientSideEvents Applied="function(s, e) { grid.ApplyFilter(e.filterExpression); }" />
        </dx:ASPxFilterControl>
        
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid" DataSourceID="AccessDataSource1" 
            KeyFieldName="ProductID" AutoGenerateColumns="False">
            <ClientSideEvents Init="AdjustVisibility" EndCallback="AdjustVisibility" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                    <NewButton Visible="True">
                    </NewButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsOnOrder] FROM [Products]"
            DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ?" InsertCommand="INSERT INTO [Products] ([ProductName], [UnitPrice], [UnitsOnOrder]) VALUES (?, ?, ?)"
            UpdateCommand="UPDATE [Products] SET [ProductName] = ?, [UnitPrice] = ?, [UnitsOnOrder] = ? WHERE [ProductID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
