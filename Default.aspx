<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>Cadastro de Clientes</h2>
        <table class="nav-justified">
            <tr>
                <td class="modal-sm" style="height: 31px; width: 144px; text-align: right;">Nome:&nbsp;&nbsp; </td>
                <td style="height: 31px">
                    <asp:TextBox ID="txtNome" runat="server" Width="295px"></asp:TextBox>
                </td>
                <td style="height: 31px"></td>
                <td style="height: 31px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="height: 29px; width: 144px; text-align: right;">Dt. Nascimento:&nbsp;&nbsp; </td>
                <td style="height: 29px">
                    <asp:TextBox ID="txtDataNasc" runat="server" TextMode="Date" placeholder="dd-mm-yyyy" ></asp:TextBox>
                </td>
                <td style="height: 29px"></td>
                <td style="height: 29px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="height: 30px; width: 144px; text-align: right;">Salário:&nbsp;&nbsp; </td>
                <td style="height: 30px">
                    <asp:TextBox ID="txtSalario" runat="server"></asp:TextBox>
                </td>
                <td style="height: 30px"></td>
                <td style="height: 30px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 144px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div style="padding: 5px">
            <asp:Button ID="btnAdd" runat="server" Text="Incluir" Height="38px" Width="85px" style="margin-right: 5px" OnClick="btnAdd_Click"/>
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Height="38px" Width="85px" OnClick="btnCancelar_Click"/>
        </div>
        <div style="padding: 5px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Height="186px" Width="558px" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged2">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" >
                    <ItemStyle Width="125px" />
                    </asp:CommandField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" >
                    <ItemStyle Width="250px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DATANASC" HeaderText="DATANASC" SortExpression="DATANASC" />
                    <asp:BoundField DataField="SALARIO" HeaderText="SALARIO" SortExpression="SALARIO" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRUDConnectionString1 %>" DeleteCommand="DELETE FROM [CLIENTES] WHERE [ID] = @ID" InsertCommand="INSERT INTO [CLIENTES] ([NOME], [DATANASC], [SALARIO]) VALUES (@NOME, @DATANASC, @SALARIO)" ProviderName="<%$ ConnectionStrings:CRUDConnectionString1.ProviderName %>" SelectCommand="SELECT [ID], [NOME], [DATANASC], [SALARIO] FROM [CLIENTES]" UpdateCommand="UPDATE [CLIENTES] SET [NOME] = @NOME, [DATANASC] = @DATANASC, [SALARIO] = @SALARIO WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NOME" Type="String" />
                    <asp:Parameter Name="DATANASC" Type="DateTime" />
                    <asp:Parameter Name="SALARIO" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NOME" Type="String" />
                    <asp:Parameter Name="DATANASC" Type="DateTime" />
                    <asp:Parameter Name="SALARIO" Type="Decimal" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </div>

</asp:Content>
