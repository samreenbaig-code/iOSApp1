import SwiftUI

struct OrderFormView: View {
    @EnvironmentObject var orderVM: OrderViewModel

    @State private var name: String = ""
    @State private var food: String = "Bagel"
    @State private var drink: String = "Coffee"
    @State private var pickupTime: Date = Date()

    let drinks = ["Coffee", "Latte", "Tea", "Iced Capp"]
    let foods = ["Bagel", "Donut", "Muffin"]

    var body: some View {
        ZStack {
            Color(".red")
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image("orderbkg")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal)

                Form {
                    Section(header: Label("Customer Info", systemImage: "person")) {
                        TextField("Your Name", text: $name)
                    }

                    Section(header: Label("Order Details", systemImage: "cart")) {
                        Picker("Drink", selection: $drink) {
                            ForEach(drinks, id: \.self) { Text($0) }
                        }

                        Picker("Food", selection: $food) {
                            ForEach(foods, id: \.self) { Text($0) }
                        }

                        DatePicker("Pickup Time", selection: $pickupTime, displayedComponents: .hourAndMinute)
                    }

                    // ✅ Submit Order Button
                    Section {
                        Button(action: {
                            let newOrder = Order(
                                name: name,
                                menuItem: food,
                                drink: drink,
                                pickupTime: pickupTime
                            )
                            orderVM.addOrder(newOrder)
                        }) {
                            Label("Submit Order", systemImage: "checkmark.circle.fill")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(12)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color("OrderPageBackground"))
            }
        }
        .navigationTitle("Place Order") // ✅ only ONCE, at the top level
    }
}
