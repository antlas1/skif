REM Путь к bin от CMAKE (не ниже 3.6)
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"

REM Сборка
cd ../build
cmake ../src -G "Visual Studio 16 2019" -A Win32 -DCMAKE_CONFIGURATION_TYPES="Debug;Release"
cmake --build . --config Debug
pause