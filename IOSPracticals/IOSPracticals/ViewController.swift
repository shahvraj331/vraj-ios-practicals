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
    
}//End of class

//MARK: - File private functions
extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBasicAutoLayout" {
            guard segue.destination is SignUpViewController else { return }
        }
    }
    
}//End of extension

