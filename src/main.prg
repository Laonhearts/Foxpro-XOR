CLEAR

* 사용자로부터 입력 받기
lcMessage = GETSTRING("암호화할 메시지를 입력하세요:", "입력")

* XOR 암호화 키 정의 (임의로 예시로 7을 사용)
lnKey = 7

* 암호화된 결과를 저장할 변수 초기화
lcEncryptedMessage = ""

* 각 문자에 대해 XOR 암호화 수행
FOR lnIndex = 1 TO LEN(lcMessage)
    lcChar = SUBSTR(lcMessage, lnIndex, 1)
    lnEncryptedChar = ASC(lcChar) BITXOR lnKey
    lcEncryptedMessage = lcEncryptedMessage + CHR(lnEncryptedChar)
ENDFOR

* 암호화된 메시지 출력
? "암호화된 메시지:", lcEncryptedMessage

FUNCTION GETSTRING(tcPrompt, tcDefault)
    LOCAL lcInput
    ? tcPrompt, "[기본값: ", tcDefault, "]"
    lcInput = SPACE(50)
    @ 0, LEN(tcPrompt) + 3 GET lcInput
    IF EMPTY(lcInput)
        RETURN tcDefault
    ELSE
        RETURN RTRIM(lcInput)
    ENDIF
ENDFUNC
