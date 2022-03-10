import UIKit

class MainVCCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            navController?.pushViewController(mainVC, animated: true)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        
    }
    
}//End of class
