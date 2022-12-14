import UIKit


class AddAlbumViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var artistButton: UIButton!
    
    let albumsGateway = AlbumsGateway()
    let artistsGateway = ArtistsGateway()
    
    var artists = [Artist]()
    var selectedArtist: Artist?
    var mainVC: MainViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.artistsGateway.entities.bind { [weak self] value in
            self?.artists = value as! [Artist]
        }
        Task { [weak self] in
            await self?.artistsGateway.fetch()
        }
    }
    
    
    @IBAction func artistClicked(_ sender: Any) {
        let ac = UIAlertController(title: "Select artist", message: nil, preferredStyle: .alert)
        for artist in self.artists {
            ac.addAction(UIAlertAction(title: artist.name, style: .default, handler: { [weak self] _ in
                self?.selectedArtist = artist
                self?.artistButton.setTitle(artist.name, for: .normal)
            }))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    @IBAction func addClicked(_ sender: Any) {
        guard let title = self.titleTextField.text else { return }
        guard let selectedArtist = self.selectedArtist else { return }
        self.albumsGateway.addAlbum(title, selectedArtist.id)
        let ac = UIAlertController(title: "Album created", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        Task { [weak self] in
            await self?.mainVC?.current.fetch()
        }
    }
    
}
