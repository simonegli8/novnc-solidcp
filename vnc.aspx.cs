using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SolidCP.Providers;
using SolidCP.Providers.OS;
using SolidCP.Portal;
using SolidCP.WebPortal;
using System.Text.RegularExpressions;


namespace SolidCP.Providers.Virtualization.NoVNC
{
	public partial class vnc : System.Web.UI.Page
	{
        public const string DEFAULT_PAGE = "~/Default.aspx";
        public const string PAGE_ID_PARAM = "pid";
        public const string ITEM_ID_PARAM = "item";

        protected void Page_Load(object sender, EventArgs e)
		{
            var loggedIn = PanelSecurity.LoggedUser != null;
            if (!loggedIn)
            {
                // redirect to login page
                string returnUrl = Request.RawUrl;
                Response.Redirect(DEFAULT_PAGE + "?" + PAGE_ID_PARAM + "=" +
                    PortalConfiguration.SiteSettings["LoginPage"] + "&ReturnUrl=" + Server.UrlEncode(returnUrl));
            }

            var item = Request.QueryString[ITEM_ID_PARAM];
            if (item != null)
            {
                var itemId = int.Parse(item);
                var vm = Portal.ES.Services.Packages.GetPackageItem(itemId) as VirtualMachine;
                if (vm != null) Page.Title = vm.Name;
                else Page.Title = "noVNC";

                var baseUrl = Regex.Match(Request.RawUrl, "^.*(?=/.*?.aspx)")?.Value;
                var vncCredentials = Portal.ES.Services.Proxmox.GetPveVncCredentials(itemId);
                if (vncCredentials != null) {
                    string path = TunnelUri.QueryEncode($"{baseUrl}/websocket?user={TunnelUri.QueryEncode(PanelSecurity.LoggedUser.Username)}&item={itemId}&port={vncCredentials.Port}&ticket={HttpUtility.UrlEncode(vncCredentials.Ticket)}");
                    var url = $"{baseUrl}/vnc.html?autoconnect=true&host={Request.Url.Host}&port={Request.Url.Port}&path={path}&password={HttpUtility.UrlEncode(vncCredentials.Ticket)}";
                    frame.Src = url;
                }
            }
        }
    }
}