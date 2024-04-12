<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vnc.aspx.cs" Inherits="SolidCP.Providers.Virtualization.NoVNC.vnc"
	EnableTheming = "False" StylesheetTheme="" Theme="" %>
<%--<%= System.IO.File.ReadAllText(Server.MapPath("~/novnc/vnc.html")) %>--%>

<DOCTYPE html>
<html>
	<head runat="server">
		<tile></tile>
	</head>
	<body style="border:0;margin:0;padding:0;">
		<iframe ID="frame" runat="server" style="position: absolute; height: 100%; border: none; border:0;margin:0;padding:0;"/>
	</body>
</html>
