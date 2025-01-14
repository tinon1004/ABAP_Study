*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*& TYPES와 DATA 비교
*&---------------------------------------------------------------------*

TYPES : BEGIN OF lty_list,
          carrid   TYPE scarr-carrid,
          connid   TYPE sflight-connid,
          fldate   TYPE sflight-fldate,
          carrname TYPE scarr-carrname,
          currency TYPE sflight-currency,
        END OF lty_list,

        ltt_list TYPE TABLE OF lty_list,   "table type
        lty_cap  TYPE zc220t0008,          "structure
        ltt_cap  TYPE TABLE OF lty_cap,    "table type
        ltt_caps TYPE TABLE OF zc220t0008, "table type
        lty_caps TYPE LINE OF ltt_cap2.    "structure

DATA : ls_list  TYPE lty_list,
       lt_list  LIKE TABLE OF ls_list,
       lt_data  LIKE lt_list,  "ITAB
       lt_data2 TYPE ltt_list, "ITAB
       ls_data  LIKE LINE OF lt_data,
       ls_data2 TYPE LINE OF ltt_list.