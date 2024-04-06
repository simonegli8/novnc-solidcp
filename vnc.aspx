<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vnc.aspx.cs" Inherits="SolidCP.Providers.Virtualization.NoVNC.vnc" %>

<%= System.IO.File.ReadAllText(Server.MapPath("~/novnc/vnc.html")) %>

<head runat="server" visible="false" />
