//
//  ContentView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/7/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {

        
        Group{
            if viewModel.userSession == nil{
                LoginView()
            } else{
                if let user = viewModel.currentUser {
                    MainTabView(user: user)
                }
            }
        }
            
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack{
//            ContentView()
//        }
//    }
//}
