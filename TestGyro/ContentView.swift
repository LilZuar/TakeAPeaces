//
//  ContentView.swift
//  TestGyro
//
//  Created by Lazuardhi Imani Ahfar on 28/04/24.
//

import CoreMotion
import SwiftUI



struct ContentView: View {
    
    let motionManager = CMMotionManager()
    var gyroData: CMRotationRate = CMRotationRate(x: 0, y: 0, z: 0)
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Rotation Rate:")
            Text("X: \(gyroData.x)")
            Text("Y: \(gyroData.y)")
            Text("Z: \(gyroData.z)")
            
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
