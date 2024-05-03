//
//  HomePageView.swift
//  TestGyro
//
//  Created by Lazuardhi Imani Ahfar on 01/05/24.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image ("HomePage")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                HStack{
                    
                    NavigationLink {
                        GameView()
                    } label: {
                        Image ("doorbutton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 320, height: 320)
                            .position(x: 267,y: 420)
                    }
                    
                    
                }
                
            }
        }
    }
}

#Preview {
    HomePageView()
}
