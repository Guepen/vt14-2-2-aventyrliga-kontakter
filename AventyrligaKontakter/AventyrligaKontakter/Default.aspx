<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AventyrligaKontakter.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListView ID="ListView1" runat="server" 
            ItemType="AventyrligaKontakter.Model.Contact"
            UpdateMethod="ListView1_UpdateItem"
            SelectMethod="ListView1_GetData"
            DataKeyNames="ContactID">
              <LayoutTemplate>
                    <table class="grid">
                        <tr>
                            <th>
                                förnamn
                            </th>
                            <th>
                                efternamn
                            </th>
                            <th>
                                Email
                            </th>
                            <th>
                            </th>
                        </tr>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                         </table>
                </LayoutTemplate>
             <ItemTemplate>
                    <%-- Mall för nya rader. --%>
                    <tr>
                        <td>
                            <%#: Item.FirstName %>
                            </td>
                        <td>
                            <%#: Item.LastName %>
                        </td>
                        <td>
                            <%#: Item.EmailAdress %>
                        </td>
                        <td class="command">
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" Text="Redigera" CausesValidation="false" />
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" Text="Ta Bort" CausesValidation="false "/>
                        </td>
                        </ItemTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>
