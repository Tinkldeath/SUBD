import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var usersGateway = UsersGateway.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        self.usersGateway.register(self.loginTextField.text ?? "", self.passwordTextField.text ?? "") { [weak self] registered, error in
            if registered {
                Task {
                    let ac = UIAlertController(title: "Successfully registered", message: "You can sign in now", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(ac, animated: true)
                    return
                }
            }
            if let error = error {
                Task {
                    let ac = UIAlertController(title: "An error occured", message: "\(error.domain)", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(ac, animated: true)
                    return
                }
            }
        }
    }
    
}
