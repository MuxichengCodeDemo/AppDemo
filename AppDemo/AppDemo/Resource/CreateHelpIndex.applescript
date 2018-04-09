--
--  CreateHelpIndex.applescript
--
--
--  Created by HeGuican on 2018/04/09.
--  Copyright © 2017年 HeGuican. All rights reserved.
--

#Help文档Apple官方资料
#https://developer.apple.com/library/content/documentation/Carbon/Conceptual/ProvidingUserAssitAppleHelp/authoring_help/authoring_help_book.html#//apple_ref/doc/uid/TP30000903-CH206-CIHEAADH
#https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/hiutil.1.html

on run(HelpIndexScript)
    do shell script(HelpIndexScript)
end run
