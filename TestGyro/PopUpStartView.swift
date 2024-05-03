//
//  PopUpStartView.swift
//  TestGyro
//
//  Created by Lazuardhi Imani Ahfar on 01/05/24.
//

import SwiftUI

struct PopUpStartView: View {
    @Binding var countdown: Int
        var body: some View {
            ZStack {
                if(countdown > 3){
                    Image(
                        "liat hape 1"
                    )
                }else{
                    Image(
                        "liat hape 2"
                    )
                }
                                
                Rectangle()
                    .fill(Color.gray.opacity(0.3)) // Adjust opacity as needed
                    .ignoresSafeArea()
            }
        }
    
    
}

#Preview {
    PopUpStartView(countdown: .constant(5))
}

