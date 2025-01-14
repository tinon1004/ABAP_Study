*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& SQL - Delete 
*&---------------------------------------------------------------------*
*& lt_list ITAB안에서 email field가 공백인 것을 삭제하기
*&---------------------------------------------------------------------*
DATA: BEGIN OF ls_list,
        id     TYPE scustom-id,
        name   TYPE scustom-name,
        form   TYPE scustom-form,
        street TYPE scustom-street,
        city   TYPE scustom-city,
        email  TYPE scustom-email,
      END OF ls_list,

      lt_list LIKE TABLE OF ls_list.

CLEAR   : ls_list.
REFRESH : lt_list.

SELECT id name form street city email
  INTO CORRESPONDING FIELDS OF TABLE lt_list
  FROM scustom
 WHERE id    >= '0000024'
   AND form  <> 'Firma'
   AND region = 'PA'.

IF sy-subrc <> 0.
  WRITE 'NO DATA FOUND'.
  STOP.
ENDIF.

LOOP AT lt_list INTO ls_list.

    IF ls_list-email IS INITIAL.
        Delete  lt_list INDEX sy-tabix.
    ENDIF.
    CONTINUE. 

ENDLOOP.

cl_demo_output=>display( lt_list ).