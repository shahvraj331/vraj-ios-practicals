import UIKit

class ViewController: UIViewController {

    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Actions
    @IBAction func goToBasicAutoLayout(_ sender: UIButton) {
        performSegue(withIdentifier: "goToBasicAutoLayout", sender: self)
    }
    
    @IBAction func goToUIComponent(_ sender: UIButton) {
        performSegue(withIdentifier: "goToUIComponent", sender: self)
    }
    
}//End of class

//MARK: - File private functions
extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBasicAutoLayout" {
            guard segue.destination is SignUpViewController else { return }
        } else if segue.identifier == "goToUIComponent" {
            guard segue.destination is UISignUpViewController else { return }
        }
    }
    
}//End of extension

