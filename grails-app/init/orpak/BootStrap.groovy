package orpak

import Orpak.Role
import Orpak.User
import Orpak.UserRole

class BootStrap {

    def init = { servletContext ->
        def role_admin = Role.findByAuthority('ROLE_ADMIN')
        def role_user = Role.findByAuthority('ROLE_USER')
        
        if (!role_admin) {
            role_admin = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        }
        else {
            role_user = new Role(authority: 'ROLE_USER').save(flush: true)
        }
        
        def useradmin = User.findByUsername('admin')
        if (!useradmin) {
            useradmin = new User(username: 'admin', 
                                 password: 'admin',
                                 name: 'Administrator',
                                 email: 'cpuinfo@cpuinfo.com.br',
                                 //enabled: true, 
                                 accountExpired: false, 
                                 accountLocked: false, 
                                 passwordExpired: false).save(flush: true)
        }
        
        if (UserRole.findByUserAndRole(useradmin,role_admin) == null) {
            UserRole.create useradmin, role_admin
        }

        UserRole.withSession {
                it.flush()
                it.clear()
        }
    }
    def destroy = {
    }
}
