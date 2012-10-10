# Add installation of Google Tesseract 
class ocr {

  require apt

  package {
    'tesseract-ocr': ensure => latest;
  }

}
