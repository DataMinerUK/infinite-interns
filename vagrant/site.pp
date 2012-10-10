import 'manifests/*.pp'

node default {

  include devel
  include mysql
  include python
  include scientific
  include refine
  include mongodb
  include nodejs
  include ocr 

}
