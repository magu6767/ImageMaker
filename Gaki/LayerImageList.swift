//
//  LayerImageList.swift
//  Gaki
//
//  Created by 間口秀人 on 2022/08/18.
//

import SwiftUI


struct LayerImageList: View {
    @Environment(\.dismiss) var dismiss

    @Binding var layerImage: UIImage
    var body: some View {
        VStack{
            Image(uiImage: layerImage)
                .padding()
            NavigationLink(destination: ImagePreview(layerImage: $layerImage)){
                Text("プレビュー画面へ")
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .opacity(0.5)
                            .foregroundColor(Color.orange)
                    )
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

struct LayerImageList_Previews: PreviewProvider {
    static var previews: some View {
        LayerImageList(layerImage: Binding.constant(UIImage(systemName: "Image0")!))
    }
}
