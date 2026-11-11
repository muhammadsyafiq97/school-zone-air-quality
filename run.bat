@echo off
if not exist out mkdir out
javac -d out src\*.java
if %errorlevel% neq 0 pause & exit /b
java -cp out Main
pause
