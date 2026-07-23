import QtQuick
import Quickshell
import "background" as Background
import "widgets" as Widgets
import "widgets/top-left-info" as TopLeftInfo

ShellRoot {
    id: shellRoot 

    // background halftone animation
    Background.Background {
        animate: Config.animateBackground
    } 

    TopLeftInfo.Logos {}
    Widgets.Clock {}
    Widgets.Greet {}

}
