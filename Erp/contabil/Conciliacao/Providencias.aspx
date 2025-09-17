<%@ Page Title="Conciliação Chat" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    
    <div class="col-md-12">
        <ul class="chats">

                    <li class="out">
                        <div class="message">
                            <span class="arrow"> </span>
                            <a href="javascript:;" class="name"> Alessandro </a>
                            <span class="datetime"> as 10:11 </span>
                            <span class="body"> Está com problema neste registro. </span>
                        </div>
                    </li>

                    <li class="out">
                        <div class="message">
                            <span class="arrow"> </span>
                            <a href="javascript:;" class="name"> Alessandro </a>
                            <span class="datetime"> as 10:12 </span>
                            <span class="body"> Teria como verificar? </span>
                        </div>
                    </li>

                    <li class="in">
                        <div class="message">
                            <span class="arrow"> </span>
                            <a href="javascript:;" class="name"> Tamiris </a>
                            <span class="datetime"> as 10:18 </span>
                            <span class="body"> Corrigi agora, tenta denovo. </span>
                        </div>
                    </li>

                    <li class="out">
                        <div class="message">
                            <span class="arrow"> </span>
                            <a href="javascript:;" class="name"> Alessandro </a>
                            <span class="datetime"> as 10:18 </span>
                            <span class="body"> Obrigado! </span>
                        </div>
                    </li>

                </ul>
    </div>


      </asp:Content>
    