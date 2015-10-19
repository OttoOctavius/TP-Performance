package unq.tpi.persistencia.performanceEj.servicios;

import org.junit.Test

class ListadoDeptosTest extends BaseListadoTest {
	
	@Test
	def void testListadoDeptos() {
		val fileName = "./target/Deptos.csv"
		new ListadoDeptos(fileName).generarListado();
		this.assertListadoLength(11, fileName)
	}
	
}
