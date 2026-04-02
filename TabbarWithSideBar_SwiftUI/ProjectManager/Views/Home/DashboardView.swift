//
//  DashboardView.swift
//  TabbarWithSideBar_SwiftUI
//
//  Created by Krunal Maisuriya on 02/04/2026.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Dashboard View")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    DashboardView()
}
