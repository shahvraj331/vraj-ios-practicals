import UIKit

class UISignUpViewController: UIViewController, UINavigationControllerDelegate {

    //MARK: - Outlets
    @IBOutlet weak var lblAgeOfUser: UILabel!
    @IBOutlet weak var tfEmailOfUser: UITextField!
    @IBOutlet weak var tfPasswordOfUser: UITextField!
    @IBOutlet weak var pbSubmitProgress: UIProgressView!
    @IBOutlet weak var btnBack: UIImageView!
    @IBOutlet weak var tvBioOfUser: UITextView!
    @IBOutlet weak var rbMale: UIButton!
    @IBOutlet weak var rbFemale: UIButton!
    @IBOutlet weak var imageOfUser: UIImageView!
    @IBOutlet weak var ivImagePicker: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: - Variables
    var genderStatusArray = [false, false]
    let dateFormatter = DateFormatter()
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        addTouchGestures()
        setupTextView()
    }
    
    //MARK: - Actions
    @IBAction func onUISliderValueChanged(_ sender: UISlider) {
        let ageOfUser = String(Int(sender.value))
        lblAgeOfUser.text = ageOfUser
    }
    
    @IBAction func onSubmitClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 5.0) {
            self.pbSubmitProgress.setProgress(1.0, animated: true)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.0) {
            Validation.showToast(controller: self, message: "Sigup Success", seconds: 1.5)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 7.5) {
            self.performSegue(withIdentifier: "goToPractical2", sender: self)
            self.pbSubmitProgress.setProgress(0.0, animated: true)
        }
    }
    
    @IBAction func onMaleButtonClicked(_ sender: UIButton) {
        if !genderStatusArray[0] {
            rbMale.isSelected = true
            rbFemale.isSelected = false
            genderStatusArray = [true, false]
        }
    }
    
    @IBAction func onFemaleButtonClicked(_ sender: UIButton) {
        if !genderStatusArray[1] {
            rbFemale.isSelected = true
            rbMale.isSelected = false
            genderStatusArray = [false, true]
        }
    }
    
    //MARK: - File private functions
    fileprivate func setUpViewController() {
        tfEmailOfUser.layer.borderColor = UIColor.black.cgColor
        tfEmailOfUser.layer.borderWidth = 0.5
        tfEmailOfUser.layer.cornerRadius = 5
        
        tfPasswordOfUser.layer.borderColor = UIColor.black.cgColor
        tfPasswordOfUser.layer.borderWidth = 0.5
        tfPasswordOfUser.layer.cornerRadius = 5
        
        tvBioOfUser.layer.borderColor = UIColor.black.cgColor
        tvBioOfUser.layer.borderWidth = 0.5
        tvBioOfUser.layer.cornerRadius = 5
        
        imageOfUser.layer.masksToBounds = true
        imageOfUser.layer.cornerRadius = imageOfUser.frame.height / 2

        self.dismissKeyboardOnTap(view)
        dateFormatter.dateFormat = DateFormat.dateMonthYear.rawValue
    }
    
    fileprivate func addTouchGestures() {
        var gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goBackToHome))
        btnBack.addGestureRecognizer(gestureRecognizer)
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickUpImage))
        ivImagePicker.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func goBackToHome() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func pickUpImage() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePickerViewController = UIImagePickerController()
            imagePickerViewController.delegate = self
            imagePickerViewController.sourceType = UIImagePickerController.SourceType.photoLibrary;
            imagePickerViewController.allowsEditing = false
            self.present(imagePickerViewController, animated: true, completion: nil)
        }
    }
    
    fileprivate func setupTextView() {
        let toolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()
        tvBioOfUser.inputAccessoryView = toolbar
    }
        
    @objc func doneButtonTapped() {
        tvBioOfUser.endEditing(true)
    }
    
}//End of class

//MARK: - UIImagePickerControllerDelegate
extension UISignUpViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage
        imageOfUser.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
    
}//End of extension

//MARK: - UITextFieldDelegate
extension UISignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfEmailOfUser {
            textField.resignFirstResponder()
            tfPasswordOfUser.becomeFirstResponder()
        } else if textField == tfPasswordOfUser {
            textField.resignFirstResponder()
            tvBioOfUser.becomeFirstResponder()
        }
        return true
    }
    
}//End of extension
