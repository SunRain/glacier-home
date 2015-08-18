/****************************************************************************************
**
** Copyright (C) 2013 Lucien Xu <sfietkonstantin@free.fr>
** All rights reserved.
**
** You may use this file under the terms of BSD license as follows:
**
** Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are met:
**     * Redistributions of source code must retain the above copyright
**       notice, this list of conditions and the following disclaimer.
**     * Redistributions in binary form must reproduce the above copyright
**       notice, this list of conditions and the following disclaimer in the
**       documentation and/or other materials provided with the distribution.
**     * Neither the name of the author nor the
**       names of its contributors may be used to endorse or promote products
**       derived from this software without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
** ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
** WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
** DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
** ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
** (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
** ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
** SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
****************************************************************************************/

import QtQuick 2.1
//import QtQuick.Controls.Styles.Nemo 1.0
import Sailfish.Silica 1.0

Item {
    id: container

//    width: 2 * Theme.spinner.radius + Theme.spinner.horizontalSpacing
//    height: 2 * Theme.spinner.radius + Theme.spinner.verticalSpacing

    property real innerWidth: container.width *0.9
    property real circleWidth: container.width *0.4

    states: [
        State { name: "enabled"; when: enabled }
    ]

    transitions: [
        Transition {
            from: ""
            to: "enabled"

            SequentialAnimation {
                NumberAnimation {
                    targets: [circle0, circle1, circle2, circle3]
                    property: "opacity"
                    to: 1
                    duration: 1500
                }
                PropertyAction { target: animations; property: "running"; value: true }
            }
        },
        Transition {
            from: "enabled"
            to: ""

            SequentialAnimation {
                PropertyAction { target: animations; property: "running"; value: false }
                PropertyAnimation {
                    targets: [circle0, circle1, circle2, circle3]
                    property: "color";
                    to: Theme.primaryColor
                    duration: 1500
                }
                NumberAnimation {
                    targets: [circle0, circle1, circle2, circle3]
                    property: "opacity"
                    to: 0
                    duration: 1500
                }
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        onClicked: animation.start()
    }

    Item {
        id: innerRect
        anchors.centerIn: parent
        width: container.innerWidth
        height: innerRect.width
    }

    Rectangle {
        id: circle0
        opacity: 0
        anchors.horizontalCenter: innerRect.left
        anchors.verticalCenter: innerRect.top
        width: container.circleWidth //Theme.spinner.radius
        height: container.circleWidth //Theme.spinner.radius
        radius: 32 //Theme.spinner.radius / 2
        color: Theme.primaryColor
    }

    Rectangle {
        id: circle1
        opacity: 0
        anchors.horizontalCenter: innerRect.right
        anchors.verticalCenter: innerRect.top
        width: container.circleWidth //Theme.spinner.radius
        height: container.circleWidth //Theme.spinner.radius
        radius: 32 //Theme.spinner.radius / 2
        color: Theme.primaryColor
    }

    Rectangle {
        id: circle2
        opacity: 0
        anchors.horizontalCenter: innerRect.right
        anchors.verticalCenter: innerRect.bottom
        width: container.circleWidth //Theme.spinner.radius
        height: container.circleWidth //Theme.spinner.radius
        radius: 32 //Theme.spinner.radius / 2
        color: Theme.primaryColor
    }

    Rectangle {
        id: circle3
        opacity: 0
        anchors.horizontalCenter: innerRect.left
        anchors.verticalCenter: innerRect.bottom
        width: container.circleWidth //Theme.spinner.radius
        height: container.circleWidth //Theme.spinner.radius
        radius: 32 //Theme.spinner.radius / 2
        color: Theme.primaryColor
    }

    SequentialAnimation {
        id: animations
        loops: Animation.Infinite
        ParallelAnimation {
            PropertyAnimation {
                target: circle0
                property: "color"
                to: Theme.secondaryColor
                duration: 1500
            }
            PropertyAnimation {
                target: circle3
                property: "color"
                to: Theme.primaryColor
                duration: 1500
            }
        }

        ParallelAnimation {
            PropertyAnimation {
                target: circle1
                property: "color"
                to: Theme.secondaryColor
                duration: 1500
            }
            PropertyAnimation {
                target: circle0
                property: "color"
                to: Theme.primaryColor
                duration: 1500
            }
        }

        ParallelAnimation {
            PropertyAnimation {
                target: circle2
                property: "color"
                to: Theme.secondaryColor
                duration: 1500
            }
            PropertyAnimation {
                target: circle1
                property: "color"
                to: Theme.primaryColor
                duration: 1500
            }
        }

        ParallelAnimation {
            PropertyAnimation {
                target: circle3
                property: "color"
                to: Theme.secondaryColor
                duration: 1500
            }
            PropertyAnimation {
                target: circle2
                property: "color"
                to: Theme.primaryColor
                duration: 1500
            }
        }
    }
}