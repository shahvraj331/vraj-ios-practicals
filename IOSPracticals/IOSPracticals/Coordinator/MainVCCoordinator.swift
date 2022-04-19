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
        navController?.popToRootViewController(animated: true)
    }
    
    func startWebService() {
        if let navController = navController {
            let webServiceVC = AuthenticationCoordinator(navController)
            webServiceVC.start()
        }
    }
    
    func startIOSArchitecture() {
        let iosArchitecture = ArchitectureViewController.instantiate(from: .mvcArchitecture)
        iosArchitecture.coordinator = self
        navController?.pushViewController(iosArchitecture, animated: true)
    }
    
    func startMVCArchitecture() {
        if let navController = navController {
            let loginVC = MVCCoordinator(navController)
            loginVC.start()
        }
    }
    
    func startMVPArchitecture() {
        let mvpArchitecture = MVPViewController.instantiate(from: .mvpArchitecture)
        navController?.pushViewController(mvpArchitecture, animated: true)
    }
    
    func startCustomControl() {
        let customControl = RegistrationViewController.instantiate(from: .customControl)
        navController?.pushViewController(customControl, animated: true)
    }
        
}//End of class
