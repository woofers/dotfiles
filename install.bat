
REM Link Mintty
rmdir /S "%appdata%\wsltty"
mklink /D "%appdata%\wsltty" %cd%\wsltty\roaming\wsltty

REM Link Git Config
del %cd%\emacs\.gitconfig
mklink "%cd%\emacs\.gitconfig" %cd%\git\.gitconfig

REM Eshell Aliases
del %cd%\emacs\.emacs.d\eshell\alias
mklink "%cd%\emacs\.emacs.d\eshell\alias %cd%\shell\.aliases
