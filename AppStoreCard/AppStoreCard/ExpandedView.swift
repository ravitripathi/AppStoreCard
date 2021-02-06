//
//  ExpandedView.swift
//  AppStoreCard
//
//  Created by Ravi Tripathi on 30/01/21.
//

import SwiftUI

struct ExpandedView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentation
    @Namespace private var animation
    @State var shouldScale = false
    var title: String
    var subTitle: String
    var cancelTapAction : () -> ()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "xmark.circle.fill")
                    .padding()
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({_ in
                            withAnimation {
                                shouldScale = true
                            }
                        }).onEnded({ _ in
                            cancelTapAction()
                        })
                    )
            }
            Spacer()
            VStack {
                Text(title)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                Text(subTitle)
            }.padding()
            Spacer()
        }.background(colorScheme == .dark ? Color.secondary : Color.white)
        .cornerRadius(10)
        .shadow(radius: 15)
        .scaleEffect(shouldScale ? 0.95 : 1.0)
        .gesture(
            DragGesture(minimumDistance: 4, coordinateSpace: .local).onChanged({_ in
                withAnimation {
                    shouldScale = true
                }
            }).onEnded({ _ in
                cancelTapAction()
            })
        )
        
    }
}

struct ExpandedView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedView(title: "This is a great app", subTitle: "This is the app description", cancelTapAction: {
            
        })
    }
}
