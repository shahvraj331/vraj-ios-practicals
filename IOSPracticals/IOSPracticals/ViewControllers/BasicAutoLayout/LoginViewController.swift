import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    //MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    var receivedToken: String?

    //MARK: - Outlets
    @IBOutlet weak var lblGoToSignUpVC: UILabel!
    @IBOutlet weak var ivGoogleLogo: UIImageView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //MARK: - UIViewControllers
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    //MARK: - Actions
    @IBAction func goToHomeScreen(_ sender: UIButton) {
        guard let email = tfEmail.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let password = tfPassword.text?.trimmingCharacters(in: .whitespaces) else { return }
        
        if (email.isEmpty || password.isEmpty) {
            Validation.showToast(controller: self, message: "Enter missing credentials", seconds: 1.5)
        } else {
            validateCredentials(email, password)
        }
    }
    
    @IBAction func showOrHidePasswordAction(_ sender: UIButton) {
        tfPassword.isSecureTextEntry = sender.isSelected
        sender.isSelected = !sender.isSelected
    }
    
    //MARK: - File private functions
    fileprivate func initializeView() {
        self.title = "Login"
        self.dismissKeyboardOnTap(view)
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToSignUpVC(_: )))
        lblGoToSignUpVC.addGestureRecognizer(guestureRecognizer)
        ivGoogleLogo.layer.borderColor = UIColor.gray.cgColor
        ivGoogleLogo.layer.borderWidth = 0.5
    }
    
    @objc fileprivate func goToSignUpVC(_ sender: Any) {
        validateCredentials("eve.holt@reqres.in", "cityslicka")
    }
    
    fileprivate func validateCredentials(_ email: String, _ password: String) {
        let uploadDataModel = UploadData(email: email, password: password)
        guard let url = URL(string: ApiUrl.loginRequestURL.rawValue) else { return }
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else { return }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else { return }
                guard let responseToken = try? JSONDecoder().decode(LoginSuccess.self, from: jsonData) else { return }
                DispatchQueue.main.async {
                    self.receivedToken = responseToken.token
                    if (self.receivedToken != nil && response.statusCode == 200) {
                        self.coordinator?.startUsersListVC()
                    } else {
                        Validation.showToast(controller: self, message: "Wrong credentials", seconds: 1.5)
                    }
                }
            } catch {
                return
            }
        }.resume()
    }
    
}//End of class

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
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
