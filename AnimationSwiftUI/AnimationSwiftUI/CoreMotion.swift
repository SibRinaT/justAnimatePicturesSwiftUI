//
//  CoreMotion.swift
//  AnimationSwiftUI
//
//  Created by Ainur on 04.04.2024.
//

import SwiftUI
import CoreMotion

struct CoreMotion: View {
    @State private var accelerometerData = CMAcceleration(x: 0, y: 0, z: 0)
     @State private var gyroscopeData = CMRotationRate(x: 0, y: 0, z: 0)
     let motionManager = CMMotionManager()

     var body: some View {
         VStack {
             Text("Acceleration Data:")
             Text("X: \(accelerometerData.x)")
             Text("Y: \(accelerometerData.y)")
             Text("Z: \(accelerometerData.z)")
             Divider()
             Text("Gyroscope Data:")
             Text("X: \(gyroscopeData.x)")
             Text("Y: \(gyroscopeData.y)")
             Text("Z: \(gyroscopeData.z)")
         }
         .onAppear {
             self.startMotionUpdates()
         }
     }

     func startMotionUpdates() {
         if motionManager.isAccelerometerAvailable && motionManager.isGyroAvailable {
             motionManager.accelerometerUpdateInterval = 0.1
             motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
                 guard let data = data else { return }
                 self.accelerometerData = data.acceleration
             }

             motionManager.gyroUpdateInterval = 0.1
             motionManager.startGyroUpdates(to: .main) { (data, error) in
                 guard let data = data else { return }
                 self.gyroscopeData = data.rotationRate
             }
         }
     }
}

#Preview {
    CoreMotion()
}
