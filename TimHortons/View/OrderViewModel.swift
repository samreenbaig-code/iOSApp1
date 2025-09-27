//
//  OrderViewModel.swift
//  TimHortons
//
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var orders: [Order] = []

    // Add order
    func addOrder(_ order: Order) {
        orders.append(order)
    }

    // Group orders by just the date (ignoring time)
    var ordersGroupedByDate: [Date: [Order]] {
        Dictionary(grouping: orders) { order in
            // Strip time so that orders from same day group together
            let calendar = Calendar.current
            return calendar.startOfDay(for: order.pickupTime)
        }
    }
}
