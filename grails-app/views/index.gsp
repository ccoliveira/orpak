<!DOCTYPE html>
    <html lang="pt_BR">
    <head>
        <meta name="layout" content="main"/>
        <title>ORPAK</title>
        <script src="https://unpkg.com/vue"></script>
    </head>

    <body>
        <div id="orpaklogin" class="row">
            <br />
            <sec:ifNotLoggedIn>
                
            <div class="col-md-4 offset-md-4 col-sm-8 offset-sm-2">           
                <form class="form-signin" action="${createLink(controller:'login', action:'authenticate')}" method="POST" id="loginForm" >
                    <div class="form-signin-heading">
                        <center>
                            <asset:image src="ORPAK-logo.png" class="profile-img"/>
                        </center>
                        <br />
                        <hr></hr>
                        <br />
                        <g:if test='${flash.message}'>
                            <div class="alert alert-danger">
                                ${flash.message}
                            </div>
                        </g:if>                            
                        <div class="input-group">
                            <span id="addon-user" class="input-group-addon">
                                <i class="glyphicon glyphicon-user"></i>
                            </span>
                            <input class="form-control" type="text" name="username" v-model="username" placeholder="${message(code: 'springSecurity.login.username', default:'Digite seu login')}" aria-describedby="addon-user">
                        </div>
                        <br />
                        <div class="input-group">
                            <span id="addon-password" class="input-group-addon">
                                <i class="glyphicon glyphicon-lock"></i>
                            </span>
                            <input class="form-control" type="password" name="password" v-model="password" placeholder="${message(code: 'springSecurity.login.password', default:'Digite sua senha')}" aria-describedby="addon-password">
                        </div>
                        <br />                        
                        <hr></hr>
                        <br />
                        <center>
                            <input class="btn btn-primary" type="submit" id="submit" v-bind:disabled="!isValidSubmit" value="${message(code: 'springSecurity.login.button', default:'Acessar Sistema')}"/>
                        </center>
                    </div>
                </form>
            </div>
            </sec:ifNotLoggedIn>
        </div>

        <footer class="orpakfooter">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 copyright">
                        <script type="text/javascript">
                        document.write(new Date().getFullYear());
                        </script>
                        © CPU INFORMÁTICA LTDA. All rights reserved.                
                    </div>
                </div>
            </div>
        </footer>
        
        <script>
            new Vue({
               el:"#orpaklogin",
               data: {
                  username:'',
                  password:''
               },
               
               computed: {            
                  isValidSubmit: function() {
                  return this.username != '' && this.password != ''
                  }
               }
            });            
            
            (function() {
                document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
            })();
        </script>
    </body>
</html>
