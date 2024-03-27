//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by Ainur on 23.03.2024.
//

import SwiftUI

struct Animation1: View {
    @State private var isAnimating = false
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 150, height: 100)
                        .offset(x: 25, y: 0)
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 100, height: 80)
                        .offset(x: -25, y: -10)
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 80, height: 60)
                        .offset(x: 40, y: -32)
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 80, height: 60)
                        .offset(x: 40, y: 30)
                }
               
            }
            .scaleEffect(isAnimating ? 2 : 1)
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    .onAppear {
                        isAnimating = true
                    }
            
            .padding(.vertical, 50)
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(.linear(duration: 1))
            
            Button("Animate") {
                withAnimation {
                    isAnimating.toggle()
                }
            }
            .foregroundColor(.gray)
            .bold()
            .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Animation1()
}
