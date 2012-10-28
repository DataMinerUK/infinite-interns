# Coordinate an Infinite Intern installation
class infinite_interns {
  require common::init
  include "box::${::hostname}"
}
