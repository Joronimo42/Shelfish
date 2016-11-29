<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="PrintableMediaSummary.aspx.vb" Inherits="Library_PrintableMediaSummary" %>


<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">



    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="650px">
        <LocalReport ReportPath="Reports\MediaDetails.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="MediaDisplay" Name="MediaDisplay" />
                <rsweb:ReportDataSource DataSourceId="PublisherByMediaID" 
                    Name="PublisherByMediaID" />
                <rsweb:ReportDataSource DataSourceId="SubjectByMediaID" 
                    Name="SubjectByMediaID" />
                <rsweb:ReportDataSource DataSourceId="CreatorByMediaID" 
                    Name="CreatorByMediaID" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="PublisherByMediaID" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ReportDataSetTableAdapters.PublisherByMediaIDTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="MediaDisplay" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ReportDataSetTableAdapters.MediaDisplayTableAdapter">
    </asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>



    <asp:ObjectDataSource ID="SubjectByMediaID" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ReportDataSetTableAdapters.SubjectByMediaIDTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="CreatorByMediaID" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ReportDataSetTableAdapters.CreatorByMediaIDTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>



</asp:Content>

