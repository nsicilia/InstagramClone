//
//  TextArea.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 1/12/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty{
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea(text: .constant(""), placeholder: "Placeholder")
    }
}
