package Orpak

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = false)
class ExpensesController {

    ExpensesService expensesService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond expensesService.list(params), model:[expensesCount: expensesService.count()]
    }

    def show(Long id) {
        respond expensesService.get(id)
    }

    def create() {
        respond new Expenses(params)
    }

    def save(Expenses expenses) {
        if (expenses == null) {
            notFound()
            return
        }

        try {
            expensesService.save(expenses)
        } catch (ValidationException e) {
            respond expenses.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'expenses.label', default: 'Expenses'), expenses.id])
                redirect expenses
            }
            '*' { respond expenses, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond expensesService.get(id)
    }

    def update(Expenses expenses) {
        if (expenses == null) {
            notFound()
            return
        }

        try {
            expensesService.save(expenses)
        } catch (ValidationException e) {
            respond expenses.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'expenses.label', default: 'Expenses'), expenses.id])
                redirect expenses
            }
            '*'{ respond expenses, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        expensesService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'expenses.label', default: 'Expenses'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'expenses.label', default: 'Expenses'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
