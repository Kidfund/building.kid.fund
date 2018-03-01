---
layout: post
title: Opening iTerm2 Tabs at Specific Directories
date: 2018-03-01 09:30 -0500
author: Tim
category: Hacks
tags: applescript alfred iterm2 terminal automation
---

I love [iTerm2](https://www.iterm2.com/). The customizability and the [scripting support](https://www.iterm2.com/documentation-scripting.html) are _miles_ beyond the stock Terminal.app. One of my favorite features is the ability to open a set of tabs to specific directories. For example, I tend to open the same 4 tabs when working on [Kidfund](https://kid.fund/):

1. Our iOS project
1. Our Laravel project - where I run [Artisan](https://laravel.com/docs/5.6/artisan) commands
1. The most recent file in the `logs` directory - sometimes I `cd` over to the [Realm](https://realm.io/) directory to pop it into the [Realm Browser](https://github.com/realm/realm-browser-osx)
1. Our React project

I didn't want this to run _all_ of the time, so I didn't default this script run each time iTerm opens. Instead I wired it into an [Alfred](https://www.alfredapp.com) command, which you can download [here](https://github.com/Kidfund/KidTabs).

The underlying script is as follows. It's crude, and could definitely be more flexible, but it works for me. 🤷‍♂️ Hopefully it can help you craft something to your needs!

```applescript
tell application "iTerm2"
  tell current session of current window
    write text "cd ~/workspace/kidfund/ios/Kidfund"
  end tell
  
  tell current window
    create tab with default profile
    tell current session of current tab
      write text "cd ~/workspace/kidfund/web"
    end tell
  end tell
  
  tell current window
    create tab with default profile
    tell current session of current tab
      write text "cd ~/workspace/kidfund/web && tail -f storage/logs/\"$(ls -at storage/logs | head -n 1)\""
    end tell
  end tell
  
  tell current window
    create tab with default profile
    tell current session of current tab
      write text "cd ~/workspace/kidfund/web-react"
    end tell
  end tell
end tell
```

*This article was originally posted on [my personal site](http://www.timbroder.com/2016/07/Opening-iTerm2-Tabs-at-Specific-Directories.html).*
