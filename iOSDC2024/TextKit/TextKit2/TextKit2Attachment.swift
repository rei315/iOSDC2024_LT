import UIKit

public class TextKit2Attachment: NSTextAttachment {
    internal let viewProvider: () -> UIView
    public let textRect: CGRect
    
    public init(viewProvider: @escaping () -> UIView, textRect: CGRect) {
        self.viewProvider = viewProvider
        self.textRect = textRect
        super.init(data: nil, ofType: "application/view")
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func image(forBounds imageBounds: CGRect, textContainer: NSTextContainer?, characterIndex charIndex: Int) -> UIImage? {
        nil
    }
}


public class TextKit2ViewAttachmentProvider: NSTextAttachmentViewProvider {
    public override init(textAttachment: NSTextAttachment, parentView: UIView?, textLayoutManager: NSTextLayoutManager?, location: any NSTextLocation) {
        super.init(textAttachment: textAttachment, parentView: parentView, textLayoutManager: textLayoutManager, location: location)
        tracksTextAttachmentViewBounds = true
    }
    
    public override func attachmentBounds(for attributes: [NSAttributedString.Key: Any], location: any NSTextLocation, textContainer: NSTextContainer?, proposedLineFragment: CGRect, position: CGPoint)
    -> CGRect
    {
        guard let attachment = textAttachment as? TextKit2Attachment else {
            return self.view?.bounds ?? .zero
        }
        return attachment.textRect
    }
}
