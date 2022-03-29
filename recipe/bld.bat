echo on
:: There is no `gdal-config` on Windows so we need figure it out from gdalinfo
for /F "USEBACKQ tokens=2 delims=, " %%F in (`gdalinfo --version`) do (
set GDAL_VERSION=%%F
)
if errorlevel 1 exit 1
echo "set GDAL_VERSION=%GDAL_VERSION%"

"%PYTHON%" -m pip install --no-deps --ignore-installed . ^
                          --global-option="build_ext -I%LIBRARY_INC% -L%LIBRARY_LIB% -lgdal_i" ^
                          --gdalversion=%GDAL_VERSION%
if errorlevel 1 exit 1
