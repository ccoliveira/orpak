import Orpak.UserPasswordEncoderListener
import Orpak.CustomUserService
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    
    //userDetailsService(Orpak.CustomUserService)
}
