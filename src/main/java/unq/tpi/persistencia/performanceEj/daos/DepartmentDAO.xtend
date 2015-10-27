package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Department
import unq.tpi.persistencia.util.SessionManager

class DepartmentDAO {

	def getByName(String name) {
		val session = SessionManager.getSession()
		session.createQuery("from Department where name = :name")
				.setParameter("name", name).uniqueResult() as Department
	}

	def getByCode(String num) {
		val session = SessionManager.getSession()
		session.get(Department, num) as Department
	}

	def getByCodeOpt(String num) {
		val session = SessionManager.getSession()
		session.createQuery(
		'''
			from Department dpt join fetch dpt.employees emp join fetch
			 emp.titles titles join fetch emp.salaries sal 
			 where dpt.code = :code and sal.to = '9999-01-01'
		''')
		.setParameter("code",num).uniqueResult() as Department

	}
	
	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Department).list() as List<Department>
	}
	
}