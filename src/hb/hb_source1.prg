#include "hbclass.ch"
#include "minigui.ch"

class Echo
    method MsgInfo(cMsg as character,cTitle as character)
end class

method MsgInfo(cMsg as character,cTitle as character) class Echo
    hb_Default(@cTitle,ProcName())
return(MsgInfo(cMsg,cTitle))

function Main()

    Echo():MsgInfo("Ola Mundo",ProcName())

    NamedParameters({"cTitle"=>ProcName(),"cMsg"=>"Ola Mundo"})
    NamedParameters({"cMsg"=>"Ola Mundo","cTitle"=>ProcName()})

    NamedParametersKey({"cTitle"=>ProcName()},{"cMsg"=>"Ola Mundo"})
    NamedParametersKey({"cMsg"=>"Ola Mundo"},{"cTitle"=>ProcName()})

    NamedParametersKey("Ola Mundo",ProcName())

return(nil)

static Function NamedParameters(hParameters as hash)
    local cMsg:=HB_HGETDEF(hParameters,"cMsg","") as character
    local cTitle:=HB_HGETDEF(hParameters,"cTitle",ProcName()) as character
return(Echo():MsgInfo(cMsg,cTitle))

static Function NamedParametersKey(cMsg as character,cTitle as character,...)

    local enum
    local Parameters

    FOR EACH Parameters IN hb_AParams(0)
        if (valType(Parameters)=="H")
            FOR EACH enum IN Parameters
                switch lower(enum:__enumKey())
                case "cmsg"
                    cMsg:=enum:__enumValue()
                    exit
                case "ctitle"
                    cTitle:=enum:__enumValue()
                    exit
                end switch
            NEXT EACH
       endif
    NEXT EACH

    hb_default(@cMsg,"")
    hb_default(@cTitle,ProcName())

return(Echo():MsgInfo(cMsg,cTitle))
