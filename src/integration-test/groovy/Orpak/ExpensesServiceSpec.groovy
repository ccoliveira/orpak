package Orpak

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ExpensesServiceSpec extends Specification {

    ExpensesService expensesService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Expenses(...).save(flush: true, failOnError: true)
        //new Expenses(...).save(flush: true, failOnError: true)
        //Expenses expenses = new Expenses(...).save(flush: true, failOnError: true)
        //new Expenses(...).save(flush: true, failOnError: true)
        //new Expenses(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //expenses.id
    }

    void "test get"() {
        setupData()

        expect:
        expensesService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Expenses> expensesList = expensesService.list(max: 2, offset: 2)

        then:
        expensesList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        expensesService.count() == 5
    }

    void "test delete"() {
        Long expensesId = setupData()

        expect:
        expensesService.count() == 5

        when:
        expensesService.delete(expensesId)
        sessionFactory.currentSession.flush()

        then:
        expensesService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Expenses expenses = new Expenses()
        expensesService.save(expenses)

        then:
        expenses.id != null
    }
}
