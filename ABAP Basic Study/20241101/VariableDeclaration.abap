*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTEST.

REPORT ZSIMPLE_VARIABLES.

* 변수 선언
DATA: v_string TYPE string,
      v_integer TYPE i,
      v_float TYPE f.

START-OF-SELECTION.

  v_string = 'Hello, ABAP!'.
  v_integer = 100.
  v_float = '3.14159'.

  WRITE: / 'String Variable: ', v_string.
  WRITE: / 'Integer Variable: ', v_integer.
  WRITE: / 'Floating Point Variable: ', v_float.