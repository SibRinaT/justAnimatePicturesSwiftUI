////
////  SpeechTry2.swift
////  AnimationSwiftUI
////
////  Created by Ainur on 04.04.2024.
////
//
//import SwiftUI
//import Speech
//
//struct SpeechRec: View {
//    @State var speechRec = SpeechRec()
//        var body: some View {
//            Text(speechRec.recognizedText)
//                .onAppear {
//                    self.speechRec.start()
//            }
//            
//        }
//    func start() {
//        SFSpeechRecognizer.requestAuthorization { status in
//            
//        }
//    }
//}
//
//class SpeechRec: ObservableObject {
//    @Published private(set) var recognizedText = ""
//    func start() {
//        recognizedText = "Привет!"
//    }
//}
