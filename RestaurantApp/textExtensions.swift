//
//  textExtensions.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 10/01/2024.
//

import SwiftUI

struct TitleText:ViewModifier,Animatable{
    func body(content: Content) -> some View {
        content
            .font(.custom("Times New Roman", size:28))
            

            .foregroundColor(.white)
            
    }
    
    
}

struct menuItemName:ViewModifier,Animatable{
    func body(content: Content) -> some View {
        content
            .font(.custom("Times New Roman", size:40))
            

            .foregroundColor(.white)
            
    }
    
    
}
struct appName:ViewModifier,Animatable{
    func body(content: Content) -> some View {
        content
            .font(.custom("Times New Roman", size:40))
            

            .foregroundColor(.white)
            
    }
    
    
}
