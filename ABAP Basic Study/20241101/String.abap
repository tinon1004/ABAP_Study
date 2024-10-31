*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 문자열 추출
*&---------------------------------------------------------------------*
REPORT ZTEST.

DATA: lv_original_string TYPE string VALUE 'Hello, ABAP world!',
      lv_cut_string      TYPE string.

START-OF-SELECTION.
  * string+n(m)은 n번째 위치부터 m자 추출
  lv_cut_string = lv_original_string+7(4). " 'ABAP' 부분만 추출
  WRITE: / 'Original String:', lv_original_string.
  WRITE: / 'Cut String:', lv_cut_string.

*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 문자열 합치기
*&---------------------------------------------------------------------*
REPORT ZTEST.

DATA: lv_first_string  TYPE string VALUE 'Hello, ',
      lv_second_string TYPE string VALUE 'ABAP!',
      lv_final_string  TYPE string. 

START-OF-SELECTION.
  * CONCATENATE 문자열 결합 명령어
  CONCATENATE lv_first_string lv_second_string INTO lv_final_string.

  WRITE: / 'First String:', lv_first_string.
  WRITE: / 'Second String:', lv_second_string.
  WRITE: / 'Final String:', lv_final_string.



*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 문자열을 잘라 뒤로 보내기1
*&---------------------------------------------------------------------*
REPORT ZTEST.

DATA: lv_string TYPE string VALUE 'SAP ABAP',
      lv_shifted_string TYPE string.

lv_shifted_string = lv_string+3.  " 왼쪽 3문자를 제외한 나머지를 추출
" 나머지 뒤에 앞 3문자를 붙임
" &&는 CONCATENATE와 동일한 기능. 보다 간단하게 문자열 연결 가능
lv_shifted_string = lv_shifted_string && lv_string(3).  


WRITE: / lv_shifted_string.


*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 문자열을 잘라 뒤로 보내기2
*&---------------------------------------------------------------------*
REPORT ZTEST.

DATA: lv_string TYPE string VALUE 'SAP ABAP',
      lv_temp   TYPE string.

lv_temp = lv_string+3.          " 3번째 자리 이후 문자열을 잘라서 lv_temp에 저장
CONCATENATE lv_temp lv_string(3) INTO lv_string. " 잘라낸 부분과 첫 3글자를 이어 붙임

WRITE: / lv_string.