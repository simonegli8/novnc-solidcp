<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vnc.aspx.cs" Inherits="SolidCP.Providers.Virtualization.NoVNC.vnc"
	EnableTheming = "False" StylesheetTheme="" Theme="" %>
<%= System.IO.File.ReadAllText(Server.MapPath("~/novnc/vnc.html")) %>
