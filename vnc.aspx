<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vnc.aspx.cs" Inherits="FuseCP.Providers.Virtualization.NoVNC.vnc"
	EnableTheming="False" StylesheetTheme="" Theme="" %>

<DOCTYPE html>
<html lang="en" class="noVNC_loading">
<head runat="server">

	<asp:Literal ID="headHtml" runat="server" />

	<script type="module" crossorigin="anonymous" src="app/error-handler.js"></script>
	<%--<script type="module" crossorigin="anonymous" src="app/ui.js"></script>--%>
	<%--<script type="module" crossorigin="anonymous" src="app/FuseCP.js"></script>--%>
</head>
<body style="border: 0; margin: 0; padding: 0;">

	<asp:Literal ID="bodyHtml" runat="server" />

	<form id="form1" runat="server" autocomplete="off"></form>

	<script type="module">

		import UI from "./app/ui.js";
		import SCPUI from "./app/fusecp.js";

		UI.SCP = new SCPUI(UI);

        UI.start({
            settings: {
                defaults: {
                    autoresize: true,
                },
                mandatory: {
                    path: <%= Path %>,
                    port: <%= Port %>,
                    host: <%= Host %>,
                    password: <%= Password %>,
                    autoconnect: true
                }
            }
        });

    </script>

</body>
</html>
