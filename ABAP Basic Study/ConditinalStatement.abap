*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& CASE문 실습
*&---------------------------------------------------------------------*
REPORT ZTEST.

* PARAMETERS로 입력받기- -> p_option 변수에 저장
PARAMETERS: p_option TYPE i DEFAULT 1.

START-OF-SELECTION.
  CASE p_option.
    WHEN 1.
      WRITE: / 'You selected option 1.'.
    WHEN 2.
      WRITE: / 'You selected option 2.'.
    WHEN OTHERS.
      WRITE: / 'Invalid option selected.'.
  ENDCASE.



*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& IF, ELSEIF 실습
*&---------------------------------------------------------------------*
REPORT ZTEST.
  
PARAMETERS: p_number TYPE i.

START-OF-SELECTION.
  IF p_number > 0.
    WRITE: / 'The number is positive.'.
  ELSEIF p_number < 0.
    WRITE: / 'The number is negative.'.
  ELSE.
    WRITE: / 'The number is zero.'.
  ENDIF.