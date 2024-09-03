import com.osrm.api.models.RouteResponse
import kotlin.test.Test
import com.osrm.api.models.Waypoint
import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.fail

class ModelTest {

  private val moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()

  @Test
  fun testWaypoint() {
    val waypoint = Waypoint(listOf(1.0, 2.0),  42.0,"name")
    assertEquals("name", waypoint.name)
    assertEquals(listOf(1.0, 2.0), waypoint.location)
  }

  @Test
  fun testDecode() {
    val jsonData = TestFixture.loadAsset("route.json")
    val response = moshi.adapter(RouteResponse::class.java).fromJson(jsonData)

    assertNotNull(response?.routes)
    assertEquals(RouteResponse.Code.Ok, response?.code)

    val route = response?.routes?.first() ?: fail("response must have at least one route")

    assertEquals(1, route.legs.size)
    assertEquals(4, route.legs.first().steps.size)

    val step = route.legs.first().steps.first()

    assertEquals("State Highway 65", step.name)
    assertEquals("tezuoAezllgIfhAdStpAzV`hAxQlxA|X|i@vIdQpCnxClh@laCjd@dRdDr}@zOxgApR`pBf^jk@hKvmAnUfJ|AdDj@tCR", step.geometry)
  }
}
