import 'manifests/*.pp'

node default {

  require setup

  include ntp
  include devel
  include db
  include python
  include scientific

  include refine
  include mongodb
  include nodejs
  include ocr 

}