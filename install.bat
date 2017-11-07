
rmdir /S "%appdata%\wsltty"
mklink /D "%appdata%\wsltty" %cd%\wsltty\roaming\wsltty
del %cd%\emacs\.gitconfig
mklink "%cd%\emacs\.gitconfig" %cd%\git\.gitconfig
copy %cd%\wsltty\local\wsl~.bat %appdata%\..\local\wsltty\wsl~.bat
mklink /D "%WINDIR%\system32\bin" %appdata%\..\local\wsltty\bin
