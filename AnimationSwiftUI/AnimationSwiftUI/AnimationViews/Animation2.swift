//
//  Animation2.swift
//  AnimationSwiftUI
//
//  Created by Ainur on 27.03.2024.
// This animation view how 2 car is driving on road

import SwiftUI
import SwiftUI

struct Animation2: View {
    @State private var car1Offset: CGFloat = 0
    @State private var car2Offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            // Вертикальная дорога
            Rectangle()
                .fill(Color.gray)
                .frame(width: 150)
            
            // Горизонтальная дорога
            Rectangle()
                .fill(Color.gray)
                .frame(height: 150)
            
            // Линии на дороге
            HelpViewAnimation2()
            
            HStack {
                // Первая машина
                Image("redCar")
                    .resizable()
                    .frame(width: 60, height: 100)
                    .offset(y: car1Offset)
                    .animation(
                        Animation.linear(duration: 2)
                            .repeatForever(autoreverses: false)
                    )
                    .onAppear {
                        self.car1Offset = 500 
                    }
                
                // Вторая машина
                Image("blueCar")
                    .resizable()
                    .frame(width: 60, height: 100)
                    .offset(y: car2Offset)
                    .animation(
                        Animation.linear(duration: 2)
                            .repeatForever(autoreverses: false)
                    )
                    .onAppear {
                        self.car2Offset = 550
                    }
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct Animation2_Previews: PreviewProvider {
    static var previews: some View {
        Animation2()
    }
}

