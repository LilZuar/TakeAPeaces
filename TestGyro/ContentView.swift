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
    @State var gyroData: CMRotationRate = CMRotationRate(x: 0, y: 0, z: 0)
    @State var timer: Timer?
    @State private var globePosition = CGPoint(x: 170, y: 480)
    @State var duration: Int = 20
    @State var score: Int = 0
    
    let timerGame = Timer.publish(every: 1, on: .main, in: .default).autoconnect()

    
    
    let maxX: CGFloat = 350 // Maximum x position
    let maxY: CGFloat = 750 // Maximum y position
    let minY: CGFloat = 100
    
    
    //445,480 210,170
    
    
    var body: some View {
        ZStack {
            Image("Toiletpage")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                Image("pipisKanan")
                    .resizable()
                    .frame(width: 200,height: 1500)
                    .position(globePosition)
                    .onAppear{
                        startGyros()
                        globePosition.x = Double.random(in: 10...350)
                        globePosition.y = Double.random(in: 351...600)
                    }
                Text("\(duration)")
                    .foregroundColor(Color.black)
                Text("Score: \(score)")
                    .foregroundColor(Color.black)
                
                
            }
            .onReceive(timerGame, perform: { _ in
                if duration > 0 {
                    duration -= 1
                    countPoint()
                }
            })
            .padding()
        }
    }
    
    
        func startGyros() {
                guard motionManager.isGyroAvailable else { return }
                motionManager.gyroUpdateInterval = 1.0 / 50.0
                motionManager.startGyroUpdates(to: .main) { gyroData, error in
                    guard let gyroData = gyroData else { return }
                    updateGlobePosition(with: gyroData.rotationRate)
                }
            }
            
        func updateGlobePosition(with rotationRate: CMRotationRate) {
            let sensitivity: CGFloat = 10 // Adjust sensitivity as needed
            
            // Calculate the change in position based on gyroscope data
            let deltaX = CGFloat(rotationRate.y) * sensitivity
            let deltaY = CGFloat(rotationRate.x) * sensitivity
            
            // Update the globe position, ensuring it stays within bounds
            let newX = min(max(globePosition.x + deltaX, 0), maxX)
            let newY = min(max(globePosition.y + deltaY, minY), maxY)
            
            // Update the globe position
            DispatchQueue.main.async {
                self.globePosition = CGPoint(x: newX, y: newY)
            }
        }
    
    func countPoint(){
        let minBoxX: CGFloat = 170
        let minBoxY: CGFloat = 445
        let maxBoxX: CGFloat = 210
        let maxBoxY: CGFloat = 480
        
        
        if minBoxX <= globePosition.x && globePosition.x <= maxBoxX{
            if minBoxY <= globePosition.y && globePosition.y <= maxBoxY{
                score += 1
            }
        }
        
        
    }
    
}





#Preview {
    ContentView()
}
