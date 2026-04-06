@echo off
cd /d "C:\Users\tt12b\바탕 화면\git\jekyll-now\ywluv-resume"

echo ===========================
echo Cleaning old build files...
echo ===========================
call bundle exec jekyll clean

echo ===========================
echo Starting Jekyll server...
echo ===========================
call bundle exec jekyll serve --incremental

echo.
echo ===========================
echo Jekyll server stopped.
echo Press any key to exit...
pause >nul
