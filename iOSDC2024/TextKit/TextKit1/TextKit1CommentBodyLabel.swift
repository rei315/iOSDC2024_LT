import UIKit

final class TextKit1CommentBodyLabel: UIView {
    private var attributedTextHashValue: Int = 0
    var attributedText: NSAttributedString? {
        didSet {
            addAttachmentViews()
            setNeedsDisplay()
        }
    }
    
    private func addAttachmentViews() {
        subviews.forEach({ $0.removeFromSuperview() })
        guard let attributedText = self.attributedText else { return }
        let range = (attributedText.string as NSString).range(of: attributedText.string)
        attributedText.enumerateAttribute(.attachment, in: range, options: .longestEffectiveRangeNotRequired) { (result, range, _) in
            guard let attachment = result as? TextKit1Attachment else { return }
            addSubview(attachment.view)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func draw(_ rect: CGRect) {
        attributedText?.draw(in: rect)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        guard let attributedText = self.attributedText else { return }
        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: bounds.size)
        layoutManager.addTextContainer(textContainer)
        textContainer.lineFragmentPadding = 0
        let range = (attributedText.string as NSString).range(of: attributedText.string)
        attributedText.enumerateAttribute(.attachment, in: range, options: .longestEffectiveRangeNotRequired) { (result, range, _) in
            guard let attachment = result as? TextKit1Attachment else { return }
            let glyphRange = layoutManager.glyphRange(forCharacterRange: range, actualCharacterRange: nil)
            let glyphRect = layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
            if let attachmentView = viewWithTag(attachment.tag) {
                attachmentView.frame.origin = CGPoint(x: glyphRect.origin.x + attachment.offset.x, y: glyphRect.origin.y + attachment.offset.y)
                attachmentView.frame.size = attachmentView.intrinsicContentSize
            }
        }
    }
}
