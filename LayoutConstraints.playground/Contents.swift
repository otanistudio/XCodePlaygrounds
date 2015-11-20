/** 
 Demonstrates NSLayoutConstraints
*/
import UIKit
import XCPlayground

enum PinError: ErrorType {
    case RequiredSuperview
}

extension UIView {
    func pinToBottom() throws {
        guard let view = superview else {
            throw PinError.RequiredSuperview
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraintEqualToConstant(44.0).active = true
        self.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 0.0).active = true
        self.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: 0.0).active = true
        self.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: 0.0).active = true
    }
}

let mainView = UIView(frame: CGRectMake(0.0, 0.0, 400.0, 500.0))
mainView.backgroundColor = UIColor.lightGrayColor()
XCPlaygroundPage.currentPage.liveView = mainView

let rect: CGRect = CGRectMake(10.0, 10.0, 120.0, 120.0)

let whateverLabel = UILabel(frame: rect)
whateverLabel.backgroundColor = UIColor.whiteColor()
whateverLabel.text = "Whatever"
mainView.addSubview(whateverLabel)

let bottomLabel = UILabel(frame: rect)
bottomLabel.backgroundColor = UIColor.whiteColor()
bottomLabel.text = "Bottom"
do {
   try bottomLabel.pinToBottom()
} catch PinError.RequiredSuperview {
    debugPrint("superview required before pinning")
}
mainView.addSubview(bottomLabel)
try! bottomLabel.pinToBottom()


