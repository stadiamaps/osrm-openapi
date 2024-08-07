class TestFixture {
  companion object {
    fun loadAsset(fileName: String): String {
      val stream =
        this.javaClass.classLoader.getResource(fileName)?.openStream()
          ?: throw IllegalArgumentException("Asset not found: $fileName")
      return stream.bufferedReader().use { it.readText() }
    }
  }
}