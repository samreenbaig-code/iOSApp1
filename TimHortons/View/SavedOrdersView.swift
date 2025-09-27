//
//  SavedOrdersView.swift
//  TimHortons
//
//  Created by Abdulmohammad BAIG on 2025-09-24.
//

import SwiftUI

struct SavedOrdersView: View {
    @EnvironmentObject var orderVM: OrderViewModel
    
    var body: some View {
        List(orderVM.orders) { order in
            VStack(alignment: .leading) {
                Text("\(order.customerName)'s Order")
                    .font(.headline)
                Text("Drink: \(order.drink) | Food: \(order.food)")
                Text("Pickup at: \(format(order.pickupTime))")
                    .font(.caption)
            }
        }
        .navigationTitle("Saved Orders")
    }
    
    func format(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

