echo $SHELL
echo $UID
echo $USER
echo $BASH
echo $HOME
echo $PATH
echo $PS1, $PS2, $PWD, $TERM, $HOSTNAME
cd $HOME ; cat f3
printf "введите команду \n" ; read usercom ; echo $usercom
printf "Введите команду \n" ; read usercom ; ${usercom:?"ошибка"}
