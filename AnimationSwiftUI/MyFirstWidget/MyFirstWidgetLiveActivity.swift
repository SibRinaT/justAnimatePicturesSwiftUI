//
//  MyFirstWidgetLiveActivity.swift
//  MyFirstWidget
//
//  Created by Ainur on 06.04.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MyFirstWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MyFirstWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MyFirstWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MyFirstWidgetAttributes {
    fileprivate static var preview: MyFirstWidgetAttributes {
        MyFirstWidgetAttributes(name: "World")
    }
}

extension MyFirstWidgetAttributes.ContentState {
    fileprivate static var smiley: MyFirstWidgetAttributes.ContentState {
        MyFirstWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MyFirstWidgetAttributes.ContentState {
         MyFirstWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MyFirstWidgetAttributes.preview) {
   MyFirstWidgetLiveActivity()
} contentStates: {
    MyFirstWidgetAttributes.ContentState.smiley
    MyFirstWidgetAttributes.ContentState.starEyes
}
