# OCR Infinite Intern
class infinite_interns::box::ocr {

  package {
    'tesseract-ocr': ensure => latest;
  }

}
