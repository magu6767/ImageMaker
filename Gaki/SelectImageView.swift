//
//  SelectImageView.swift
//  Gaki
//
//  Created by 間口秀人 on 2022/08/18.
//

import SwiftUI




struct SelectImageView: View {
    @Environment(\.dismiss) var dismiss

    @State var imageList : [Layer] = [
        Layer(image: UIImage(named: "Image0")!, text: "ガキが... 舐めてると潰すぞ"),
        Layer(image: UIImage(named: "Image1")!, text: "人は愚かなものです"),
        Layer(image: UIImage(named: "Image2")!, text: "特にお前"),
        Layer(image: UIImage(named: "Image3")!, text: "働いたら負けかなと思ってる"),
        Layer(image: UIImage(named: "Image4")!, text: "よろしい　ならば戦争だ"),
        Layer(image: UIImage(named: "Image5")!, text: "人間性が欠落してる..."),
        Layer(image: UIImage(named: "Image6")!, text: "あっ..."),
        Layer(image: UIImage(named: "Image7")!, text: "（やばい）"),
        Layer(image: UIImage(named: "Image8")!, text: "そろそろ本気出すかな"),
        Layer(image: UIImage(named: "Image9")!, text: "は？"),
        Layer(image: UIImage(named: "Image10")!, text: "（考え中）"),
    ]
    var body: some View {
        VStack {
            
            List($imageList){ $item in
                ZStack {
                    NavigationLink(destination: LayerImageList(layerImage: $item.image)){
                        EmptyView()
                    }
                    .listRowSeparator(.visible)
                    .opacity(0)
                    VStack {
                        Image(uiImage: item.image)
                            .padding(.top, 10)
                        Text(item.text)
                            .padding(10)
                    }
                }
            }
            .navigationTitle("合成用画像の選択")
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
    }
}

struct SelectImageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectImageView()
    }
}
