import UIKit

class TextKit1Cell: UITableViewCell {
    let label: TextKit1CommentBodyLabel = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .red.withAlphaComponent(0.5)
        contentView.addSubview(label)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func configure(showIcon: Bool) {
        let string: NSMutableAttributedString = .init()
        
        let imageView = BadgeView(image: .init(systemName: "square.and.pencil.circle.fill")!)
        imageView.frame = .init(x: 0, y: 0, width: 40, height: 40)
        let attachment = TextKit1Attachment(
            view: imageView,
            offset: .init(x: 0, y: 0)
        )
        attachment.textRect = .init(origin: .init(x: 0, y: -15), size: .init(width: 40, height: 40))
        
        let text = "TextKit1" + (showIcon ? " with Tibetan emoji❤️‍🔥ྀི" : "")
        string.append(.init(string: text))
        string.append(.init(attachment: attachment))
        label.attributedText = string
    }
}
