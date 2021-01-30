//
//  CardView.swift
//  AppStoreCard
//
//  Created by Ravi Tripathi on 30/01/21.
//

import SwiftUI

struct CardView: View {
    @Environment(\.colorScheme) var colorScheme
    var title: String
    var subTitle: String
    var body: some View {
        VStack {
            VStack {
                Text(title)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                Text(subTitle)
            }.padding()
        }
        .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: 350, idealHeight: nil, maxHeight: 350, alignment: .center)
        .background(colorScheme == .dark ? Color.secondary : Color.white)
        .cornerRadius(10)
        .shadow(radius: 15)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "This is a great app", subTitle: "This is the app description")
    }
}
