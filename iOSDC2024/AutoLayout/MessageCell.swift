import UIKit

final class MessageCell: UITableViewCell {
    @IBOutlet private weak var balloonView: UIView!
    @IBOutlet private weak var bodyContainer: UIView!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var reactionsView: UIView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var balloonViewBottomWithoutReactionsConstraint: NSLayoutConstraint!
    @IBOutlet private weak var balloonViewBottomWithReactionsConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearance()
    }
    
    private func setupAppearance() {
        backgroundColor = .clear
        backgroundView?.backgroundColor = .clear
        contentView.backgroundColor = .clear
        balloonView.layer.cornerRadius = 10
        balloonView.layer.borderWidth = 1
        balloonView.layer.borderColor = UIColor.red.cgColor
        
        bodyContainer.backgroundColor = .clear
        
        messageLabel.numberOfLines = 0
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.textColor = .black
        
        timeLabel.font = .systemFont(ofSize: 11)
        timeLabel.textColor = .black
        timeLabel.text = getTime()
        
        reactionsView.backgroundColor = .red
    }
    
    func configure(text: String, hasReactions: Bool) {
        messageLabel.text = text
        updateBalloonBottomMargin(hasReactions: hasReactions)
    }
    
    private func updateBalloonBottomMargin(hasReactions: Bool) {
        reactionsView.isHidden = !hasReactions
        if hasReactions {
            /// Wrong Pattern
            NSLayoutConstraint.deactivate([balloonViewBottomWithoutReactionsConstraint])
            NSLayoutConstraint.activate([balloonViewBottomWithReactionsConstraint])
            
            /// Correct Pattern
//            balloonViewBottomWithoutReactionsConstraint.priority = .defaultLow
//            balloonViewBottomWithReactionsConstraint.priority = .defaultHigh
            
        } else {
            /// Wrong Pattern
            NSLayoutConstraint.deactivate([balloonViewBottomWithReactionsConstraint])
            NSLayoutConstraint.activate([balloonViewBottomWithoutReactionsConstraint])
            
            /// Correct Pattern
//            balloonViewBottomWithReactionsConstraint.priority = .defaultLow
//            balloonViewBottomWithoutReactionsConstraint.priority = .defaultHigh
            
        }
    }
    
    private func getTime() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: now)
        return timeString
    }
}
