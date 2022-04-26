import UIKit

extension UIViewController {

    func dismissKeyboardOnTap(_ view: UIView) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func addTitleWithDefaultBackButton(title: String) {
        self.title = title
        self.navigationItem.backButtonTitle = "Back"
    }
    
}//End of extension
