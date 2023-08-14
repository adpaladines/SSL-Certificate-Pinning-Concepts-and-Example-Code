//
//  MainPageView.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 8/2/23.
//

import SwiftUI

struct MainPageView: View {
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(.list)
                .navigationDestination(for: MyPage.self) { page in
                    coordinator.getPage(page)
                }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
            .environmentObject(Coordinator())
    }
}
