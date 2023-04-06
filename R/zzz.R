.onAttach <- function(libname, pkgname) {
  extrafont::loadfonts(quiet = T)
}

.onLoad <- function(libname, pkgname) {
  extrafont::loadfonts(quiet = T)
}
