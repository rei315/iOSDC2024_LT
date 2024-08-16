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
