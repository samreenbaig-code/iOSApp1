//
//  Home.swift
//  TimHortons
//
//  Created by Abdulmohammad BAIG on 2025-09-25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 16) {
            // Greeting
            VStack(alignment: .leading, spacing: 8) {
                Text("Good morning,")
                    .font(.title3)
                    .fontWeight(.medium)

                Text("Owen.")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // Tabs
            HStack {
                Text("For You")
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .background(Color.brown.opacity(0.1))
                    .clipShape(Capsule())

                Text("Order Again")
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // Early Access Card
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(UIColor.systemGray6))
                .frame(height: 100)
                .overlay(
                    HStack {
                        Image(systemName: "creditcard.fill")
                            .resizable()
                            .frame(width: 50, height: 30)
                            .padding(.leading)

                        VStack(alignment: .leading) {
                            Text("Early Access")
                                .fontWeight(.semibold)
                            Text("Introducing Tims® Financial!")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding()
                    }
                )
                .padding(.horizontal)

            // Grid of Features
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2), spacing: 16) {
                GridCard(image: "cup.and.saucer.fill", title: "Order", subtitle: "Start an Order")
                GridCard(image: "gift.fill", title: "Rewards", subtitle: "0 Points")
                GridCard(image: "tag.fill", title: "Offers")
                GridCard(image: "bag.fill", title: "Delivery")
                GridCard(image: "giftcard.fill", title: "Give")
                GridCard(image: "heart.fill", title: "Community")
                GridCard(image: "location.fill", title: "Restaurant")
                GridCard(image: "cart.fill", title: "Tims NHL®")
            }
            .padding(.horizontal)

            Spacer()

            // Bottom Tab Bar
            HStack {
                TabIcon(icon: "house.fill", title: "Home", isActive: true)
                TabIcon(icon: "qrcode.viewfinder", title: "Scan")
                TabIcon(icon: "safari.fill", title: "Discover")
            }
            .padding()
            .background(Color.white.shadow(radius: 2))
        }
    }
}

struct GridCard: View {
    var image: String
    var title: String
    var subtitle: String? = nil

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .padding(8)
                .background(Color.brown.opacity(0.1))
                .clipShape(Circle())

            Text(title)
                .font(.headline)

            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(15)
    }
}

struct TabIcon: View {
    var icon: String
    var title: String
    var isActive: Bool = false

    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(isActive ? .red : .gray)
            Text(title)
                .font(.caption)
                .foregroundColor(isActive ? .red : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}
