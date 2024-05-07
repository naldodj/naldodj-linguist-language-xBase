#include "hbclass.ch"

class Echo
    method MsgInfo(cMsg as character,cTitle as character)
end class

method MsgInfo(cMsg as character,cTitle as character) class Echo
    hb_Default(@cTitle,ProcName())
return(MsgInfo(cMsg,cTitle))

function Main()
    Echo():MsgInfo("Ola Mundo",ProcName())
    NamedParameters({"cTitle"=>ProcName(),"cMsg"=>"Ola Mundo"})
return(nil)

static Function NamedParameters(hParameters as hash)
    local cMsg:=HB_HGETDEF(hParameters,"cMsg","") as character
    local cTitle:=HB_HGETDEF(hParameters,"cTitle",ProcName()) as character
return(Echo():MsgInfo(cMsg,cTitle))
