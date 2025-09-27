import SwiftUI

struct SavedOrdersView: View {
    @EnvironmentObject var orderVM: OrderViewModel

    var body: some View {
        List {
            ForEach(sortedDates, id: \.self) { date in
                Section(header: Text(formattedDate(date))) {
                    ForEach(orders(for: date)) { order in
                        OrderRow(order: order)
                    }
                }
            }
        }
        .navigationTitle("Order History")
    }

    // MARK: - Helpers

    private var sortedDates: [Date] {
        Array(orderVM.ordersGroupedByDate.keys).sorted(by: >)
    }

    private func orders(for date: Date) -> [Order] {
        orderVM.ordersGroupedByDate[date] ?? []
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct OrderRow: View {
    let order: Order

    var body: some View {
        VStack(alignment: .leading) {
            Text(order.name).font(.headline)
            Text("\(order.menuItem) + \(order.drink)").font(.subheadline)
            Text("Pickup: \(order.pickupTime, style: .time)").font(.caption)
        }
    }
}
