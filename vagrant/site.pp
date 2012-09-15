import "manifests/*.pp"

node default {

  require apt
  
  include mysql
  include python
  include scientific 
  
}
