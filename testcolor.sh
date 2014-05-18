#!/bin/bash

# ANSI Color pallet

### 16colors
echo
echo -e "\033[1m*** 16 colors ***\033[0m"

echo " On White(47)     On Black(40)     On Default     Color Code"

echo -e "\
\033[47m\033[1;37m  White        \033[0m  \
\033[40m\033[1;37m  White        \033[0m  \
\033[1;37m  White        \033[0m\
  1;37\
"

echo -e "\
\033[47m\033[37m  Light Gray   \033[0m  \
\033[40m\033[37m  Light Gray   \033[0m  \
\033[37m  Light Gray   \033[0m  \
37\
"

echo -e "\
\033[47m\033[1;30m  Gray         \033[0m  \
\033[40m\033[1;30m  Gray         \033[0m  \
\033[1;30m  Gray         \033[0m  \
1;30\
"

echo -e "\
\033[47m\033[30m  Black        \033[0m  \
\033[40m\033[30m  Black        \033[0m  \
\033[30m  Black        \033[0m  \
30\
"

echo -e "\
\033[47m\033[31m  Red          \033[0m  \
\033[40m\033[31m  Red          \033[0m  \
\033[31m  Red          \033[0m  \
31\
"

echo -e "\
\033[47m\033[1;31m  Light Red    \033[0m  \
\033[40m\033[1;31m  Light Red    \033[0m  \
\033[1;31m  Light Red    \033[0m  \
1;31\
"

echo -e "\
\033[47m\033[32m  Green        \033[0m  \
\033[40m\033[32m  Green        \033[0m  \
\033[32m  Green        \033[0m  \
32\
"

echo -e "\
\033[47m\033[1;32m  Light Green  \033[0m  \
\033[40m\033[1;32m  Light Green  \033[0m  \
\033[1;32m  Light Green  \033[0m  \
1;32\
"

echo -e "\
\033[47m\033[33m  Brown        \033[0m  \
\033[40m\033[33m  Brown        \033[0m  \
\033[33m  Brown        \033[0m  \
33\
"

echo -e "\
\033[47m\033[1;33m  Yellow       \033[0m  \
\033[40m\033[1;33m  Yellow       \033[0m  \
\033[1;33m  Yellow       \033[0m  \
1;33\
"

echo -e "\
\033[47m\033[34m  Blue         \033[0m  \
\033[40m\033[34m  Blue         \033[0m  \
\033[34m  Blue         \033[0m  \
34\
"

echo -e "\
\033[47m\033[1;34m  Light Blue   \033[0m  \
\033[40m\033[1;34m  Light Blue   \033[0m  \
\033[1;34m  Light Blue   \033[0m  \
1;34\
"

echo -e "\
\033[47m\033[35m  Purple       \033[0m  \
\033[40m\033[35m  Purple       \033[0m  \
\033[35m  Purple       \033[0m  \
35\
"

echo -e "\
\033[47m\033[1;35m  Pink         \033[0m  \
\033[40m\033[1;35m  Pink         \033[0m  \
\033[1;35m  Pink         \033[0m  \
1;35\
"

echo -e "\
\033[47m\033[36m  Cyan         \033[0m  \
\033[40m\033[36m  Cyan         \033[0m  \
\033[36m  Cyan         \033[0m  \
36\
"

echo -e "\
\033[47m\033[1;36m  Light Cyan   \033[0m  \
\033[40m\033[1;36m  Light Cyan   \033[0m  \
\033[1;36m  Light Cyan   \033[0m  \
1;36\
"


### 256 colors

echo
echo -e "\033[1m*** 256 colors ***\033[0m"

for fgbg in 38; do #Foreground/Background
  for color in {0..256} ; do #Colors
    #Display the color
    printf "\e[${fgbg};5;${color}m ${color}\t\e[0m"
    #Display 10 colors per lines
    if [ $((($color + 1) % 10)) == 0 ] ; then
      echo #New line
    fi
  done
  echo #New line
done