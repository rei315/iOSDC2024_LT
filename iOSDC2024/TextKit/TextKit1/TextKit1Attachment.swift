import UIKit

public class TextKit1Attachment: NSTextAttachment {
    public let tag: Int = Int.random(in: 0..<Int.max)
    internal let view: UIView
    internal let offset: CGPoint
    public var textRect: CGRect {
        get { bounds }
        set { bounds = newValue }
    }
    
    public init(view: UIView, offset: CGPoint) {
        self.view = view
        self.offset = offset
        super.init(data: nil, ofType: "application/view")
        view.tag = tag
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func image(forBounds imageBounds: CGRect, textContainer: NSTextContainer?, characterIndex charIndex: Int) -> UIImage? {
        nil
    }
}
