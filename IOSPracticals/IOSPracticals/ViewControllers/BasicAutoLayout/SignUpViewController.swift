import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblGoToLoginVC: UILabel!
    @IBOutlet weak var ivGoogleLogo: UIImageView!
    @IBOutlet weak var tfFullName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //MARK: - Variables
    var fullName: String?
    var email: String?
    var password: String?
    
    //MARK: - UIViewControllers
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    //MARK: - Actions
    @IBAction func goBackToHome(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToHomeScreen(_ sender: UIButton) {
        do {
            try validateForm()
        } catch {
            var currentError = ""
            switch error {
            case SignUpValidation.fullNameEmpty:
                currentError = SignUpValidation.fullNameEmpty.getErrorDetail
            case SignUpValidation.emailEmpty:
                currentError = SignUpValidation.emailEmpty.getErrorDetail
            case SignUpValidation.passwordEmpty:
                currentError = SignUpValidation.passwordEmpty.getErrorDetail
            case SignUpValidation.passwordTooShort:
                currentError = SignUpValidation.passwordTooShort.getErrorDetail
            case SignUpValidation.emailNotValid:
                currentError = SignUpValidation.emailNotValid.getErrorDetail
            default:
                currentError = ""
            }
            Validation.showToast(controller: self, message: currentError, seconds: 1.5)
        }
    }
    
}//End of class

//MARK: - File private functions
extension SignUpViewController {
    
    @objc fileprivate func goToLoginVC(_ sender: Any) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    fileprivate func initializeView() {
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToLoginVC(_: )))
        lblGoToLoginVC.addGestureRecognizer(guestureRecognizer)
        ivGoogleLogo.layer.borderColor = UIColor.gray.cgColor
        ivGoogleLogo.layer.borderWidth = 0.5
    }
    
    fileprivate func validateForm() throws {
        fullName = tfFullName.text?.trimmingCharacters(in: .whitespaces)
        email = tfEmail.text?.trimmingCharacters(in: .whitespaces)
        password = tfPassword.text?.trimmingCharacters(in: .whitespaces)
        if let userFullName = fullName, let userEmail = email, let userPassword = password {
            if (userFullName.isEmpty) {
                throw SignUpValidation.fullNameEmpty
            } else if (userEmail.isEmpty) {
                throw SignUpValidation.emailEmpty
            } else if (userPassword.isEmpty) {
                throw SignUpValidation.passwordEmpty
            } else if (userPassword.count < 8) {
                throw SignUpValidation.passwordTooShort
            } else if (!Validation.isValidEmail(userEmail)) {
                throw SignUpValidation.emailNotValid
            } else {
                var userData: [String: String] = [:]
                userData["FullName"] = userFullName
                userData["Email"] = userEmail
                userData["Password"] = userPassword
                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController {
                    viewController.userData = userData
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
    }
    
}//End of extension
