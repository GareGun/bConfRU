#!/bin/bash
let "VER = $(date +%H) + 12 + $(date +%S)"
gitVER1="batus14"

intde="/usr/bin/runui"
intbat="/usr/bin/batus"
intkbat="/usr/bin/kbatus"

dede="ncal dialog wget bash w3m w3m-img mc mpv aplay grep sudo"
bade="dialog adb android-libadb fastboot grep sudo"
kbade="kdialog dialog ncal adb fastboot grep sudo"

BIRed='\033[1;91m'
BIBlue='\033[1;94m'
BIGreen='\033[1;92m'
BYellow='\033[1;33m'
No_color='\033[0m'

function exitscr(){
 if [ "$1" != "--debug" ]; then clear; fi
 echo "bConf - 2023. Russanandres"
 date
 exit
}


function startbconf(){
if [ "$1" != "--debug" ]; then clear; fi
parts=4
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Конфигурация                                                                         [часть 1 из $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "      Добро пожаловать в bConfigurator."
echo
echo "      Мы предложим настроить все программы перед установкой"
echo "      Приложения примут изменения после всех настроек."
echo
echo "       - Нажмите ENTER для продолжения."
echo "       - Нажмите CTRL + C для выхода."
echo
pause
if [ "$1" != "--debug" ]; then clear; fi
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Конфигурация                                                                        [часть 2 из $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "        Установить Batus или YDE?"
echo
echo "         - Нажмите [B] что бы установить Batus"
echo "         - Нажмите [Y] что бы установить YDE."
echo
read -sn1 two
if [ "$two" == "Y" ] || [ "$two" == "y" ]; then yde; else confbat; fi
}
function yde(){
if [ "$1" != "--debug" ]; then clear; fi
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Конфигурация                                                                        [часть 3 из $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "        Какой релиз YDE вы хотите установить?"
echo
echo "         - Напечатайте [R] для установки стабильной версии."
echo "         - Напечатайте [D] для установки тестовой версии."
echo
read -sn1 yde
confpath;}
function confbat(){
if [ "$1" != "--debug" ]; then clear; fi
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Конфигурация                                                                        [часть 3 из $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "        Какой вид Batus'а?"
echo
echo "         - Нажмите [K] для установки Kdialog Batus."
echo "         - Нажмите [G] для установки Dialog Batus."
echo "         - Нажмите [T] для установки Text Batus."
# echo "         - Type [] to Graphical Dialog menu."
# echo "         - Type [] to Text menu."
echo
read -sn1 batusver
confpath;}
function confpath(){
if [ "$1" != "--debug" ]; then clear; fi
echo
echo "   ┌────────────────────────────────────────────────────────────────────────────────────────────────────┐"
echo "   │ Конфигурация                                                                        [часть 4 из $parts] │"
echo "   └────────────────────────────────────────────────────────────────────────────────────────────────────┘"
echo
echo
echo "        Выберите путь установки"
echo "        ВНИМАНИЕ! Для установки в /home/$USER/.local/bin/ вам нужно включить этот путь!"
echo "        Если вы не знаете как включить, используйте:/usr/bin!"
echo
echo "         - Нажмите [B] для установки в /usr/bin/"
echo "         - Нажмите [L] для установки в /home/$USER/.local/bin/"
# echo "         - Type [Y] to Your custom path."
echo
read -sn1 ipath
nowwewanttoinstallalldamnthingsthatuserchooseinhissystemandwegonnabreakalltherelolgoodbyesystemxd;}



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
   echo "Успешная установка! Для запуска YDE напишите $inst"
   exit
}

function iD(){
wget https://raw.githubusercontent.com/Russanandres/YDE/main/dev.sh
   sudo apt install $dede -y
   sudo cp -v ./dev.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Успешная установка! Для запуска YDE dev напишите $inst"
   exit
}

function iK(){
sudo apt install kdialog
 wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/KBatus.sh
   sudo apt install $kbade -y
   sudo cp -v ./KBatus.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Успешная установка! Для запуска Batus напишите $inst"
   exit
}


function iG(){
wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/BatusLin.sh
   sudo apt install $bade -y
   sudo cp -v ./BatusLin.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Успешная установка! Для запуска Batus напишите $inst"
   exit
}

function iT(){
wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
   sudo cp -v ./BFL.sh $path/$inst
   sudo chmod -v +x $path/$inst
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Успешная установка! Для запуска BFL напишите $inst"
   exit
}




if [ "$1" != "--debug" ]; then clear; fi
echo -e "${BYellow}bConf v1RU от Russanandres. Локализация от GareGun. Сейчас $(date)${No_color}"
echo
echo
echo -e "${BIGreen}[c]${No_color} - ${BIBlue}Дайте мне настроить все.${No_color}"
echo -e "${BIGreen}[any button]${No_color} - ${BIRed}Я НИЧЕГО НЕ ПОНИМАЮ, ПРОСТО УСТАНОВИ!!!${No_color}"
echo
read -sn1 ch
case "$ch" in
"c" ) startbconf;;
*   )



if [ -f /usr/bin/kbatus ]; then sudo rm /usr/bin/kbatus; fi
if [ -f /usr/bin/runui ]; then sudo rm /usr/bin/runui; fi
if [ -f /usr/bin/batus ]; then sudo rm /usr/bin/batus; fi
if [ -f /usr/bin/bfl ]; then sudo rm /usr/bin/bfl; fi

if [ -f $USER/.local/bin/kbatus ]; then rm $USER/.local/bin/kbatus; fi
if [ -f $USER/.local/bin/batus ]; then rm $USER/.local/bin/batus; fi
if [ -f $USER/.local/bin/bfl ]; then rm $USER/.local/bin/bfl; fi



if [ "$XDG_SESSION_TYPE" == "wayland" ] || [ "$XDG_SESSION_TYPE" == "x11" ]; then
kdialog >> /dev/null
if [ "$?" != "0" ]; then
 cibwkd=1
 sudo apt install kdialog
  if [ "$?" != "0" ]; then
   cibwkd=0
  fi
  if [ "$cibwkd" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/$gitVER.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./$gitVER.sh $USER/.local/bin/kbatus
   chmod -v +x $USER/.local/bin/kbatus
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Успешная установка! Для запуска Batus напишите kbatus"
   exit
  fi
  echo
  echo
  echo "Для продолжения напишите пороль от Root пользователя:"
  sudo cp -v ./$gitVER.sh /usr/bin/kbatus
  sudo chmod -v +x /usr/bin/kbatus
  if [ "$1" != "--debug" ]; then clear; fi
  echo "Успешная установка! Для запуска Batus напишите kbatus"
  exit
  fi
fi
fi

bash --version >> /dev/null
if [ "$?" != "0" ]; then
 cib=1
 sudo apt install bash
  if [ "$?" != "0" ]; then
   cib=0
  fi
  if [ "$cib" == "1" ]; then
  wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/$gitVER1.sh
  echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./$gitVER1.sh $USER/.local/bin/batus
   chmod -v +x $USER/.local/bin/batus
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Успешная установка! Для запуска Batus напишите batus"
   exit
  fi
  fi
  echo
  echo
  echo "Для продолжения напишите пороль от Root пользователя:"
  sudo cp -v ./$gitVER1.sh /usr/bin/batus
  sudo chmod -v +x /usr/bin/batus
  if [ "$1" != "--debug" ]; then clear; fi
  echo "Успешная установка! Для запуска Batus напишите batus"
  exit
fi

wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/For%20Legacy%20Systems/BFL.sh
echo $PATH | grep "$USER/.local/bin"
  if [ "$?" == "1" ]; then
   cp -v ./BFL.sh $USER/.local/bin/bfl
   chmod -v +x $USER/.local/bin/bfl
   if [ "$1" != "--debug" ]; then clear; fi
   echo "Успешная установка! Для запуска Batus напишите bfl"
   exit
  fi
  echo
  echo
  echo "Для продолжения напишите пороль от Root пользователя:"
  sudo cp -v ./BFL.sh /usr/bin/bfl
  sudo chmod -v +x /usr/bin/bfl
  if [ "$1" != "--debug" ]; then clear; fi
  echo "Успешная установка! Для запуска Batus напишите bfl"
  exit

;;
esac


