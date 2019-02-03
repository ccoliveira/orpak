<!DOCTYPE html>
    <html lang="pt_BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <asset:link rel="icon" href="logo16x16.png" type="image/x-ico" />
          
        <!--BootStrap-->
        <asset:stylesheet src="bootstrap.css"/>
        
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="orpak.css"/>
      
        <title>
            <g:layoutTitle default="ORPAK"/>
        </title>

        <!-- jQuery -->
        <asset:javascript src="jquery-2.2.0.min.js"/>
    
        <!-- Bootstrap Core JavaScript -->
        <asset:javascript src="bootstrap.js"/>

        <asset:javascript src="controlled/${controllerName}/${actionName}.js"/>

        <g:layoutHead/>
    </head>
    
    <body>
        <div class="container-fluid">
            <!-- Header: Wellcome and Language -->
            <div class="col-xs-6">                    
                <sec:ifLoggedIn>
                    <span class="wellcome-message">${message(code: 'orpak.welcome', default:'Bem vindo, ')}<b><sec:loggedInUserInfo field="username"/></b></span>                                                    
                </sec:ifLoggedIn>
            </div>
                
            <div class="col-xs-6 orpakborder">
                <span>
                    <g:link controller="${params.controller}" action="${params.action}" params="[lang:'pt_BR']">
                        <asset:image width="30" height="30" align="right" src="bralogo.jpg" title="${message(code: 'orpakmenu.language.pt', default:'Português')}" class="profile-img"/>
                        </g:link>
                </span>
                <span>
                    <g:link controller="${params.controller}" action="${params.action}" params="[lang:'en']" class="menuButton">
                        <asset:image width="30" height="30" align="right" src="inglogo.jpg" title="${message(code: 'orpakmenu.language.en', default:'Inglês')}" class="profile-img"/>
                    </g:link>
                </span>
                <span>
                    <g:link controller="${params.controller}" action="${params.action}" params="[lang:'es']" class="menuButton">
                        <asset:image width="30" height="30" align="right" src="esplogo.jpg" title="${message(code: 'orpakmenu.language.es', default:'Espanhol')}" class="profile-img"/>
                    </g:link>
                </span>
            </div>                                                                                                                          
        </div>

        <!-- Header: Logo and Main Nav -->                            
        <nav class="navbar navbar-expand-lg navbar-light orpakheader">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#nav_menuorpak">
                <span class="navbar-toggler-icon"></span>
            </button>

            <a class="navbar-brand" href="https://www.orpak.com/" title="ORPAK">
                <asset:image src="ORPAK-logo.png" />
            </a>
                
            <div class="collapse navbar-collapse" id="nav_menuorpak">
                <sec:ifLoggedIn>
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(controller: 'Expenses')}">${message(code: 'orpakmenu.menu.expenses', default:'Despesas')}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(controller: 'logout')}">${message(code: 'orpakmenu.menu.logout', default:'Sair')}</a>
                        </li>
                    </ul> 
                </sec:ifLoggedIn>                                          
            </div>
        </nav>

        <div class="wrapper orpaklw">
            <g:layoutBody/>
        </div>
    </body>
</html>
