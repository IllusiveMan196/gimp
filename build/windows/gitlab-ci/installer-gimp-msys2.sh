# Install Inno Setup.
wget https://jrsoftware.org/download.php/is.exe
./is.exe //SILENT //SUPPRESSMSGBOXES //CURRENTUSER //SP- //LOG="innosetup.log"

# Install unofficial language files. These are translations of "unknown
# translation quality or might not be maintained actively".
# Cf. https://jrsoftware.org/files/istrans/
ISCCDIR=`grep "Dest filename:.*ISCC.exe" innosetup.log | sed 's/.*Dest filename: *\|ISCC.exe//g'`
ISCCDIR=`cygpath -u "$ISCCDIR"`
mkdir -p "${ISCCDIR}/Languages/Unofficial"
cd "${ISCCDIR}/Languages/Unofficial"

wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Basque.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/ChineseSimplified.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/ChineseTraditional.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/EnglishBritish.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Esperanto.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Greek.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Hungarian.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Indonesian.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Korean.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Latvian.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Malaysian.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Marathi.islu
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Romanian.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Swedish.isl
wget https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Unofficial/Vietnamese.isl
cd -

# Construct now the installer.
cd build/windows/installer
./compile.bat 2.99.6 ../../.. gimp-w32 gimp-w64 ../../.. gimp-w32 gimp-w64
