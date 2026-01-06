<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vnc.aspx.cs" Inherits="SolidCP.Providers.Virtualization.NoVNC.vnc"
	EnableTheming="False" StylesheetTheme="" Theme="" %>

<DOCTYPE html>
<html lang="en" class="noVNC_loading">
<head runat="server">

	<asp:Literal ID="headHtml" runat="server" />

	<script type="module" crossorigin="anonymous" src="app/error-handler.js"></script>
	<%--<script type="module" crossorigin="anonymous" src="app/ui.js"></script>--%>
	<%--<script type="module" crossorigin="anonymous" src="app/solidcp.js"></script>--%>
</head>
<body style="border: 0; margin: 0; padding: 0;">

	<asp:Literal ID="bodyHtml" runat="server" />

	<form id="form1" runat="server" autocomplete="off"></form>

	<script type="module">

		import UI from "./app/ui.js";
		import SCPUI from "./app/solidcp.js";

		UI.setupSolidCP = function () {

            UI.closeConnectPanel();

			UI.updateViewClip();

			UI.forceSetting('path', <%= Path %>);
			UI.forceSetting('port', <%= Port %>);
			UI.forceSetting('host', <%= Host %>);

			//UI.forceSetting('encrypt', true);
			UI.forceSetting('autoresize', true);
			UI.addSettingChangeHandler('autoresize');

			UI.connect(null, <%= Password %>);
		};

		UI.SCP = new SCPUI(UI);

		UI.start();

        UI.closeConnectPanel();
    </script>

</body>
</html>
