//
//  ContentView.swift
//  Gaki
//
//  Created by 間口秀人 on 2022/07/19.
//
import UIKit
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var shareData: ShareData
    
    init() {
        setupNavigationBar()
    }
     
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.orange)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    //ImageSaverで使う変数
    @State var showAlert = false
    //ImagePickerで使う変数
    @State var showingImagePicker = false
    
    
    var body: some View {
        NavigationView{
            VStack {
                
                //画像表示
                if let uiImage = shareData.newImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Rectangle())
                    NavigationLink(destination: SelectImageView()){
                        Text("合成させる画像を選ぶ")
                            .font(Font.system(size: 20).bold())
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .opacity(0.5)
                                    .foregroundColor(Color.orange)
                            )
                    }
                    
                } else {
                    
                    VStack {
                        Image("AppIcon0")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 20)
                        Text("イメージセリフメーカー")
                            .padding()
                            .font(.title)
                    }
                }
                Spacer().frame(height: 32)
                Button(action: {
                    showingImagePicker = true
                }) {
                    Text("合成元の画像をフォトライブラリから選択")
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .opacity(0.5)
                                .foregroundColor(Color.orange)
                        )
                    
                }
                
                
            }
            .navigationTitle("イメージセリフメーカー")
            .navigationBarTitleDisplayMode(.inline)
            //画像選択へ
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(sourceType: .photoLibrary)
            }
        }
        
    }
    
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ShareData())
    }
}
