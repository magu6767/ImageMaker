//
//  Preview.swift
//  Gaki
//
//  Created by 間口秀人 on 2022/07/27.
//

import SwiftUI

struct ImagePreview: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var shareData: ShareData
    @Binding var layerImage: UIImage
    //ImageSaverで使う変数
    @State var showAlert = false
        var body: some View {
        //Image保存ボタン
        VStack {
            Image(uiImage: composedImages(originalImage: shareData.newImage!))
                .padding()
            Button(action: {
                
                //もしimageがnilでなければimageを保存
                if let image = shareData.newImage {
                    ImageSaver($showAlert).writeToPhotoAlbum(image: composedImages(originalImage: image))
                }
            }){
                Text("保存")
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .opacity(0.5)
                            .foregroundColor(Color.orange)
                    )
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text("画像を保存しました。"),
                    message: Text(""),
                    dismissButton: .default(Text("OK"), action: {
                        showAlert = false
                    }))
        }
        }
        .navigationTitle("プレビュー")
        .navigationBarBackButtonHidden(true)
                 .toolbar {
                     ToolbarItem(placement: .navigationBarLeading) {
                         Button(action: {
                             dismiss()
                         }) {
                             HStack {
                                 Image(systemName: "chevron.backward")
                                     .font(.system(size: 17, weight: .medium))
                                 Text("戻る")
                             }
                             .foregroundColor(.blue)
                         }
                     }
                 }
       
    }
    
    // 2つのUIImageを1つのUIImageに合成
    private func composedImages(originalImage: UIImage) -> UIImage {
        
        let layerImage : UIImage = layerImage
        let size = layerImage.size
        let oriWidth = originalImage.size.width
        let oriHight = originalImage.size.height
        let newWidth = size.width/2
        let newHight = newWidth/oriWidth * oriHight
        
        //originalImageとlayerImageを合成してcomposedImageとして返す
        UIGraphicsBeginImageContext(CGSize(width: size.width, height: size.height))
        layerImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        originalImage.draw(in: CGRect(x: size.width/2, y: (size.height-newHight)/2, width: newWidth, height: newHight))
        let composedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return composedImage
    }
}

//Imageを保存
class ImageSaver: NSObject {
    @Binding var showAlert: Bool
    
    init(_ showAlert: Binding<Bool>) {
        _showAlert = showAlert
    }
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(didFinishSavingImage), nil)
    }
    
    @objc func didFinishSavingImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        
        if error != nil {
            print("保存に失敗しました。")
        } else {
            showAlert = true
        }
    }
}

