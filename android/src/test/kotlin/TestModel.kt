import kotlin.test.Test
import com.osrm.api.models.Waypoint
import kotlin.test.assertEquals

class ModelTest {
  @Test
  fun testWaypoint() {
    val waypoint = Waypoint("name", listOf(1.0, 2.0))
    assertEquals("name", waypoint.name)
    assertEquals(listOf(1.0, 2.0), waypoint.location)
  }
}
