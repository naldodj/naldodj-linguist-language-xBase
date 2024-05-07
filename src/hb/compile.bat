@echo off
cmd /c TASKKILL /F /IM  hb_source1.exe
call f:\minigui\batch\compile.bat hb_source1  %1 %2 %3 %4 %5 %6 %7 %8 %9
