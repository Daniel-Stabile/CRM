<%@ Page Title="Compensação manual" Language="C#" CodeFile="CompesacaoAdtoDev.aspx.cs" Inherits="aga_e_financeiro_CompesacaoAdtoDev" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
      <asp:Content ID="MainCompensacaoAdtoDev" ContentPlaceHolderID="Main" Runat="Server">

<wes:AjaxForm 
         runat="server" 
         ID="TV_COMPENSACAO_DOC_FORM" 
         Title="Compensação"
         BootstrapCols="12" 
         ShowTitle="True"
         CanDelete="True" 
         CanUpdate="True" 
         CanInsert="True"
         ChromeState="Normal" 
         IncludeRecordInRecentItems="True" 
         EntityViewName="TV_COMPESANCAODOCUMENTO.FORM"
         UserDefinedCommandsVisible="True" />
    
      </asp:Content>
    