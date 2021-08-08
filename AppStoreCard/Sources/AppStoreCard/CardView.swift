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
                Text("This is the top line on this card")
                Spacer()
                VStack {
                    Text(title)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                    Text(subTitle)
                }
                Spacer()
                Text("This is the bottom line on this card")
            }
        }
        .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: 350, idealHeight: nil, maxHeight: 350, alignment: .center)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(10)
        .shadow(color: Color("Shadow", bundle: Constants.currentBundle).opacity(colorScheme == .light ? 1.0: 0.2), radius: 8, x: 0, y: 3)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "This is a great app", subTitle: "This is the app description")
    }
}

class Constants {
    static let currentBundle = Bundle(for: Constants.self)
}
