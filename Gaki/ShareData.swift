//
//  ShareData.swift
//  Gaki
//
//  Created by 間口秀人 on 2022/08/18.
//

import Foundation
import UIKit
import SwiftUI

class ShareData: ObservableObject {
    @Published var newImage : UIImage?
    
}

struct Layer: Identifiable {
    var id = UUID()
    var image = UIImage()
    var text = String()
}
