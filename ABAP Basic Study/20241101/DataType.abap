*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 숫자를 문자열로 변환
*&---------------------------------------------------------------------*
REPORT ZTEST.

" Type을 지정해야함. 
" TYPE string 시 오류가 나 c로 지정함
" LENGTH를 주지 않았더니 *가 출력되어 출력 필드의 길이를 충분히 설정함
DATA: lv_number      TYPE i VALUE 123,
      lv_number_str  TYPE c LENGTH 10.

START-OF-SELECTION.
  WRITE lv_number TO lv_number_str.
  WRITE: / 'Number as String:', lv_number_str.



*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 문자열을 숫자로 변환
*&---------------------------------------------------------------------*
REPORT ZTEST.

DATA: lv_str         TYPE string VALUE '456',
      lv_number      TYPE i.

START-OF-SELECTION.
  " 직접할당을 통해 변환
  lv_number = lv_str.
  WRITE: / 'String to Number:', lv_number.


*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 날짜 문자열을 날짜 타입으로 변환
*&---------------------------------------------------------------------*
REPORT ZTEST.   

DATA: lv_date_str    TYPE string VALUE '20240510',
      lv_date        TYPE d.

START-OF-SELECTION.
  " ABAP의 날짜 타입(TYPE d)은 YYYYMMDD 형식으로 값을 저장
  lv_date = |{ lv_date_str+0(4) }{ lv_date_str+4(2) }{ lv_date_str+6(2) }|. 
  WRITE: / 'String to Date:', lv_date.



*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 문자열 대소문자 변환
*&---------------------------------------------------------------------*
REPORT ZTEST.

DATA: lv_original_string TYPE string VALUE 'Hello, ABAP!',
      lv_uppercase_string TYPE string,
      lv_lowercase_string TYPE string.

START-OF-SELECTION.
  " 문자열을 대소문자로 변환
  lv_uppercase_string = to_upper( lv_original_string ).

  lv_lowercase_string = to_lower( lv_original_string )..

  WRITE: / 'Original String:', lv_original_string.
  WRITE: / 'Uppercase String:', lv_uppercase_string.
  WRITE: / 'Lowercase String:', lv_lowercase_string .