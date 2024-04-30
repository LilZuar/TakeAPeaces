////
////  GyroView.swift
////  TestGyro
////
////  Created by Lazuardhi Imani Ahfar on 30/04/24.
////
//
//import SwiftUI
//import CoreMotion
//
//struct GyroView: View {
//    
//    let motionManager = CMMotionManager()
//    @State var gyroData: CMRotationRate = CMRotationRate(x: 0, y: 0, z: 0)
//    @State var timer: Timer?
//    @State private var globePosition = CGPoint(x: 175, y: 0)
//    
//    
//    
//    let maxX: CGFloat = 350 // Maximum x position
//    let maxY: CGFloat = 750 // Maximum y position
//    let minY: CGFloat = 100
//    
//    
//    var body: some View {
//        ZStack {
//            Image("pipisKanan")
//                .resizable()
//                .frame(width: 200,height: 1500)
//                .position(globePosition)
//                .onAppear{
//                    startGyros()
//                    globePosition.x = Double.random(in: 10...350)
//                    globePosition.y = Double.random(in: 351...500)
//            }
//        }
//    }
//    
//    
//    
//    
//    func startGyros() {
//            guard motionManager.isGyroAvailable else { return }
//            motionManager.gyroUpdateInterval = 1.0 / 50.0
//            motionManager.startGyroUpdates(to: .main) { gyroData, error in
//                guard let gyroData = gyroData else { return }
//                updateGlobePosition(with: gyroData.rotationRate)
//            }
//        }
//        
//    func updateGlobePosition(with rotationRate: CMRotationRate) {
//        let sensitivity: CGFloat = 10 // Adjust sensitivity as needed
//        
//        // Calculate the change in position based on gyroscope data
//        let deltaX = CGFloat(rotationRate.y) * sensitivity
//        let deltaY = CGFloat(rotationRate.x) * sensitivity
//        
//        // Update the globe position, ensuring it stays within bounds
//        let newX = min(max(globePosition.x + deltaX, 0), maxX)
//        let newY = min(max(globePosition.y + deltaY, minY), maxY)
//        // Update the globe position
//        DispatchQueue.main.async {
//            self.globePosition = CGPoint(x: newX, y: newY)
//        }
//    }
//}
//
//#Preview {
//    GyroView()
//}
