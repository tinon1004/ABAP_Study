*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 산술 연산자(사칙연산)
*&---------------------------------------------------------------------*
REPORT ZTEST.

DATA: lv_addition       TYPE i,
      lv_subtraction    TYPE i,
      lv_multiplication TYPE i,
      lv_division       TYPE f.

DATA: lv_num1 TYPE i VALUE 20,
      lv_num2 TYPE i VALUE 10.

START-OF-SELECTION.

  " 덧셈
  lv_addition = lv_num1 + lv_num2.
  WRITE: / 'Addition:', lv_addition.

  " 뺄셈
  lv_subtraction = lv_num1 - lv_num2.
  WRITE: / 'Subtraction:', lv_subtraction.

  " 곱셈
  lv_multiplication = lv_num1 * lv_num2.
  WRITE: / 'Multiplication:', lv_multiplication.

  " 나눗셈 (결과를 부동 소수점으로 처리)
  " 0이 아닐때만 실행 가능하게 하여 오류 방지
  " <>는 값이 둘다 아닐 때 사용
  IF lv_num2 <> 0.
    lv_division = lv_num1 / lv_num2.
    WRITE: / 'Division:', lv_division.
  ELSE.
    WRITE: / 'Division by zero error'.
  ENDIF.




*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 비교 연산자
*&---------------------------------------------------------------------*
REPORT ZTEST.

DATA: lv_value1 TYPE i VALUE 100,
      lv_value2 TYPE i VALUE 50.

START-OF-SELECTION.

  " 동등 비교
  IF lv_value1 = lv_value2.
    WRITE: / 'Value1 is equal to Value2'.
  ELSE.
    WRITE: / 'Value1 is not equal to Value2'.
  ENDIF.

  " 크기 비교
  IF lv_value1 > lv_value2.
    WRITE: / 'Value1 is greater than Value2'.
  ELSEIF lv_value1 < lv_value2.
    WRITE: / 'Value1 is less than Value2'.
  ELSE.
    WRITE: / 'Value1 is equal to Value2'.
  ENDIF.

  " 부등 비교
  IF lv_value1 <> lv_value2.
    WRITE: / 'Value1 is not equal to Value2'.
  ELSE.
    WRITE: / 'Value1 is equal to Value2'.
  ENDIF.





*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 논리 연산자
*&---------------------------------------------------------------------*
REPORT ZTEST.

PARAMETERS: p_age TYPE i,
            p_status TYPE c LENGTH 1.

DATA: lv_message TYPE string.

START-OF-SELECTION.

  " 논리적 AND 연산
  IF p_age >= 18 AND p_status = 'S'.
    lv_message = 'You are eligible for the scholarship.'.
  ELSE.
    lv_message = 'You are not eligible for the scholarship.'.
  ENDIF.
  WRITE: / lv_message.

  " 논리적 OR 연산
  IF p_age < 18 OR p_status <> 'S'.
    lv_message = 'You do not meet one or more requirements.'.
  ELSE.
    lv_message = 'You meet all the requirements.'.
  ENDIF.
  WRITE: / lv_message.

  " 논리적 NOT 연산
  IF NOT p_age < 18.
    lv_message = 'You are 18 years old or older.'.
  ELSE.
    lv_message = 'You are younger than 18.'.
  ENDIF.
  WRITE: / lv_message.