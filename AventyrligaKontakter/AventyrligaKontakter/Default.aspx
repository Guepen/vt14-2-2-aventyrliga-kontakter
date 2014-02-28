<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AventyrligaKontakter.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/style.css" rel="stylesheet" />
</head>
<body>
    <form id="MyForm" runat="server">
        <%-- ValideringsFel --%>
        <div id="Validation"></div>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="Insert" />
        <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup ="Update"  />

        <%-- Rättmeddelande --%>
        <asp:PlaceHolder ID="Message" runat="server" Visible="false">
            <p class="Message" >Kontakten lades till</p>
        </asp:PlaceHolder>
    <div>
        <%-- Lista på kontakter --%>
        <asp:ListView ID="ListView1" runat="server" 
            ItemType="AventyrligaKontakter.Model.Contact"
            UpdateMethod="ListView1_UpdateItem"
            SelectMethod="ListView1_GetData"
            InsertMethod="ListView1_InsertItem"
            DeleteMethod="ListView1_DeleteItem"
            InsertItemPosition="FirstItem"
            DataKeyNames="ContactID">
              <LayoutTemplate>
                    <table class="Table">
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
                  <%-- Listar kontakter sidvis --%>
                  
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
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" Text="Ta Bort" CausesValidation="false" OnClientClick="return confirm('Är du säker på att du vill ta bort kontakten?')"
                               />
                        </td>
                        </ItemTemplate>
            <EmptyDataTemplate>
                    <%-- Detta visas då kontaktuppgifter saknas i databasen. --%>
                    <table>
                        <tr>
                            <td>
                                Kontaktuppgifter saknas.
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            <%-- Mall och validering för att lägga till kontakter --%>
             <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="FName" runat="server" Text='<%# BindItem.FirstName %>' MaxLength="50" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Förnamn måste anges" 
                                ControlToValidate="FName" ValidationGroup="Insert" Display="None" ></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="LName" runat="server" Text='<%# BindItem.LastName %>'  MaxLength="50"/>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="EfterNamn måste anges" 
                                ControlToValidate="LName" ValidationGroup="Insert" Display="None" ></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="Email" runat="server" Text='<%# BindItem.EmailAdress %>' MaxLength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ErrorMessage="Email i fel format" ControlToValidate="Email" ValidationGroup="Insert" Display="None"  
                                ValidationExpression="^[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}$">

                            </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email måste anges" 
                                ControlToValidate="Email" ValidationGroup="Insert" Display="None" ></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Insert" Text="Lägg till" ValidationGroup="Insert" />
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel" Text="Rensa" CausesValidation="false" />
                        </td>
                    </tr>
                </InsertItemTemplate>
            <%-- Mall och validering för ändring av kontakt --%>
            <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="FNameU" runat="server" Text='<%# BindItem.FirstName %>' MaxLength="50" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Förnamn måste anges" 
                                ControlToValidate="FNameU" ValidationGroup="Update" Display="None" ></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="LNameU" runat="server" Text='<%# BindItem.LastName %>' MaxLength="50" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="EfterNamn måste anges" 
                                ControlToValidate="LNameU" ValidationGroup="Insert" Display="None" ></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="EMailU" runat="server" Text='<%# BindItem.EmailAdress %>' MaxLength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ErrorMessage="Email i fel format" ControlToValidate="EMailU" ValidationGroup="Update" Display="None"   
                               
                            ValidationExpression="^[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}$"> </asp:RegularExpressionValidator>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email måste anges" 
                                ControlToValidate="EMailU" ValidationGroup="Update" Display="None" ></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Update" Text="Spara" ValidationGroup="Update" />
                            <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="false" />
                        </td>
                    </tr>
                </EditItemTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>

