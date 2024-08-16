import UIKit

class TextKit2CustomAttachment: TextKit2Attachment {
    override func viewProvider(for parentView: UIView?, location: any NSTextLocation, textContainer: NSTextContainer?) -> NSTextAttachmentViewProvider? {
        TextKit2CustomAttachmentProvider(textAttachment: self, parentView: parentView, textLayoutManager: textContainer?.textLayoutManager, location: location)
    }
}

class TextKit2CustomAttachmentProvider: TextKit2ViewAttachmentProvider {
    override func loadView() {
        guard let attachment = textAttachment as? TextKit2Attachment else {
            view = UIView()
            return
        }
        view = attachment.viewProvider()
    }
}
