<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ping Util
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <% var results = (List<string>)ViewData["Results"]; %>
    <% var depots = (Dictionary<string, string>)ViewData["Depots"]; %>
    
    <script type="text/javascript">

        function grabber(selection) {

            document.getElementById("ip").value = selection.value;
        
        
        }
    
    
    
    
    </script>

    <div>
        <form method="post" action="/Home/Index">
            <select onchange="grabber(this)">
             <option>Please select</option>
            <% foreach(KeyValuePair<string, string> item in depots)
               { %>
                    <option value="<%: item.Value %>"><%: item.Key %></option>
           
            <%} %>

            </select>

            <input type="text" name="ip" id="ip" value="<%: ViewData["HostName"] %>" />
            <input type="text" name="times" size="2" value="<%: ViewData["Times"] %>"/>
            <input type="submit" value="Ping IP" />
        </form>
    </div>

    <% if (ViewData["Results"] != null)
       { %>

    

    <% for (var i = 0; i < results.Count; i++)
       { %>
       
            <div>

                <%: results[i] %>

            </div>


    <%} %>

    <%} %>
    
</asp:Content>
