@echo off
set zip="tools\7za.exe"
set hour=%time:~0,2%
if "%time:~0,1%"==" " set hour=0%time:~1,1%
set dt=%date:~10,4%-%date:~4,2%-%date:~7,2%_%hour%%time:~3,2%
set dir=ss14-%dt%
mkdir %dir%
mkdir %dir%\bin
mkdir %dir%\bin\client
mkdir %dir%\bin\server
mkdir %dir%\Resources
copy Resources\ResourcePack.zip %dir%\Resources
copy Buildfiles\* %dir%

xcopy /E Bin\Client\* %dir%\bin\client
xcopy /E Bin\Server\* %dir%\bin\server
cd %dir%
FOR /F "tokens=*" %%G IN ('DIR /B /AD /S *.svn*') DO RMDIR /S /Q "%%G"
cd ..
%zip% -tzip a %dir%.zip %dir%
rd /S /Q %dir%

pause
