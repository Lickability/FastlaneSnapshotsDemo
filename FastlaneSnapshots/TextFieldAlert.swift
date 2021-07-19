//
//  TextFieldAlert.swift
//  FastlaneSnapshots
//
//  Created by Daisy Ramos on 7/14/21.
//

import SwiftUI

struct TextFieldAlert<Presenting>: View where Presenting: View {

    @Binding var isShowing: Bool
    @Binding var text: String
    
    let presenting: Presenting
    let title: String

    var body: some View {
        GeometryReader { (deviceSize: GeometryProxy) in
            ZStack {
                presenting
                    .disabled(isShowing)
                VStack {
                    Text(title)
                    TextField("Enter a game name", text: $text)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .id(isShowing)
                    Divider()
                    HStack {
                        Button(action: {
                            withAnimation {
                                isShowing.toggle()
                            }
                        }) {
                            Text("Dismiss")
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .frame(
                    width: deviceSize.size.width*0.7,
                    height: deviceSize.size.height*0.7
                )
                .shadow(radius: 0.5)
                .opacity(isShowing ? 1 : 0)
            }
        }
    }
}


extension View {

    func textFieldAlert(isShowing: Binding<Bool>,
                        text: Binding<String>,
                        title: String) -> some View {
        UITextField.appearance().clearButtonMode = .whileEditing
        return TextFieldAlert(isShowing: isShowing,
                       text: text,
                       presenting: self,
                       title: title)
    }
}

