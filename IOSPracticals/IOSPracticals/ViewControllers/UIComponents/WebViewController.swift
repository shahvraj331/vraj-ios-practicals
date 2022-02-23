import UIKit
import WebKit

class WebViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var btnBack: UIImageView!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackFunctionality()
        loadUrl("")
        searchBar.delegate = self
    }
    
    //MARK: - Actions
    @IBAction func btnPDFOpener(_ sender: UIButton) {
        guard let pdfURL = Bundle.main.url(forResource: "sample", withExtension: "pdf") else {
            return
        }
        webView.loadFileURL(pdfURL, allowingReadAccessTo: pdfURL.deletingLastPathComponent())
    }
    
}//End of class

//MARK: - UISearchBarDelegate
extension WebViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlString = searchBar.text?.lowercased()
        if let text = urlString {
            if text.starts(with: "http://") {
                loadUrl(text)
            } else if (text.hasPrefix("www")) || (text.hasSuffix(".com")){
                loadUrl("http://\(text)")
            }else {
                searchTextOnGoogle(text)
            }
        }
    }
    
}//End of extension

//MARK: - File private functions
extension WebViewController {
    
    fileprivate func addBackFunctionality() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goBackToHome))
        btnBack.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func goBackToHome() {
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func loadUrl(_ urlString: String) {
        lazy var currentURL: URL = {
            if urlString == "" {
                if let url = URL(string: "https://www.google.com") {
                    return url
                }
            } else {
                if let url = URL(string: urlString) {
                    return url
                }
            }
            return URL(string: "")!
        }()
        webView.load(URLRequest(url: currentURL))
    }

    fileprivate func searchTextOnGoogle(_ text: String) {
        let textComponents = text.components(separatedBy: " ")
        let searchString = textComponents.joined(separator: "+")
        loadUrl("https://www.google.com/search?q=" + searchString)
    }

}//End of extension
