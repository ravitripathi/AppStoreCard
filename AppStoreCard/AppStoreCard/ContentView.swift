//
//  ContentView.swift
//  AppStoreCard
//
//  Created by Ravi Tripathi on 30/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var pressed: Bool = false
        var cardData: [CardData] = {
            
            var pika: Int?
            var chu: Int?
            
            var val = nil < 5
//            res = pika! + chu!
            
            var cd = [CardData]()
            for i in 1...30 {
                cd.append(CardData(id: i, title: "This is a great app", subTitle: "This is the app description"))
            }
            return cd
            
            
            
        }()

    var body: some View {
        List(cardData) { cD in
            Button(action: { self.pressed.toggle() }) {
                CardView(title: cD.title, subTitle: cD.subTitle)
                    .animation(.easeInOut)
            }.buttonStyle(tapBounceButtonStyle())
        }
    }
}

/// https://stackoverflow.com/questions/60882198/swiftui-draggesture-in-scrollview-doesnt-register-scrolling-when-swipe-begins
struct tapBounceButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardData: Identifiable {
    var id: Int
    var title: String
    var subTitle: String
}
