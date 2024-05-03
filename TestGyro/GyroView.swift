//
//  GyroView.swift
//  TestGyro
//
//  Created by Lazuardhi Imani Ahfar on 30/04/24.
//

import SwiftUI
import CoreMotion
import AVFoundation


struct GyroView: View {
    
    
    
    let motionManager = CMMotionManager()
    let soundEffect = SoundPlayer()

    @State var gyroData: CMRotationRate = CMRotationRate(x: 0, y: 0, z: 0)
    @State var timer: Timer?
    @State private var globePosition = CGPoint(x: 0, y: 0)
    @Binding var durationGame: Int
    @Binding var score: Int
    
    
    
    @State var pipisOpacity: Double = 0.0
    
    let timerGame = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    let timerHeptic = Timer.publish(every: 1/24, on: .main, in: .default).autoconnect()

    
    
    let maxX: CGFloat = 350 // Maximum x position
    let maxY: CGFloat = 750 // Maximum y position
    let minY: CGFloat = 100
    
    let minBoxX: CGFloat = 165
    let minBoxY: CGFloat = 440
    let maxBoxX: CGFloat = 215
    let maxBoxY: CGFloat = 485
    
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                Image("ToiletAirBirupng")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                Image("Toilet Air Oren")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .opacity(pipisOpacity)
                    .ignoresSafeArea()
            }
            VStack (alignment: .leading){
                GameHeadBar(score: $score, durationGame: $durationGame)
            }
            .ignoresSafeArea()
            VStack {
                Image("pipisKanan")
                    .resizable()
                    .frame(width: 150, height: 1500)
                    .position(globePosition)
                    .onAppear{
                        if durationGame > 0{
                            soundEffect.playSound(soundName: "PissSound", soundExtension: "mp3")
                        }else{
                            soundEffect.stopSound()
                        }
                        
                        startGyros()
                        globePosition.x = Double.random(in: 10...350)
                        globePosition.y = Double.random(in: 351...600)
                    }
            }
            .onReceive(timerGame, perform: { _ in
                    if durationGame > 0 {
                        durationGame -= 1
                        countPoint()
                        soundEffect.playSound(soundName: "PissTap", soundExtension: "mp3")
                    }
//                else{
//                        PopUpFinishView()
//                    }
                
            })
            .onReceive(timerHeptic, perform: { _ in
                if minBoxX <= globePosition.x && globePosition.x <= maxBoxX{
                    if minBoxY <= globePosition.y && globePosition.y <= maxBoxY{
                        
                        let generator = UIImpactFeedbackGenerator(style: .soft)
                        generator.impactOccurred()
                        
                                                
//                        soundEffect.playSound(soundName: "PissTap", soundExtension: "mp3")
                        
                    }
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
        let sensitivity: CGFloat = 8 // Adjust sensitivity as needed
        let durationGame = durationGame
        // Calculate the change in position based on gyroscope data
        let deltaX = CGFloat(rotationRate.y) * sensitivity
        var deltaY: CGFloat
        
        if durationGame < 6{
            deltaY = CGFloat(rotationRate.x) * sensitivity + CGFloat(0.8)
        }else{
            deltaY = CGFloat(rotationRate.x) * sensitivity
        }
        
        
        // Update the globe position, ensuring it stays within bounds
        let newX = min(max(globePosition.x + deltaX, 0), maxX)
        let newY = min(max(globePosition.y + deltaY, minY), maxY)
        
        // Update the globe position
        DispatchQueue.main.async {
            self.globePosition = CGPoint(x: newX, y: newY)
        }
    }
    
    
    func stopGyros() {
       if self.timer != nil {
          self.timer?.invalidate()
          self.timer = nil


          self.motionManager.stopGyroUpdates()
       }
    }

    func countPoint(){
        if minBoxX <= globePosition.x && globePosition.x <= maxBoxX{
            if minBoxY <= globePosition.y && globePosition.y <= maxBoxY{
                score += 1
                pipisOpacity += 0.08
                if score == 7 || score == 13 || score == 19{
                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                    generator.impactOccurred()
                }
            }
        }
    }
    


}

#Preview {
    GyroView(durationGame: .constant(20), score: .constant(10))
}
