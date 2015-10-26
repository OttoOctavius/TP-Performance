package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Employee
import unq.tpi.persistencia.util.SessionManager

class EmployeeDAO {

	def getByName(String name, String lastName) {
		val session = SessionManager.getSession()
		session.createQuery("from Employee where firstName = :name and lastName = :lastName")
				.setParameter("name", name)
				.setParameter("lastName", lastName)
				.uniqueResult() as Employee
	}

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Employee).list() as List<Employee>
	}

	def getByCode(int id) {
		val session = SessionManager.getSession()
		session.load(Employee, id) as Employee
	}
	
	def getMaxSalarios(){
		val session = SessionManager.getSession()
		session.createQuery("from Employee emp fetch emp.salary order by emp.getSalary desc").iterate
		//"with emp.salaries[ maxindex(emp.salaries) ] order by emp.salaries desc"
	}

/**
 * Note that these constructs - size, elements, indices, minindex, maxindex, minelement, maxelement - may only be used in the where clause in Hibernate3.
 * select item from Item item, Order order
where order.items[ maxindex(order.items) ] = item and order.id = 11
The expression inside [] may even be an arithmetic expression.

select item from Item item, Order order
where order.items[ size(order.items) - 1 ] = item
 */
}
