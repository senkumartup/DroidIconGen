@ECHO OFF
CD %1
IF EXIST DEL %3.svg
COPY %2 .

IF NOT EXIST %4\res MKDIR %4\res

REM drawable-xxhdpi - 144 X 144
IF EXIST %3.png DEL %3.png
java -jar batik-rasterizer.jar -m image/png -h 144 -w 144 %3.svg
IF NOT EXIST %4\res\drawable-xxhdpi MKDIR %4\res\drawable-xxhdpi
IF EXIST %4\res\drawable-xxhdpi\%5.png DEL %4\res\drawable-xxhdpi\%5.png
COPY %3.png %4\res\drawable-xxhdpi\%5.png

REM drawable-xhdpi  - 96 X 96
IF EXIST %3.png DEL %3.png
java -jar batik-rasterizer.jar -m image/png -h 96 -w 96 %3.svg
IF NOT EXIST %4\res\drawable-xhdpi MKDIR %4\res\drawable-xhdpi
IF EXIST %4\res\drawable-xhdpi\%5.png DEL %4\res\drawable-xhdpi\%5.png
COPY %3.png %4\res\drawable-xhdpi\%5.png

REM drawable-hdpi   - 72 X 72
IF EXIST %3.png DEL %3.png
java -jar batik-rasterizer.jar -m image/png -h 72 -w 72 %3.svg
IF NOT EXIST %4\res\drawable-hdpi MKDIR %4\res\drawable-hdpi
IF EXIST %4\res\drawable-hdpi\%5.png DEL %4\res\drawable-hdpi\%5.png
COPY %3.png %4\res\drawable-hdpi\%5.png

REM drawable-mdpi   - 48 X 48
IF EXIST %3.png DEL %3.png
java -jar batik-rasterizer.jar -m image/png -h 48 -w 48 %3.svg
IF NOT EXIST %4\res\drawable-mdpi MKDIR %4\res\drawable-mdpi
IF EXIST %4\res\drawable-mdpi\%5.png DEL %4\res\drawable-mdpi\%5.png
COPY %3.png %4\res\drawable-mdpi\%5.png

REM drawable-ldpi   - 32 X 32
IF EXIST %3.png DEL %3.png
java -jar batik-rasterizer.jar -m image/png -h 32 -w 32 %3.svg
IF NOT EXIST %4\res\drawable-ldpi MKDIR %4\res\drawable-ldpi
IF EXIST %4\res\drawable-ldpi\%5.png DEL %4\res\drawable-ldpi\%5.png
COPY %3.png %4\res\drawable-ldpi\%5.png

DEL %3.svg %3.png
