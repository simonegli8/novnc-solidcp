<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vnc.aspx.cs" Inherits="SolidCP.Providers.Virtualization.NoVNC.vnc"
	EnableTheming = "False" StylesheetTheme="" Theme="" %>
<DOCTYPE html>
<html>
	<head runat="server">
		<tile></tile>
		<asp:Literal ID="headHtml" runat="server" />
	</head>
	<body style="border:0;margin:0;padding:0;">
		<%!--<iframe ID="frame" runat="server" style="position: absolute; width: 100%; height: 100%; border: none; border:0;margin:0;padding:0;"/>--%>
		<asp:Literal ID="bodyHtml" runat="server" />
	</body>
</html>
