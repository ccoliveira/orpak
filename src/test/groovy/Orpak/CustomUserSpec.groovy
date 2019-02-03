package Orpak

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class CustomUserSpec extends Specification implements DomainUnitTest<CustomUser> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
