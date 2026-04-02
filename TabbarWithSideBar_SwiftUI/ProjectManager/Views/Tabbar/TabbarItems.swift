//
//  TabbarItems.swift
//  TabbarWithSideBar_SwiftUI
//
//  Created by Krunal Maisuriya on 02/04/2026.
//

import SwiftUI

struct TabbarItems: View {
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                VStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: isSelected ? 26 : 24, height: isSelected ? 26 : 24, alignment: .center)
                        .foregroundColor(isSelected ? .white : .black)
                        .padding()
                }
            }.frame(maxWidth: .infinity)
        }
    }
}
