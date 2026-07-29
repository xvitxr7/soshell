import QtQuick
import Quickshell

import qs.common
import qs.background.slates.user as UserSlate

Item {
    id: root

    Slate {
        id: slate1

        UserSlate.User {}

        x: 0
        y: 0

        slateId: 2
    }

    Slate {
        id: slate2

        x: 0
        y: Theme.s(179.94)

        slateId: 8
    }

    Slate {
        id: slate3

        x: 0
        y: Theme.s(331.23)

        slateId: 7
    }

    Slate {
        id: slate4

        x:Theme.s(205.8)
        y: slate3.y

        slateId: 6
    }

    Slate {
        id: slate5

        x: Theme.s(1034)
        y: Theme.s(-114.2)

        slateId: 1
    }

    Slate {
        id: slate6

        x: Theme.s(1551.4)
        y: slate5.y

        slateId: 3
    }

    Slate {
        id: slate7

        x: slate5.x
        y: slate3.y

        slateId: 4
    }

    Slate {
        id: slate8

        x: slate6.x
        y: slate7.y

        slateId: 5
    }
}
