
//
//  Charts.swift
//  MemoryGame
//
//  Created by student on 05/12/2024.
//

import SwiftUI

import Charts


struct Charts: View {
    struct Temp: Identifiable {
        let id = UUID()
        let day:String
        let value:Double
    }


    let data = [
        Temp(day: "pon", value: 2),
        Temp(day: "wt", value:5),
        Temp(day: "sr", value: 10),
        Temp(day: "cz", value: 4),
        Temp(day: "poptn", value: 20),
    ]
    var body: some View {
        Chart(data) {
            temp in
            BarMark(
                x: .value("day", temp.day),
                y: .value("value", temp.value))
        }
    }
}

#Preview {
    Charts()
}


