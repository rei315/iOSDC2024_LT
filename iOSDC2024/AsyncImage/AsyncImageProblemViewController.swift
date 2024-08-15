//
//  AsyncImageProblemViewController.swift
//  iOSDC2024
//
//  Created by mingukkim on 2024/08/16.
//

import UIKit
import SwiftUI

class AsyncImageProblemViewController: UIHostingController<AsyncImageProblemView> {
    init() {
        super.init(rootView: .init())
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
