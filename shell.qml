import QtQuick
import Quickshell
import "background" as Background
import "bar" as Bar

ShellRoot {
    id: shellRoot 

    // background halftone animation
    Background.Background {}

    Bar.Bar {}

}
