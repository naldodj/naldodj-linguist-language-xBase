#include "hbclass.ch"

class Echo
    method MsgInfo(cMsg as character,cTitle as character)
end class

method MsgInfo(cMsg as character,cTitle as character) class Echo
    hb_Default(@cTitle,ProcName())
return(MsgInfo(cMsg,cTitle))

function Main()
return(Echo():MsgInfo("Ola Mundo",ProcName()))