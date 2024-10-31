*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 현재 날짜와 시간 출력
*&---------------------------------------------------------------------*
REPORT ZTEST.

DATA: lv_date TYPE sy-datum,
      lv_time TYPE sy-uzeit.

" 시스템 변수 SY-DATUM과 SY-UZEIT 사용
lv_date = sy-datum.
lv_time = sy-uzeit.

WRITE: / 'Current Date:', lv_date,
       / 'Current Time:', lv_time.