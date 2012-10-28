import 'manifests/*.pp'

node mysql {
  include common
  include mysql
}

node python {
  include common
  include python
}

node scientific {
  include common
  include scientific
}

node refine {
  include common
  include refine
}

node mongodb {
  include common
  include mongodb
}

node nodejs {
  include common
  include nodejs
}

node ocr {
  include common
  include ocr 
}