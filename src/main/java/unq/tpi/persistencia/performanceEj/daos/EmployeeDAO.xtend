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
	
	def getTenFirst(){
		val session = SessionManager.getSession()
		session.createQuery(
		'''
			select s.employee from Salary s 
			where s.to = '9999-01-01' order by s.amount
		''').setMaxResults(10).list as List<Employee>
	}

	def getByCode(int id) {
		val session = SessionManager.getSession()
		session.createQuery(
		'''
			from Employee e where e.id = «id»
		''').uniqueResult() as Employee
	}

}