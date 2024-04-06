//
//  SpeechTry2.swift
//  AnimationSwiftUI
//
//  Created by Ainur on 04.04.2024.
//

import SwiftUI

struct SpeechRec: View {
    @ObservedObject var speechRec = SpeechRec()
        var body: some View {
            Text(speechRec.recognizedText)
                .onAppear {
                    self.speechRec.start()
            }
        }
}

#Preview {
    SpeechRec()
}
