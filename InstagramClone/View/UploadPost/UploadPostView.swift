//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/7/22.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack{
            
            //When onDismiss is called it sets the postImage from the selectedImage,
            //this resets the state and changes the output of this if logic.
            if postImage == nil{
                
                //Pick a photo button
                Button {
                    imagePickerPresented.toggle()
                    
                } label: {
                    VStack{
                        Image(systemName: "plus")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                        
                        Text("Upload a photo")
                            .font(.largeTitle)
                    }
                    .foregroundColor(.black)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 2)
                    }
                }
                //The image selection pop-up, runs the loadImage function when the sheet is dismissed
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    //Selects an image from the UIKit image picker, sets that photo to selectedImage var
                    ImagePicker(image: $selectedImage)
                })
                .padding(.top, 24)
                
                //if the postImage exists, unwraps var using the if let statement
            } else if let image = postImage{
                HStack(alignment: .top){
                    
                    //The selected image display
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter a caption.", text: $captionText)
                        .padding(36)
                        
                        
                }
                .padding()
                
                Button {
                    //todo
                    if let image = selectedImage {
                        viewModel.uploadPost(caption: captionText, image: image) { _ in
                            captionText = ""
                            postImage = nil
                            tabIndex = 0
                        }
                    }
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                .padding()
                
            }
            
            Spacer()
            
        }
    }
}

extension UploadPostView{
    func loadImage(){
        //if the selectedImage is set we set it to the postImage(the UIKit to swiftui image conversion)
        guard let selectedImage = selectedImage else {return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(2))
    }
}
