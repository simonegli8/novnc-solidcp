using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SolidCP.Providers;
using SolidCP.Portal;
using SolidCP.WebPortal;

namespace SolidCP.Providers.Virtualization.NoVNC
{
	public partial class vnc : System.Web.UI.Page
	{
        public const string DEFAULT_PAGE = "~/Default.aspx";
        public const string PAGE_ID_PARAM = "pid";

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
        }
    }
}