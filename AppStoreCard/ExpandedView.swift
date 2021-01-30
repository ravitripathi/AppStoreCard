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
    var title: String
    var subTitle: String
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .gesture( TapGesture()
                                    .onEnded { _ in
                                        presentation.wrappedValue.dismiss()
                                    }
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
        }.navigationBarHidden(true)
    }
}

struct ExpandedView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedView(title: "This is a great app", subTitle: "This is the app description")
    }
}
