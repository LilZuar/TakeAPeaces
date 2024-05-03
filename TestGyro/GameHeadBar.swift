//
//  GameHeadBar.swift
//  TestGyro
//
//  Created by Lazuardhi Imani Ahfar on 01/05/24.
//

import SwiftUI

struct GameHeadBar: View {
    
    @Binding var score: Int
    @Binding var durationGame: Int
    
    @State var toilet: String = "Toilet Kosong"
    @State var bladder: String = "Bladder Penuh"
    
    var body: some View {
        HStack(spacing: 60){
            if durationGame > 9 && durationGame <= 12 {
                Image("Bladder 60")
                    .resizable()
                    .aspectRatio(contentMode: .fit)            }
            else if durationGame > 3 && durationGame <= 9 {
                Image("Bladder 30")
                    .resizable()
                    .aspectRatio(contentMode: .fit)            } 
            else if durationGame <= 3 {
                Image("Bladder Kosong")
                    .resizable()
                    .aspectRatio(contentMode: .fit)            }
            else{
                Image("Bladder Penuh")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
            Spacer()
            
            
            if score > 6 && score <= 12 {
                Image("Toilet 30")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if score > 12 && score <= 18 {
                Image("Toilet 60")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if score > 18 {
                Image("Toilet Full")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image("Toilet Kosong")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
        }
    }

}

#Preview {
    GameHeadBar(score: .constant(1), durationGame: .constant(20))
}
