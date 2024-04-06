//
//  SpeechView.swift
//  AnimationSwiftUI
//
//  Created by Ainur on 04.04.2024.
//

import SwiftUI
import Speech


struct SpeechView: View {
    @State private var recognizedText = ""
    @State private var imageToShow: String? = nil
    @State private var isListening = false
    @State private var recognizedWords: [String] = []
    
    private let wordToImageMapping: [String: String] = [
        "кошка": "cat_image",
        "собака": "dog_image",
        // Добавьте другие слова и их соответствующие картинки по вашему усмотрению
    ]
    
    var body: some View {
        VStack {
            if let imageName = imageToShow {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            Text("Распознанные слова:")
                .font(.headline)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(recognizedWords, id: \.self) { word in
                        Text(word)
                    }
                }
                .padding()
            }
            .frame(maxHeight: 150)
            
            Button(action: {
                isListening.toggle()
                if isListening {
                    4
                    startListening()
                } else {
                    stopListening()
                }
            }) {
                Text(isListening ? "Остановить прослушивание" : "Начать прослушивание")
            }
        }
    }
    
    func startListening() {
        let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "ru-RU"))
        let request = SFSpeechRecognitionRequest()
        recognizer?.recognitionTask(with: request) { result, error in
            guard let result = result else { return }
            if result.isFinal {
                DispatchQueue.main.async {
                    recognizedText = result.bestTranscription.formattedString
                    if let imageName = wordToImageMapping[recognizedText] {
                        imageToShow = imageName
                    }
                    recognizedWords.append(recognizedText)
                }
            }
        }
    }
    
    func stopListening() {
        // Останавливаем прослушивание, если требуется
    }
}

struct SpeechView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechView()
    }
}
