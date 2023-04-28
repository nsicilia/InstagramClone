//
//  CustomInputView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 3/9/23.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    
    var action: () -> Void
    
    var body: some View {
        VStack{
            
            //divider
            Divider()
                .padding(.bottom, 8)
            //Textinput and send button
            HStack{
                TextField("Comment..", text: $inputText)
                    .textFieldStyle(.plain)
                    .frame(minHeight: 30)
                
                Button (action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 8)
        
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var boolHander : () -> Void = {  }
    
    static var previews: some View {
        CustomInputView(inputText: .constant("Comment.."), action: boolHander)
    }
}
