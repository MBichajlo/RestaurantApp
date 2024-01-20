//
//  tileView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 20/01/2024.
//

import SwiftUI

struct Tile:View {
    let category:String
    let color:Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .strokeBorder(color,lineWidth: 3)
                .background(RoundedRectangle(cornerRadius: 50).fill(color.opacity(0.3)))
            Text(category)
                .modifier(TitleText())
                .padding(20)
                .multilineTextAlignment(.center)
        }.frame(width: 170, height: 170)
    }
}

#Preview {
    Tile(category: "Test", color: Color.red)
}
