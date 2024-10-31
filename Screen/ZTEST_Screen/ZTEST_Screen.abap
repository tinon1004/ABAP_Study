*&---------------------------------------------------------------------*
*& Report ZTEST_Screen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTEST_Screen.

" 텍스트 필드 입력
SELECTION-SCREEN BEGIN OF BLOCK part1 WITH FRAME TITLE text-001.
PARAMETERS field(10) TYPE c OBLIGATORY.
SELECTION-SCREEN END OF BLOCK part1.

" 가변 길이 필드
SELECTION-SCREEN BEGIN OF BLOCK part2 WITH FRAME TITLE text-002.
PARAMETERS: p1(10) TYPE c VISIBLE LENGTH 1,
            p2(10) TYPE c VISIBLE LENGTH 5,
            p3(10) TYPE c VISIBLE LENGTH 10.
SELECTION-SCREEN END OF BLOCK part2.
.
" 체크 박스
SELECTION-SCREEN BEGIN OF BLOCK part3 WITH FRAME TITLE text-003.
PARAMETERS: a AS CHECKBOX USER-COMMAND flag,
            b AS CHECKBOX DEFAULT 'X' USER-COMMAND flag.
SELECTION-SCREEN END OF BLOCK part3.

" 라디오 버튼
SELECTION-SCREEN BEGIN OF BLOCK part4 WITH FRAME TITLE text-004.
PARAMETERS: r1 RADIOBUTTON GROUP rad1,
            r2 RADIOBUTTON GROUP rad1 DEFAULT 'X',
            r3 RADIOBUTTON GROUP rad1,

            s1 RADIOBUTTON GROUP rad2,
            s2 RADIOBUTTON GROUP rad2,
            s3 RADIOBUTTON GROUP rad2 DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK part4.

" 리스트 박스
SELECTION-SCREEN BEGIN OF BLOCK part5 WITH FRAME TITLE text-005.
PARAMETERS p_carrid TYPE spfli-carrid
                    AS LISTBOX VISIBLE LENGTH 20
                    DEFAULT 'LH'.
SELECTION-SCREEN END OF BLOCK part5.