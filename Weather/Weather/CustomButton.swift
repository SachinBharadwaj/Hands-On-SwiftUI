//
//  CustomButton.swift
//  Weather
//
//  Created by Sachin Bharadwaj on 12/05/21.
//

import SwiftUI

struct CustomButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .frame(width: 340, height: 60, alignment: .center)
                .foregroundColor(Color("startingColor"))
                .font(.system(size: 18, weight: .bold))
                .background(Color.white)
                .cornerRadius(10.0)
                .shadow(color: Color.blue.opacity(0.4), radius: 5, x: 2, y: 2)
        })
    }
}
