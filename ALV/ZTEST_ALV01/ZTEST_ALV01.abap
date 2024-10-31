*&---------------------------------------------------------------------*
*& Report ZTEST_ALV01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTEST_ALV01.

TABLES:     scarr. "테이블 선언

TYPE-POOLS: slis.  "ALV Declarations
"TYPE-POOLS는 alv 그리드에 필요한 다양한 데이터 타입과 구조 정의

*Data Declarations
*----------------
TYPES: BEGIN OF t_scarr,
  mandt TYPE scarr-mandt,
  carrid TYPE scarr-carrid,
  carrname TYPE scarr-carrname,
  currcode TYPE scarr-currcode,
  url TYPE scarr-url,
 END OF t_scarr.

" 내부 테이블 it_scarr 이용해 항공사 정보 저장
" wa_scarr 단일 행 저장
DATA: it_scarr TYPE STANDARD TABLE OF t_scarr INITIAL SIZE 0,
      wa_scarr TYPE t_scarr.

*ALV data Declarations
" ALV를 표시하기 위한 필드 카탈로그, 그룹, 레이아웃, 프로그램 ID를 위한 변수를 선언
DATA: fieldcatalog TYPE slis_t_fieldcat_alv WITH HEADER LINE,
      gd_tab_group TYPE slis_t_sp_group_alv,
      gd_layout    TYPE slis_layout_alv,
      gd_repid     LIKE sy-repid.


DATA : t TYPE slis_t_sp_group_alv .
************************************************************************
*Start-of-selection.
" 데이터 검색, 필드 카탈로그 구축, 레이아웃 설정, ALV 리포트 표시를 수행하는 서브루틴을 호출
START-OF-SELECTION.

  PERFORM data_retrieval.
  PERFORM build_fieldcatalog.
  PERFORM build_layout.
  PERFORM display_alv_report.


*&---------------------------------------------------------------------*
*&      Form  BUILD_FIELDCATALOG
*&---------------------------------------------------------------------*
*       Build Fieldcatalog for ALV Report
*----------------------------------------------------------------------*
* 목적: 
*   ALV 그리드에서 사용될 필드 카탈로그를 구축하여 각 열의 속성을 정의   
* 작동 방식: 
*   각 필드에 대해 fieldcatalog 구조체에 필드 이름, 설명, 열 위치, 출력 길이를 설정
*   APPEND 명령어를 사용하여 설정한 필드를 필드 카탈로그에 추가
*   각 필드의 설정이 완료되면 CLEAR 명령어로 fieldcatalog 구조체를 초기화하여 다음 필드를 준비
* 결과: 
*   모든 필드의 메타데이터가 fieldcatalog에 저장되어 ALV 그리드에서 어떻게 표시될지 정의
*----------------------------------------------------------------------*
" ALV에서 사용할 필드 카탈로그를 설정
" 각 필드에 대한 정보(필드 이름, 설명, 출력 길이 등)를 정의하고 fieldcatalog에 추가
FORM build_fieldcatalog.

  fieldcatalog-fieldname   = 'MANDT'.
  fieldcatalog-seltext_m   = 'Client'.
  fieldcatalog-col_pos     = 0.
  fieldcatalog-outputlen   = 10.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'CARRID'.
  fieldcatalog-seltext_m   = 'Airline Code'.
  fieldcatalog-col_pos     = 1.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'CARRNAME'.
  fieldcatalog-seltext_m   = 'Airline name'.
  fieldcatalog-col_pos     = 2.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'CURRCODE'.
  fieldcatalog-seltext_m   = 'Airline name'.
  fieldcatalog-col_pos     = 3.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'CURRCODE'.
  fieldcatalog-seltext_m   = 'Local currency of airline'.
  fieldcatalog-col_pos     = 4.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'URL'.
  fieldcatalog-seltext_m   = 'Airline URL'.
  fieldcatalog-col_pos     = 5.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

ENDFORM.    " BUILD_FIELDCATALOG


*&---------------------------------------------------------------------*
*&      Form  BUILD_LAYOUT
*&---------------------------------------------------------------------*
*       Build layout for ALV grid report
*----------------------------------------------------------------------*
* 목적: 
*   ALV 그리드의 레이아웃을 설정하여 시각적 표현을 최적화 
* 작동 방식: 
*   gd_layout 구조체의 각 필드에 'X' 값을 설정하여 특정 기능을 활성화
* 결과: 
*   ALV 출력의 시각적 레이아웃이 설정
*----------------------------------------------------------------------*
" ALV 리포트의 레이아웃을 설정
" 'X'는 활성화를 의미
FORM build_layout.

  gd_layout-no_input          = 'X'. "사용자가 데이터를 수정할 수 없도록 설정
  gd_layout-colwidth_optimize = 'X'. "열 너비를 최적화
  gd_layout-zebra = 'X'.    " 줄을 번갈아 가며 색칠
*  gd_layout-info_fieldname =      'LINE_COLOR'.
*  gd_layout-def_status = 'A'.

ENDFORM.                    " BUILD_LAYOUT


*&---------------------------------------------------------------------*
*&      Form  DISPLAY_ALV_REPORT
*&---------------------------------------------------------------------*
*       Display report using ALV grid
*----------------------------------------------------------------------*
* 목적: 
*   ALV 그리드를 화면에 표시하여 사용자가 데이터를 볼 수 있도록 함
* 작동 방식: 
*   현재 프로그램의 ID를 gd_repid에 저장
*   REUSE_ALV_GRID_DISPLAY 함수를 호출하여 ALV 그리드를 생성 (매개변수 전달)
* 결과: 
*   ALV 그리드가 화면에 표시되고, 사용자는 항공사 정보를 쉽게 조회
*   오류가 발생하면 sy-subrc 값에 따라 예외 처리 코드가 실행
*----------------------------------------------------------------------*
" ALV 그리드를 화면에 표시하는 기능을 호출
" i_callback_program에 현재 프로그램 ID를 설정하고, 구성된 레이아웃과 필드 카탈로그를 사용하여 ALV를 표시
FORM display_alv_report.
  gd_repid = sy-repid.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = gd_repid
      is_layout          = gd_layout
      it_fieldcat        = fieldcatalog[]
      i_save             = 'X'
    TABLES
      t_outtab           = it_scarr
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.


ENDFORM.                    " DISPLAY_ALV_REPORT


*&---------------------------------------------------------------------*
*&      Form  DATA_RETRIEVAL
*&---------------------------------------------------------------------*
*       Retrieve data form EKPO table and populate itab it_ekko
*----------------------------------------------------------------------*
* 목적: 
*   scarr 테이블에서 항공사 정보를 검색하여 내부 테이블인 it_scarr에 저장   
* 작동 방식: 
*   SELECT 문을 사용하여 mandt, carrid, carrname, currcode, url 필드를 선택
*   선택된 데이터는 it_scarr라는 내부 테이블에 저장
* 결과: 
*   it_scarr 내부 테이블에 scarr 테이블의 데이터가 로드되어 ALV 리포트에서 사용할 준비완료
*----------------------------------------------------------------------*
" scarr 테이블에서 항공사 정보를 선택해 it_scarr 내부 테이블에 저장
FORM data_retrieval.
  DATA: ld_color(1) TYPE c.

  SELECT mandt carrid carrname currcode url
*   UP TO 10 ROWS 데이터베이스에서 최대 10개의 행(Row)만을 선택하도록 제한하는 의미
    FROM scarr
    INTO TABLE it_scarr.

ENDFORM.                    " DATA_RETRIEVAL