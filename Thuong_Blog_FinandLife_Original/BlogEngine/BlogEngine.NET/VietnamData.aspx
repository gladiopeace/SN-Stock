﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VietnamData.aspx.cs" Inherits="VietnameData" %>
<%@ Register Src="User controls/PostListStocks.ascx" TagName="PostListStocks" TagPrefix="uc1" %>
<%@ Import Namespace="BlogEngine.Core" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" Runat="Server">
<%--<div>
  		<div id="tabs1" style=" width:100%;height:35px;font-size:93%;line-height:normal;border-bottom:1px solid #BCD2E6;">
			<ul>
				<!-- CSS Tabs -->
                <li><a href="<%=Utils.AbsoluteWebRoot %>Month<%= BlogEngine.Core.BlogConfig.FileExtension %>"><span>MONTH</span></a></li>
                <li><a href="<%=Utils.AbsoluteWebRoot %>Quarter<%= BlogEngine.Core.BlogConfig.FileExtension %>"><span>QUARTER</span></a></li>
                <li><a href="<%=Utils.AbsoluteWebRoot %>Year<%= BlogEngine.Core.BlogConfig.FileExtension %>"><span>YEAR</span></a></li>             
			</ul>
		</div>    
    <div>
          <div id="divError" runat="Server" />
          <uc1:PostListStocks ID="PostList1" runat="server" />
          <blog:PostCalendar runat="server" ID="calendar" 
            EnableViewState="false"
            ShowPostTitles="true" 
            BorderWidth="0"
            NextPrevStyle-CssClass="header"
            CssClass="calendar" 
            WeekendDayStyle-CssClass="weekend" 
            OtherMonthDayStyle-CssClass="other" 
            UseAccessibleHeader="true"
            Visible="false" 
            Width="100%" />   
    </div>     
</div> --%>
</asp:Content>
