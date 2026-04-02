//
//  CartView.swift
//  TabbarWithSideBar_SwiftUI
//
//  Created by Krunal Maisuriya on 02/04/2026.
//

import SwiftUI

struct CartView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                Color.brown
                    .edgesIgnoringSafeArea(.vertical)
                
                VStack(alignment: .leading) {
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }) {
                        Image("ic_menu")
                            .resizable()
                            .frame(width: 35, height: 30, alignment: .center)
                    }
                    .padding(.leading, 25)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    Text("Cart View")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    CartView(showMenu: .constant(false))
}
