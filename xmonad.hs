import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import XMonad.Actions.Volume
import Graphics.X11.ExtraTypes.XF86
import Data.Map (fromList)
import Data.Monoid (mappend)

main = do
xmproc <- spawnPipe "/usr/bin/xmobar /home/nicholas/.xmobarrc"
xmonad $ defaultConfig
    { terminal = "urxvt"
    , normalBorderColor = "#000000"
    , focusedBorderColor = "#ffb001"
    , keys = keys defaultConfig `mappend`
    \c -> fromList [
        ((0, xF86XK_AudioLowerVolume), lowerVolume 4 >> return()),
        ((0, xF86XK_AudioRaiseVolume), raiseVolume 4 >> return())
    ]
    , manageHook = composeAll
                [ className =? "Swarm.py"        --> doFloat]
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#add8e6" "" . shorten 50
                        , ppCurrent = xmobarColor "#add8e6" "" . wrap "" ""
                        }
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock") --mod4mask is the windows key
    , ((0, xK_Print), spawn "gnome-screenshot")
    , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")
    , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10")
    ]
