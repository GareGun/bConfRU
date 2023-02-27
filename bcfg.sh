#!/bin/bash
trap "exitscr" SIGINT

intde="/usr/bin/runui"
intbat="/usr/bin/batus"
intkbat="/usr/bin/kbatus"

dede="ncal dialog wget bash w3m w3m-img mc mpv aplay grep sudo"
bade="dialog adb android-libadb fastboot grep sudo"
kbade="kdialog dialog ncal adb fastboot grep sudo"

Green='\033[0;32m'
ICyan='\033[0;96m'
BIRed='\033[1;91m'
BIBlue='\033[1;94m'
BIGreen='\033[1;92m'
BYellow='\033[1;33m'
No_color='\033[0m'

function pause(){ read -sn1 pause; }
function exitscr(){
 if [ "$1" != "--debug" ]; then clear; fi
 echo -e "batusConfigurator от 2023. От ${BIBlue}Russanandres${No_color} и локализован ${BIBlue}GareGun${No_color}"
 echo
 echo -e "Сейчас - ${BIBlue}$(date +%d/%m/%y)${No_color}. Текущие время - ${BIBlue}$(date +%T)${No_color}"
 exit
}

function ijusttryingtodoagoodinterface(){
clear
echo
echo -e "${BIGreen}[Любая кнопка]${No_color} - ${BIRed}Я ничего не понимаю, просто установи!!!${No_color}"
echo -e "${BIGreen}[c]${No_color} - ${BIBlue}Дай мне все настроить.${No_color}"
echo
read -sn1
}




function selINconfERROR(){
clear
echo -e "${BIRed}
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │ Ошибка конфигурации!                                                           [Ошибка установки!] │
    └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


       Где-то в конфигурации пристутствует ${BIRed}ОШИБКА!${No_color}

       Попробуйте проверить ${Green}кэш${No_color}, куда ты устанавливал.
       Если кэш правильный на 100%, создай ошибку на github(К основному git'у).

${BIBlue}        - Нажмите ENTER что бы продолжить.
        - Нажмите CTRL + C что бы завершить.${No_color}
"
pause
$scr
}

function startbconf(){
scr="startbconf"
if [ "$1" != "--debug" ]; then clear; fi
parts=4
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                      [часть 1 из $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


${ICyan}      Добро пожаловать в bConfigurator!${No_color}

      Мы зададим $parts вопросов для настройки всего.
      Все изменения будут записаны ${BIRed}после${No_color} всех вопросов.

${BIBlue}       - Нажмите ENTER что бы продолжить.
       - Нажмите CTRL + C что бы завершить."${No_color}
echo
pause
if [ "$1" != "--debug" ]; then clear; fi
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                       [часть 2 из $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


        Установить Batus или YDE?

${BIBlue}         - Нажмите [B] для Batus
         - Нажмите [Y] для YDE."${No_color}
echo
read -sn1 two
if [ "$two" == "Y" ] || [ "$two" == "y" ]; then yde; fi
if [ "$two" == "B" ] || [ "$two" == "b" ]; then confbat;else selINconfERROR; fi
}
function yde(){
scr="yde"
if [ "$1" != "--debug" ]; then clear; fi
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                       [часть 3 из $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


        Какой релиз YDE?

${BIBlue}         - Нажмите [R] для установки стабильного релиза.
         - Нажмите [D] для установки тестовой версии."${No_color}
echo
read -sn1 yde
if [ "$yde" == "R" ] || [ "$yde" == "r" ] || [ "$yde" == "D" ] || [ "$yde" == "d" ]; then confpath;else selINconfERROR; fi;}
function confbat(){
scr="confbat"
if [ "$1" != "--debug" ]; then clear; fi
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                       [часть 3 из $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


        Какой Batus?

${BIBlue}         - Нажмите [K] для Kdialog Batus.
         - Нажмите [G] для Dialog Batus.
         - Нажмите [T] для Text Batus.${No_color}
"
#         - Нажмите [] to Graphical Dialog menu.
#         - Нажмите [] to Text menu.
echo
read -sn1 batusver
if [ "$batusver" == "K" ] || [ "$batusver" == "k" ] || [ "$batusver" == "G" ] || [ "$batusver" == "g" ] || [ "$batusver" == "T" ] || [ "$batusver" == "t" ]; then confpath;else selINconfERROR; fi;}
function confpath(){
scr="confpath"
if [ "$1" != "--debug" ]; then clear; fi
echo
echo -e "${Green}
   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐
   │ bConfigurator                                                                       [часть 4 из $parts] │
   └────────────────────────────────────────────────────────────────────────────────────────────────────┘${No_color}


        Выбрать путь установки:
        ${BIRed}ВНИМАНИЕ! Для установки в /home/$USER/.local/bin/ нужно создать путь!
        Если вы не знаете как как создать его, выбирайте /usr/bin!${No_color}

${BIBlue}         - Нажмите [B] для установки в /usr/bin/
         - Нажмите [L] для установки в /home/$USER/.local/bin/${No_color}
"
#         - Нажмите [Y] to Your custom path.
echo
read -sn1 ipath
if [ "$ipath" == "B" ] || [ "$ipath" == "b" ] || [ "$ipath" == "L" ] || [ "$ipath" == "l" ]; then nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd;else selINconfERROR; fi;}


function nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd(){
case "$ipath" in
"B"|"b" ) path="/usr/bin$inst";;
"L"|"l" ) path="/home/$USER/.local/bin$inst";;
esac

case "$yde" in
"R"|"r" ) inst="runui";iR;;
"D"|"d" ) inst="runuidev";iD;;
esac

case "$batusver" in
"K"|"k" ) inst="kbatus";iK;;
"G"|"g" ) inst="batus";iG;;
"T"|"t" ) inst="bfl";iT;;
esac
}

