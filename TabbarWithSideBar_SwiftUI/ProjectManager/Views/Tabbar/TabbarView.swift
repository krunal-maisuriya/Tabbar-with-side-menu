//
//  TabbarView.swift
//  TabbarWithSideBar_SwiftUI
//
//  Created by Krunal Maisuriya on 20/02/2025.
//

import SwiftUI


struct MainRootView: View {
    
    @State private var showMenu: Bool = false
    @State var selectedIndex: Int = 0

    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                
                TabbarView(showMenu: $showMenu, selectedIndex: $selectedIndex)
                
                if showMenu {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                }
                
                SideMenuView(showMenu: $showMenu, selectedIndex: $selectedIndex)
                    .offset(x: showMenu ? 0 : -300)

            }
        }
    }
}


struct TabbarView: View {
    
    @Binding var showMenu: Bool
    @Binding var selectedIndex: Int

    let tabs = ["house.fill", "cart.fill", "person.fill", "gearshape.fill"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            ZStack(alignment: .leading) {
                
                switch selectedIndex {
                case 0:
                    DashboardView()

                case 1:
                    CartView(showMenu: $showMenu)
                    
                case 2:
                    ProfileView()
                    
                case 3:
                    SettingsView()
                    
                default:
                    EmptyView()
                }
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Spacer()
                    
                    ZStack(alignment: .center) {
                        Color.clear
                        
                        GeometryReader { geo in
                            let width = geo.size.width / CGFloat(tabs.count)
                            
                            /// Animated circle
                            Circle()
                                .fill(.black)
                                .frame(width: 60, height: 60)
                                .offset(x: width * CGFloat(selectedIndex) + width/2 - 30, y: 0)
                                .animation(.spring(response: 0.4, dampingFraction: 0.7), value: selectedIndex)
                        }
                        .frame(height: 60)
                        
                        HStack {
                            ForEach(0..<tabs.count, id: \.self) { index in
                                Spacer()
                                
                                TabbarItems(icon: tabs[index], isSelected: selectedIndex == index) {
                                    withAnimation { selectedIndex = index }
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    .frame(height: 70.0)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .padding(.horizontal, 15.0)
                    .padding(.bottom, 10.0)
                }
                
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TabbarView(showMenu: .constant(false), selectedIndex: .constant(1))
}
