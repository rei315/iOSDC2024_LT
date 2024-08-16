import UIKit

final class BadgeView: UIView {
    init(image: UIImage) {
        super.init(frame: .init(origin: .zero, size: .init(width: 40, height: 40)))
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: .init(width: 40, height: 40)))
        imageView.image = image
        addSubview(imageView)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override var intrinsicContentSize: CGSize {
        bounds.size
    }
}
