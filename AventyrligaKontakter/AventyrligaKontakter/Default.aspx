<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AventyrligaKontakter.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <asp:PlaceHolder ID="Message" runat="server" Visible="false">
            <p>Kontakten lades till</p>
        </asp:PlaceHolder>
    <div>
        <asp:ListView ID="ListView1" runat="server" 
            ItemType="AventyrligaKontakter.Model.Contact"
            UpdateMethod="ListView1_UpdateItem"
            SelectMethod="ListView1_GetData"
            InsertMethod="ListView1_InsertItem"
            DeleteMethod="ListView1_DeleteItem"
            InsertItemPosition="FirstItem"
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
                  <asp:DataPager ID="DataPager" runat="server">
                      <Fields>
                        <asp:NextPreviousPagerField ShowFirstPageButton="True" FirstPageText=" << "
                            ShowNextPageButton="False" ShowPreviousPageButton="False"  />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ShowLastPageButton="True" LastPageText=" >> "
                            ShowNextPageButton="False" ShowPreviousPageButton="False"  />
                    </Fields>
                </asp:DataPager>
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
            <EmptyDataTemplate>
                    <%-- Detta visas då kunduppgifter saknas i databasen. --%>
                    <table class="grid">
                        <tr>
                            <td>
                                Kontaktuppgifter saknas.
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
             <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="Name" runat="server" Text='<%# BindItem.FirstName %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Address" runat="server" Text='<%# BindItem.LastName %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PostalCode" runat="server" Text='<%# BindItem.EmailAdress %>' />
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Insert" Text="Lägg till" />
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel" Text="Rensa" CausesValidation="false" />
                        </td>
                    </tr>
                </InsertItemTemplate>
            <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="Name" runat="server" Text='<%# BindItem.FirstName %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Address" runat="server" Text='<%# BindItem.LastName %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PostalCode" runat="server" Text='<%# BindItem.EmailAdress %>' />
                        </td>
                        <td>
                            <%-- "Kommandknappar" för att uppdatera en kunduppgift och avbryta. Kommandonamnen är VIKTIGA! --%>
                            <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Update" Text="Spara" />
                            <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="false" />
                        </td>
                    </tr>
                </EditItemTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>
