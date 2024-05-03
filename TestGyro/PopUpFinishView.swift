//
//  PopUpFinishView.swift
//  TestGyro
//
//  Created by Lazuardhi Imani Ahfar on 01/05/24.
//

import SwiftUI

struct PopUpFinishView: View {
    
    @Binding var score: Int
    
    var body: some View {
        ZStack {
            HStack {
                
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
                
//                NavigationLink {
//                    GameView()
//                } label: {
//                    Text("retry")
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(Color.blue)
//                        .padding()
//                }
//                
//                Spacer()
//                
//                NavigationLink {
//                    ContentView()
//                } label: {
//                    Text("home")
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(Color.blue)
//                        .padding()
//                        .background(Color.red)
//                }
            }
            Rectangle()
                .fill(Color.white.opacity(0.4)) // Adjust opacity as needed
                .ignoresSafeArea()
        }
    }
}

#Preview {
    PopUpFinishView(score: .constant(15))
}
