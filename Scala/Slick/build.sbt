val scala3Version = "3.4.1"

lazy val root = project
  .in(file("."))
  .settings(
    name := "sample",
    version := "0.1.0-SNAPSHOT",

    scalaVersion := scala3Version,

    libraryDependencies ++= Seq(
      "org.scalameta" %% "munit" % "0.7.29" % Test,
      "com.typesafe.slick" %% "slick" % "3.5.1",
      "com.typesafe.slick" %% "slick-hikaricp" % "3.5.1",
      "org.slf4j" % "slf4j-simple" % "2.0.13" % Test,
      "org.xerial" % "sqlite-jdbc" % "3.39.2.1",
    ),
  )


