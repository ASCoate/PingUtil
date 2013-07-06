<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ping Util
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <form method="post" action="/Home/Index">
            <input type="text" name="ip" value="<%: ViewData["HostName"] %>" />
            <input type="text" name="times" size="2" value="<%: ViewData["Times"] %>"/>
            <input type="submit" value="Ping IP" />
        </form>
    </div>

    <% if (ViewData["Results"] != null)
       { %>

    <% var results = (List<string>)ViewData["Results"]; %>

    <% for (var i = 0; i < results.Count; i++)
       { %>
       
            <div>

                <%: results[i] %>

            </div>


    <%} %>

    <%} %>
    
</asp:Content>
