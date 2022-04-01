import UIKit

class MainVCCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            mainVC.coordinator = self
            navController?.pushViewController(mainVC, animated: true)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        
    }
    
    func startWebService() {
        if let navController = navController {
            let webServiceVC = AuthenticationCoordinator(navController)
            webServiceVC.start()
        }
    }
    
}//End of class
