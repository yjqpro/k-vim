REM    Copyright 2014 Steve Francia
REM 
REM    Licensed under the Apache License, Version 2.0 (the "License");
REM    you may not use this file except in compliance with the License.
REM    You may obtain a copy of the License at
REM 
REM        http://www.apache.org/licenses/LICENSE-2.0
REM 
REM    Unless required by applicable law or agreed to in writing, software
REM    distributed under the License is distributed on an "AS IS" BASIS,
REM    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM    See the License for the specific language governing permissions and
REM    limitations under the License.


@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

REM Remove old vimrc


@set APP_PATH=%HOME%\.k-vim
IF NOT EXIST "%APP_PATH%" (
    call git clone d:\git\k-vim "%APP_PATH%"
) ELSE (
    @set ORIGINAL_DIR=%CD%
    echo updating spf13-vim
    chdir /d "%APP_PATH%"
    call git pull
    chdir /d "%ORIGINAL_DIR%"
    call cd "%APP_PATH%"
)

rm -rf %APP_PATH%
rm -rf %HOME%\.vim
del .vimrc
del _vimrc
del _viminfo
del _vim_mru_files

call mklink "%HOME%\.vimrc" "%APP_PATH%\vimrc"
call mklink "%HOME%\_vimrc" "%APP_PATH%\vimrc"
call mklink "%HOME%\.vimrc.bundles" "%APP_PATH%\vimrc.bundles"
call mklink /J "%HOME%\.vim" "%APP_PATH%\.vim"

IF NOT EXIST "%HOME%/.vim/bundle/vundle" (
    call git clone https://github.com/gmarik/vundle.git "%HOME%/.vim/bundle/vundle"
) ELSE (
  call cd "%HOME%/.vim/bundle/vundle"
  call git pull
  call cd %HOME%
)

call vim -u "%APP_PATH%/vimrc.bundles" +PlugInstall! +PlugClean +qall
