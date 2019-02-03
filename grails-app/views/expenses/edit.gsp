<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'expenses.label', default: 'Expenses')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-expenses" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-expenses" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.expenses}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.expenses}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.expenses}" method="PUT">
                <g:hiddenField name="version" value="${this.expenses?.version}" />
                <!--
                <fieldset class="form">
                    <f:all bean="expenses"/>
                </fieldset>
-->
                
                <fieldset class="form">
                    <f:field bean="expenses" label="${message(code: 'orpakexpenses.date.label', default: 'Data:')}" property="expenseData"/>
                    <f:field bean="expenses" label="${message(code: 'orpakexpenses.category.label', default: 'Categoria:')}" property="expenseCategory"/>
                    <f:field bean="expenses" label="${message(code: 'orpakexpenses.value.label', default: 'Valor:')}" property="expenseValue"/>
                    <g:hiddenField name="username" value="${sec.loggedInUserInfo(field:'username')}" />
                </fieldset>
                
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
