*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& WHILE이용한 Loop 실습
*& - 최댓값을 입력받아 최댓값까지의 합을 출력
*&---------------------------------------------------------------------*
REPORT ZTEST.

PARAMETERS: p_max TYPE i DEFAULT 10.

DATA: lv_sum   TYPE i VALUE 0,
      lv_count TYPE i VALUE 1.

START-OF-SELECTION.
  WHILE lv_count <= p_max.
    lv_sum = lv_sum + lv_count.
    lv_count = lv_count + 1.
  ENDWHILE.

  WRITE: / 'The sum of numbers from 1 to', p_max, 'is', lv_sum.

*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& DO 이용한 Loop 실습
*&---------------------------------------------------------------------*
REPORT ZTEST.

REPORT ZDO_LOOP_REPORT.

PARAMETERS: p_times TYPE i DEFAULT 5.

START-OF-SELECTION.
  DO p_times TIMES.
    WRITE: / 'Hello, ABAP!'.
  ENDDO.


  
*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& Loop 실습
*&---------------------------------------------------------------------*
REPORT ZTEST.

* ty_employee 구조체 정의(id, name)
TYPES: BEGIN OF ty_employee,
         id   TYPE i,
         name TYPE string,
       END OF ty_employee.

* it_employees 내부 테이블과 작업 영역(wa_employee)을 선언
* wa_employee는 단일 직원 정보
* it_employees는 전체 직원 정보
DATA: it_employees TYPE TABLE OF ty_employee,
      wa_employee  TYPE ty_employee.

START-OF-SELECTION.

* 데이터 테이블에 직원 정보 추가
wa_employee-id = 1.
wa_employee-name = 'John Doe'.
APPEND wa_employee TO it_employees.

wa_employee-id = 2.
wa_employee-name = 'Jane Smith'.
APPEND wa_employee TO it_employees.

wa_employee-id = 3.
wa_employee-name = 'Sam Lee'.
APPEND wa_employee TO it_employees.

* LOOP 구문을 이용한 테이블 데이터 출력
LOOP AT it_employees INTO wa_employee.
  WRITE: / 'Employee ID:', wa_employee-id, 'Name:', wa_employee-name.
ENDLOOP.