import UIKit

class UILoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var btnBack: UIImageView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    //MARK: - Actions
    @IBAction func onLoginClicked(_ sender: UIButton) {
        Validation.showToast(controller: self, message: "Login Success", seconds: 1.5)
    }
    
    //MARK: - File private functions
    fileprivate func initUI() {
        addBackFunctionality()
        self.dismissKeyboardOnTap(view)
    }
    
    fileprivate func addBackFunctionality() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goBackToHome))
        btnBack.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func goBackToHome() {
        dismiss(animated: true, completion: nil)
    }
    
}//End of class

//MARK: - UITextFieldDelegate
extension UILoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfEmail {
            textField.resignFirstResponder()
            self.tfPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}//End of extension
