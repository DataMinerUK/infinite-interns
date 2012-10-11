# Add installation of Google Tesseract
class ocr {

  package {
    'tesseract-ocr': ensure => latest;
  }

}
