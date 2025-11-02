import UIKit

final class AuthViewController: UIViewController {
    private let segueToWebViewIdentifier = "ShowWebView"
    
    @IBOutlet var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWebViewIdentifier {
            guard
                let webViewViewController = segue.destination as? WebViewViewController
            else {
                print("Failed to prepare for \(segueToWebViewIdentifier)")
                return
            }
            webViewViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
    
    private func configureBackButton() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .ypBlackIOS
    }
}
    
    extension AuthViewController: WebViewViewControllerDelegate {
        func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
            // TODO: process code
        }
        
        func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
            vc.dismiss(animated: true)
        }
    }
