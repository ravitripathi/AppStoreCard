//
//  ContentView.swift
//  AppStoreCard
//
//  Created by Ravi Tripathi on 30/01/21.
//

import SwiftUI

struct ContentView: View {
    
    var cardData: [CardData] = {
        
        var cd = [CardData]()
        for i in 1...30 {
            cd.append(CardData(id: i, title: "This is a great app", subTitle: "This is the app description"))
        }
        return cd
        
        
        
    }()
    var currentDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date())
    }
    
    @State var pickedNumber: Int = -1
    @State var showDetail = false
    @Namespace var namespace
    
    var body: some View {
        if !showDetail {
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(cardData) { cD in
                            Button(action: {
                                withAnimation {
                                    pickedNumber = cD.id
                                    showDetail = true
                                }
                                
                            }) {
                                CardView(title: cD.title, subTitle: "\(cD.subTitle) : \(cD.id)")
                            }.buttonStyle(tapBounceButtonStyle())
                            .padding()
                            .matchedGeometryEffect(id: cD.id, in: namespace)
                        }
                    }
                }
            }.navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack(alignment: .leading) {
                        Text(currentDateString).font(.subheadline)
                            .fontWeight(.light)
                        Text("Today").font(.title)
                            .fontWeight(.heavy)
                    }
                }
            }
        }  else {
            ZStack {
                ExpandedView(title: cardData[pickedNumber].title, subTitle: cardData[pickedNumber].subTitle, cancelTapAction: {
                    withAnimation {
                        showDetail = false
                    }
                })
                .padding()
                .foregroundColor(.black)
            }
            .matchedGeometryEffect(id: pickedNumber, in: namespace)
        }
    }
}

/// https://stackoverflow.com/questions/60882198/swiftui-draggesture-in-scrollview-doesnt-register-scrolling-when-swipe-begins
struct tapBounceButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut)
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
