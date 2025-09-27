//
//  WelcomeSplashView.swift
//  TimHortons
//
//

import SwiftUI

struct WelcomeSplashView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            if isActive {
                WelcomeView() // Your main home screen with buttons
            } else {
                ZStack {
                    Image("splashbkg") // your background image
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    Image("logoImage") // your logo image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}
