DECLARE FUNCTION byte$ (num%)
DECLARE FUNCTION nospc$ (a$)


'init
CLS
COLOR 15
PRINT "File Bytes"
COLOR 7
PRINT "----------"
PRINT

'get details
COLOR 14
INPUT "File name"; fsrc$
PRINT


'open file
OPEN "B", #1, fsrc$
length& = LOF(1)
DIM fileByte AS STRING * 1
PRINT "File size = "; length&; " bytes"
PRINT

'get all bytes
FOR i& = 1 TO length&

k$ = ""
WHILE k$ = ""
k$ = INKEY$
WEND
IF k$ = CHR$(27) THEN EXIT FOR

'get byte
GET #1, , fileByte
byt% = ASC(fileByte)

'display
COLOR 7
PRINT "["; i&; "]",
COLOR 14
IF byt% >= 32 THEN PRINT fileByte,  ELSE PRINT "...",
COLOR 13
PRINT byt%,
COLOR 12
PRINT HEX$(byt%); "h",
COLOR 11
PRINT byte$(byt%); " b"

NEXT

CLS
CLOSE #1
COLOR 7
SYSTEM

FUNCTION byte$ (num%)

n% = num%
FOR i% = 1 TO 8
IF (n% AND 1) > 0 THEN a$ = "1" + a$ ELSE a$ = "0" + a$
n% = n% \ 2
NEXT

byte$ = LEFT$(a$, 4) + " " + RIGHT$(a$, 4)
END FUNCTION

FUNCTION nospc$ (a$)
b$ = ""
FOR i = 1 TO LEN(a$)
c$ = MID$(a$, i, 1)
IF (c$ <> " ") THEN b$ = b$ + c$
NEXT
nospc$ = b$
END FUNCTION

