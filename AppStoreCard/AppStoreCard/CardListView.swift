//
//  CardListView.swift
//  AppStoreCard
//
//  Created by Ravi Tripathi on 13/02/21.
//

import SwiftUI

public struct CardListView: View {
    public init() {}
    public var body: some View {
        List {
            NavigationLink(destination: AppStoreCardView()) {
                Text("App Store Card")
            }
            NavigationLink(destination: AppStoreCardView()) {
                Text("iPad Widget List")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Card List View")
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}
