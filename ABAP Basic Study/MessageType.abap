REPORT zc220_note_0114 MESSAGE-ID zc220m.

* `S` 와 `I`  사용할 땐 `TYPE`만 사용하고, `W` 나 `E` 를 사용할 땐 `DISPLAY LIKE`를 함께 사용한다.

* 기본 형식
MESSAGE 'data not found' TYPE 'S'
MESSAGE 'data not found' TYPE 'E'.
MESSAGE 'data not found' TYPE 'W'.
MESSAGE 'data not found' TYPE 'S' DISPLAY LIKE 'E'.

*실무용
REPORT zc220_note_0114 MESSAGE-ID zc220m.


* MEESSAGE <TYPE> <MSG번호> WITH '메시지'

* &1 &2 does not exist
MESSAGE S003 WITH 'data' . "S: data does not exist

* & & & &
MESSAGE S000 WITH 'AIRLINE' 'data' . "S: AIRLINE data