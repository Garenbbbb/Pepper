//
//  SplashView.swift
//  pepper
//
//  Created by garen on 3/4/24.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
        
    var body: some View {
        ZStack {
            if self.isActive {
    
                ContentView()
            } else {
                Rectangle()
                    .background(Color.pink.opacity(0.8))
                Image("splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}

#Preview {
    SplashView()
}
