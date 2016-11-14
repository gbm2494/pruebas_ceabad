<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="PruebaWebForms.Grid" %>

<body>

<form runat="server">
<asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
    <asp:GridView ID="gridSample" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                        CssClass="grid" OnRowCommand="gridSample_RowCommand"
        DataKeyNames="cedula" CellPadding="4" ForeColor="#333333"
                        GridLines="None" OnRowCancelingEdit="gridSample_RowCancelingEdit"
                        OnRowEditing="gridSample_RowEditing"
        OnRowUpdating="gridSample_RowUpdating"
        onrowdatabound="gridSample_RowDataBound"
        onrowdeleting="gridSample_RowDeleting">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="" CommandName="Edit" ToolTip="Edit" 
                                        CommandArgument=''><img src="../Images/show.png" width="14" height="14" /></asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                                        ToolTip="Delete" OnClientClick='return confirm("Are you sure you want to delete this entry?");'
                                        CommandArgument=''><img src="../Images/icon_delete.png" width="14" height="14"/></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkInsert" runat="server" Text="" ValidationGroup="editGrp" CommandName="Update" ToolTip="Save"
                                        CommandArgument=''><img src="../Images/icon_save.png" width="14" height="14" /></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="" CommandName="Cancel" ToolTip="Cancel"
                                        CommandArgument=''><img src="../Images/refresh.png" width="14" height="14" /></asp:LinkButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text=""  ValidationGroup="newGrp" CommandName="InsertNew" ToolTip="Add New Entry"
                                        CommandArgument=''><img src="../Images/icon_new.png" width="14" height="14"/></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" Text="" CommandName="CancelNew" ToolTip="Cancel"
                                        CommandArgument=''><img src="../Images/refresh.png" width="14" height="14"/></asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cedula">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCedula" runat="server" Text='<%# Bind("cedula") %>' CssClass="" MaxLength="10" Enabled="false"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valFirstName" runat="server" ControlToValidate="txtCedula"
                                    Display="Dynamic" ErrorMessage="Cedula requerido." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="editGrp">*</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCedula" runat="server" Text='<%# Bind("cedula") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtCedulaNuevo" runat="server" CssClass=""  MaxLength="30"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="valCedula" runat="server" ControlToValidate="txtCedulaNuevo"
                                    Display="Dynamic" ErrorMessage="Cedula requerido." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="newGrp">*</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="Nombre">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("nombre") %>' CssClass="" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valNombre" runat="server" ControlToValidate="txtNombre"
                                    Display="Dynamic" ErrorMessage="Nombre requerido." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="editGrp">*</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtNombreNuevo" runat="server" CssClass=""  MaxLength="30"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="valNombreNuevo" runat="server" ControlToValidate="txtNombreNuevo"
                                    Display="Dynamic" ErrorMessage="Nombre requerido." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="newGrp">*</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>       
                            <asp:TemplateField HeaderText="Apellido 1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtApe1" runat="server" Text='<%# Bind("apellido1") %>' CssClass="" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valApe1" runat="server" ControlToValidate="txtApe1"
                                    Display="Dynamic" ErrorMessage="Primer apellido requerido" ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="editGrp">*</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="txtApe1" runat="server" Text='<%# Bind("apellido1") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtApe1Nuevo" runat="server" CssClass=""   MaxLength="30"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="valApe1Nuevo" runat="server" ControlToValidate="txtApe1Nuevo"
                                    Display="Dynamic" ErrorMessage="Primer apellido requerido" ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="newGrp">*</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Apellido 2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtApe2" runat="server" Text='<%# Bind("apellido2") %>' CssClass="" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valApe2" runat="server" ControlToValidate="txtApe2"
                                    Display="Dynamic" ErrorMessage="Segundo apellido requerido" ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="editGrp">*</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblApe2" runat="server" Text='<%# Bind("apellido2") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtApe2Nuevo" runat="server" CssClass=""   MaxLength="30"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="valApe2Nuevo" runat="server" ControlToValidate="txtApe2Nuevo"
                                    Display="Dynamic" ErrorMessage="Segundo apellido requerido" ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="newGrp">*</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>  
                             <asp:TemplateField HeaderText="Tipo">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlTipo" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="valTipo" runat="server" ControlToValidate="ddlTipo"
                                    Display="Dynamic" ErrorMessage="Tipo requerido." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="editGrp">*</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("tipo_persona.tipo") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                  <asp:DropDownList ID="ddlTipoNuevo" runat="server">
                                  </asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="valTipoNuevo" runat="server" ControlToValidate="ddlTipoNuevo"
                                    Display="Dynamic" ErrorMessage="Tipo requerido." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="newGrp">*</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>                            
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
    </form>
    </body>