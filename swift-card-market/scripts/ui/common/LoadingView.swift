//
//  LoadingView.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 04/12/2021.
//

import SwiftUI

struct LoadingView<T> : View where T : View {

    @Binding var isShowing: Bool
    
    var text:String
    var content:() -> T

    var body: some View {
        ZStack(alignment: .center) {

            self.content()
                .disabled(self.isShowing)
                .blur(radius: self.isShowing ? 3 : 0)

            VStack {
                Text(self.text)
                ProgressView()
                    .progressViewStyle(.circular)
            }
            .opacity(self.isShowing ? 1 : 0)
            .ignoresSafeArea()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isShowing: .constant(true), text: "Loading...") {
            Text("Content")
        }
    }
}
