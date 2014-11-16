DroidIconGen - The Icon generator for Android from SVG files.

Generate Icons for your Android apps from SVG(Scalable Vector Graphics) image 2500+ files
Edit SVG files, Change colors and generate drawables(png).

Thanks to Apache™ Batik SVG Toolkit, Batik is a Java-based toolkit for applications or applets that want to use images in the Scalable Vector Graphics (SVG) format for various purposes, such as display, generation or manipulation.

How to use
a) Run droid_icon_gen.exe
b) Choose the SVG image from which you want to generate icons (png)
c) Select the Android Project for which the icons needs to be generate
d) Enter meaningful name without ext
e) Click Generate!

This tool automatically stores the generated png files into the respective drawables.

Supports
 drawable-xxhdpi (144 X 144)
 drawable-xhdpi (96 X 96)
 drawable-hdpi (72 X 72)
 drawable-mdpi (48 X 48)
 drawable-ldpi (32 X 32)

PNG files with various image sizes (Width X Height) is generated from SVG using Apache Batik toolkit.
eg. To generate png for drawable-xhdpi from play.svg, use
java -jar batik-rasterizer.jar -m image/png -h 96 -w 96 play.svg

This GUI tool is developed for windows, but can be extended to other platforms.
Developed using AutoHotKey and Batch files.

Learn more about
Iconography - http://developer.android.com/design/style/iconography.html
SVG - http://www.w3schools.com/svg/
InkScape - Open Source vector graphics editor http://inkscape.org/
Apache Batik - http://xmlgraphics.apache.org/batik/

This GUI tool was developed by VinDroidApps. 
Get VinDroidApps from Google Play
https://play.google.com/store/apps/developer?id=Vindroidapps

For any comments, feedback, please write to vindroidapps@gmail.com

svg image courtesy : wireframesketcher