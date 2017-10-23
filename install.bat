
rmdir /S "%appdata%\wsltty"
mklink /D "%appdata%\wsltty" %cd%\wsltty\roaming\wsltty
mklink "%cd%\emacs\.gitconfig" %cd%\git\.gitconfig
copy %cd%\wsltty\local\wsl~.bat %appdata%\..\local\wsltty\wsl~.bat

