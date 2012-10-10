# Add installation of Google Tesseract 
class ocr {

  require setup

  package {
    'tesseract-ocr': ensure => latest;
  }

}
