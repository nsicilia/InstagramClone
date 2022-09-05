//
//  Extensions.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 9/2/22.
//

import UIKit

extension UIApplication{
    func endEdit(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
