package Orpak

import grails.gorm.services.Service

@Service(Expenses)
interface ExpensesService {

    Expenses get(Serializable id)

    List<Expenses> list(Map args)

    Long count()

    void delete(Serializable id)

    Expenses save(Expenses expenses)

}