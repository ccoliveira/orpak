package orpak

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority

class CustomUser extends GrailsUser {
    
    final String name
    final String email

    CustomUser(String username, 
                         String password, 
                         boolean enabled,
                         boolean accountNonExpired, 
                         boolean credentialsNonExpired,
                         boolean accountNonLocked,
                         Collection<GrantedAuthority> authorities,
                         long id, 
                         String name,
                         String email) {
     
        super(username, password, enabled, accountNonExpired,
              credentialsNonExpired, accountNonLocked, authorities, id)

        this.name = name
        this.email = email
   }
}
