*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& 테이블 정렬
*&---------------------------------------------------------------------*
REPORT ZTEST.

TYPES: BEGIN OF ty_employee,
         name  TYPE string,  " 직원 이름
         age   TYPE i,       " 나이
         dept  TYPE string,  " 부서
       END OF ty_employee.

" 내부 테이블 정의 & 자동으로 키를 생성하도록 지정
TYPES tt_employees TYPE STANDARD TABLE OF ty_employee WITH DEFAULT KEY.

DATA: lt_employees TYPE tt_employees,
      lv_employee TYPE ty_employee. " 여기서 lv_employee를 한번만 선언.
" 한 번 선언된 변수는 동일한 블록 내에서 여러 번 사용이 가능하지만, 같은 이름으로 다시 선언이

" 직원 데이터 추가
lt_employees = VALUE #(
  ( name = '홍길동' age = 30 dept = '개발' )
  ( name = '김영희' age = 45 dept = '인사' )
  ( name = '이철수' age = 28 dept = '마케팅' )
  ( name = '박수미' age = 36 dept = '개발' )
).

" 나이순으로 오름차순 정렬
SORT lt_employees BY age ASCENDING.
" 오름차순 정렬 결과 출력
LOOP AT lt_employees INTO lv_employee.
  WRITE: / 'Ascending Order:', lv_employee-name, lv_employee-age, lv_employee-dept.
ENDLOOP.

" 나이순으로 내림차순 정렬
SORT lt_employees BY age DESCENDING.
" 내림차순 정렬 결과 출력
LOOP AT lt_employees INTO lv_employee.
  WRITE: / 'Descending Order:', lv_employee-name, lv_employee-age, lv_employee-dept.
ENDLOOP.