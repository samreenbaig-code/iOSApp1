//
//  Order.swift
//  TimHortons
//
//
import Foundation

struct Order: Identifiable {
    let id = UUID()
    let name: String
    let menuItem: String
    let drink: String
    let pickupTime: Date
}
