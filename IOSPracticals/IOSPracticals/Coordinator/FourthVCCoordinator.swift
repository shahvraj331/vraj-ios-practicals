import UIKit

class FourthVCCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let fourthVC = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController {
            fourthVC.coordinator = self
            navController?.pushViewController(fourthVC, animated: true)
        }
    }
    
    func startWithData(_ completion: @escaping (String) -> Void) {
        if let fourthVC = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController {
            fourthVC.coordinator = self
            fourthVC.completion = completion
            navController?.pushViewController(fourthVC, animated: true)
        }
    }
    
    func goToVCByIndex(_ index: Int) {
        if let vcList = navController?.viewControllers {
            navController?.popToViewController(vcList[index], animated: true)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
    
}//End of class
