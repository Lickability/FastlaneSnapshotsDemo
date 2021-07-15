//
//  GameView.swift
//  FastlaneSnapshots
//
//  Created by Daisy Ramos on 7/14/21.
//

import SwiftUI

struct GameView: View {
    @State private var isShowingAlert = false
    @State private var textInput = "Scrabble"

    var body: some View {
        NavigationView {
            List {
                AvatarImageView(viewModel: .init(image: Image("ashli"), playerColor: .blue))
                AvatarImageView(viewModel: .init(image: Image("jillian"), playerColor: .pink))
                AvatarImageView(viewModel: .init(image: Image("daisy"), playerColor: .green))
            }
            .navigationTitle(textInput)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isShowingAlert.toggle()
                        }
                    }) {
                        Image(systemName: "ellipsis")
                    }
                }
            }
        }
        .textFieldAlert(isShowing: $isShowingAlert, text: $textInput, title: "Game Title")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
