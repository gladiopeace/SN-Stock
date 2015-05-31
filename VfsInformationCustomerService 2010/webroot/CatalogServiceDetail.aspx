﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CatalogServiceDetail.aspx.cs" Inherits="CatalogServiceDetail" Title="Untitled Page" %>
<%@ Register Assembly="jQueryDatePicker" Namespace="Westwind.Web.Controls" TagPrefix="ww" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div>
        <div><input class="button" id="ButtonSave" runat="server" type="button" value="Lưu" onserverclick="buttonSave_ServerClick" />
             <input class="button" id="ButtonDelete" runat="server" type="button" value="Xóa" onclick="confirmAction(event,'Bạn muốn xóa loại dịch vụ này ra khỏi hệ thống ?');" onserverclick="ButtonDelete_onserverclick" />
        </div>
        <table>        
            <tr>
                <td><%=Resources.UIResource.nameService%><span class="inforError">(*)</span></td>
                <td><input runat="server" id="inputNameCatalog" maxlength="50" /></td>
                <td><label class="inforError" visible="false" runat="server" id="lableInfor"></label></td>
            </tr>
           
        </table>
    </div>
</asp:Content>

