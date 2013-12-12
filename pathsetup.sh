#!/bin/bash

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH on gLucid
PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

PATH=$PATH:$envsetup
PATH=/usr/local/bin:$PATH
PATH=$PATH:$JAVA_HOME/bin
export PATH LD_LIBRARY_PATH

jdk_bin=~/tool/jdk1.6.0_45/bin
if [[ "$jdk_bin" != "" ]]; then
    PATH=$jdk_bin:$PATH
fi

android_platform_tools=~/tool/adt-bundle/sdk/platform-tools
if [[ "$android_platform_tools" != "" ]]; then
    PATH=$android_platform_tools:$PATH
fi

android_tools=~/tool/adt-bundle/sdk/tools
if [[ "$android_tools" != "" ]]; then
    PATH=$android_tools:$PATH
fi

eclipse_bin=~/tool/adt-bundle/eclipse
if [[ "$eclipse_bin" != "" ]]; then
    PATH=$PATH:$eclipse_bin
fi

arm_2009q3_path=~/tool/arm-2009q3/bin
if [[ "$arm_2009q3_path" != "" ]]; then
    PATH=$PATH:$arm_2009q3_path
fi

WHITE="\[\e[1;37m\]"
GREEN="\[\e[0;32m\]"
CYAN="\[\e[0;36m\]"
GRAY="\[\e[0;37m\]"
BLUE="\[\e[0;34m\]"
END="\[\e[m\]"
GIT_BRANCH="\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
GIT_BR_TAG='$(__git_ps1)'
PS1="${GREEN}\w${END}${GIT_BR_TAG}${BLUE}$ ${END}"

echo "    ~/.envsetup.$OS/pathsetup.sh sourced!!!"
