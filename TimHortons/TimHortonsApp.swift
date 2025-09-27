//
//  TimHortonsApp.swift
//  TimHortons
//
//

import SwiftUI

@main
struct TimHortonsApp: App {
    @StateObject var orderVM = OrderViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(orderVM)
        }
    }
}