function iR(){
wget https://raw.githubusercontent.com/Russanandres/YDE/main/de.sh
   sudo apt install $dede -y
   sudo cp -v ./de.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Все выполнено! Для запуска YDE напишите $inst"
   exit
}

function iD(){
wget https://raw.githubusercontent.com/Russanandres/YDE/main/dev.sh
   sudo apt install $dede -y
   sudo cp -v ./dev.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Все выполнено! Для запуска YDE dev напишите $inst"
   exit
}

function iK(){
sudo apt install kdialog
 wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
   sudo apt install $kbade -y
   sudo cp -v ./KBatus.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Все выполнено! Для запуска Batus напишите $inst"
   exit
}


function iG(){
wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/BatusLin.sh
   sudo apt install $bade -y
   sudo cp -v ./BatusLin.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Все выполнено! Для запуска Batus напишите $inst"
   exit
}

function iT(){
wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
   sudo cp -v ./BFL.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Все выполнено! Для запуска BFL напишите $inst"
   exit
}



if [ "$1" != "--debug" ]; then clear; fi
# echo -e "${BYellow}bConf by Russanandres. Now is $(date)${No_color}"
# echo
# echo
echo -e "${BIGreen}[c]${No_color} - ${BIBlue}Дай мне настроить все.${No_color}"
echo -e "${BIGreen}[any button]${No_color} - ${BIRed}Я НИЧЕГО НЕ ПОНИМАЮ, ПРОСТО УСТАНОВИ ЭТО!!!${No_color}"
echo
read -sn1 ch
case "$ch" in
"c" ) startbconf;;
"=" ) ijusttryingtodoagoodinterface;;
*   )


if [ -f /usr/bin/kbatus ]; then sudo rm /usr/bin/kbatus; fi
if [ -f /usr/bin/runui ]; then sudo rm /usr/bin/runui; fi
if [ -f /usr/bin/batus ]; then sudo rm /usr/bin/batus; fi
if [ -f /usr/bin/bfl ]; then sudo rm /usr/bin/bfl; fi

if [ -f $USER/.local/bin/kbatus ]; then rm $USER/.local/bin/kbatus; fi
if [ -f $USER/.local/bin/batus ]; then rm $USER/.local/bin/batus; fi
if [ -f $USER/.local/bin/bfl ]; then rm $USER/.local/bin/bfl; fi

# if [ -f $USER/.config/YDE/settings.conf ]; then source $USER/.config/YDE/settings.conf; sudo rm $int; fi


if [ "$XDG_SESSION_TYPE" == "wayland" ] || [ "$XDG_SESSION_TYPE" == "x11" ]; then
kdialog >> /dev/null
if [ "$?" != "0" ]; then
 working=1
 sudo apt install kdialog
  if [ "$?" != "0" ]; then
   working=0
  fi
  if [ "$working" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./KBatus.sh.sh $USER/.local/bin/kbatus
   chmod -v +x $USER/.local/bin/kbatus
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Все выполнено! Для запуска Batus напишите kbatus"
   exit
  fi
  echo
  echo
  echo "Для продолжения, пожалуйста, напишите пароль рут'а:"
  sudo cp -v ./Batus.sh.sh /usr/bin/kbatus
  sudo chmod -v +x /usr/bin/kbatus
  if [ "$1" != "--debug" ]; then clear; fi
  echo "Все выполнено! Для запуска Batus напишите kbatus"
  exit
  fi
fi
fi

bash --version >> /dev/null
if [ "$?" != "0" ]; then
 working=1
 sudo apt install bash
  if [ "$?" != "0" ]; then
   working=0
  fi
  if [ "$working" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/Batus.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./Batus.sh.sh $USER/.local/bin/batus
   chmod -v +x $USER/.local/bin/batus
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Все выполнено! Для запуска Batus напишите batus"
   exit
  fi
  fi
  echo
  echo
  echo "Для продолжения, пожалуйста, напишите пароль рут'а:"
  sudo cp -v ./Batus.sh.sh /usr/bin/batus
  sudo chmod -v +x /usr/bin/batus
  if [ "$1" != "--debug" ]; then clear; fi
  echo "Все выполнено! Для запуска Batus напишите batus"
  exit
fi

wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./BFL.sh $USER/.local/bin/bfl
   chmod -v +x $USER/.local/bin/bfl
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Все выполнено! Для запуска Batus напишите bfl"
   exit
  fi
  echo
  echo
  echo "Для продолжения, пожалуйста, напишите пароль рут'а:"
  sudo cp -v ./BFL.sh /usr/bin/bfl
  sudo chmod -v +x /usr/bin/bfl
  if [ "$1" != "--debug" ]; then clear; fi
  echo "Все выполнено! Для запуска Batus напишите bfl"
  exit


### I know that it part of code can't be run.
wget https://raw.githubusercontent.com/Russanandres/YDE/main/YDE_fallback.sh
echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./YDE_fallback.sh $USER/.local/bin/safeui
   chmod -v +x $USER/.local/bin/safeui
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Все выполнено! Для запуска Batus напишите safeui"
   exit
  fi
  echo
  echo
  echo "Для продолжения, пожалуйста, напишите пароль рут'а:"
  sudo cp -v ./YDE_fallback.sh /usr/bin/safeui
  sudo chmod -v +x /usr/bin/safeui
  if [ "$1" != "--debug" ]; then clear; fi
  echo "Все выполнено! Для запуска Batus напишите safeui"
  exit
;;
esac
echo "What if anywhere exist stairway to heavy code?(И как это переводить-то?)"
