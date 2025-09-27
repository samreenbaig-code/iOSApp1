import SwiftUI

// MARK: - Navigation Routes
enum Route: Hashable {
    case orderForm
    case savedOrders
}

// MARK: - WelcomeView
struct WelcomeView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                // ✅ Background Image
                Image("wlcomebkg") // Add image to Assets.xcassets
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 25) {
                    Spacer()

                    // Title
                    Text("Welcome to")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.white)

                    Text("Tim Hortons")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)

                    Spacer()

                    // ☕️ Start Ordering Button
                    Button(action: {
                        path.append(Route.orderForm)
                    }) {
                        Label("Start Ordering", systemImage: "cup.and.saucer.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 3)
                    }
                    .padding(.horizontal, 40)

                    // 📦 View Saved Orders Button (MATCHING STYLE)
                    Button(action: {
                        path.append(Route.savedOrders)
                    }) {
                        Label("View Saved Orders", systemImage: "list.bullet")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red) // slightly lighter red
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 3)
                    }
                    .padding(.horizontal, 40)

                    Spacer().frame(height: 50)
                }
                .padding(.bottom, 30)
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .orderForm:
                    OrderFormView()
                case .savedOrders:
                    SavedOrdersView()
                }
            }
        }
    }
}
