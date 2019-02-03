package Orpak

class Expenses {
    String username
    Date expenseData
    String expenseCategory
    Float expenseValue

    static constraints = {
        expenseData(nullable:false)
        expenseCategory(blank:false,nullable:false, inList:["CONSUMO","EXTRAS","FINANCEIRAS","PESSOAL","REFEIÇÃO","TRANSPORTE","VESTUÁRIO"])
        expenseValue(nullable:false)
    }
    
    static mapping = {
        sort "expenseData"
    }   
}
