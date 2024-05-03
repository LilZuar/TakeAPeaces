//
//  GameView.swift
//  TestGyro
//
//  Created by Lazuardhi Imani Ahfar on 01/05/24.
//

import SwiftUI

struct GameView: View {
    @State var isStart = false
    @State var countdown = 5
    
    @State var durationGame: Int = 20
    @State var score: Int = 2
    
    let soundEffect = SoundPlayer()

    var body: some View {
        ZStack {
            if(!isStart){
                Image("ToiletAirBirupng")
                    .resizable()
                    .opacity(0.2)
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                
                PopUpStartView(countdown: $countdown)
                    .navigationBarBackButtonHidden()
                    .onAppear{
                        startCountdown()
                    }
            }else{
                if durationGame > 0 {
                    GyroView(durationGame: $durationGame, score: $score)
                        .onDisappear{
                            soundEffect.stopSound()
                        }
                        .navigationBarBackButtonHidden()
                }else{
                    Image("ToiletAirBirupng")
                        .resizable()
                        .opacity(0.2)
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    
                    PopUpFinishView(score: $score)
//                        .navigationBarBackButtonHidden()
                }
                
            }
        }
    }
    
    
    func startCountdown() {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if countdown > 0 {
                print(countdown)
                countdown -= 1
            } else {
                timer.invalidate()
                isStart = !isStart
            }
        }
    }
}

#Preview {
    GameView()
}
