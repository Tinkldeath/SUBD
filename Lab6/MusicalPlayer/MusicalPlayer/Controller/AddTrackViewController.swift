import UIKit


class AddTrackViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var artistsTextView: UITextView!
    @IBOutlet weak var genresTextView: UITextView!
    @IBOutlet weak var albumLabel: UILabel!
    
    var availableArtists: [Artist] = []
    var availableGenres: [Genre] = []
    var availableAlbums: [Album] = []
    
    private var artists: Observable<[Artist]> = Observable<[Artist]>(value: [])
    private var genres: Observable<[Genre]> = Observable<[Genre]>(value: [])
    private var album: Observable<Album?> = Observable<Album?>(value: nil)
    
    private let gateway = TracksGateway()
    var main: MainViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.artists.bind { [weak self] artists in
            var str = "Aritsts:\n"
            for artist in artists {
                str += "\(artist.name)\n"
            }
            self?.artistsTextView.text = str
        }
        self.genres.bind { [weak self] genres in
            var str = "Genres:\n"
            for genre in genres {
                str += "\(genre.title)\n"
            }
            self?.genresTextView.text = str
        }
        self.album.bind { [weak self] value in
            self?.albumLabel.text = "Album: \(value?.title ?? "")"
        }
    }

    @IBAction func artistClicked(_ sender: Any) {
        let artists = self.artists.value
        let ac = UIAlertController(title: "Select artist", message: nil, preferredStyle: .alert)
        for artist in self.availableArtists {
            ac.addAction(UIAlertAction(title: artist.name, style: .default, handler: { [weak self] _ in
                if !artists.contains(where: { $0.id == artist.id }) {
                    self?.artists.value.append(artist)
                }
            }))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    @IBAction func genreClicked(_ sender: Any) {
        let genres = self.genres.value
        let ac = UIAlertController(title: "Select genre", message: nil, preferredStyle: .alert)
        for genre in self.availableGenres {
            ac.addAction(UIAlertAction(title: genre.title, style: .default, handler: { [weak self] _ in
                if !genres.contains(where: { $0.id == genre.id }) {
                    self?.genres.value.append(genre)
                }
            }))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    @IBAction func albumClicked(_ sender: Any) {
        let ac = UIAlertController(title: "Select album", message: nil, preferredStyle: .alert)
        for album in self.availableAlbums {
            ac.addAction(UIAlertAction(title: album.title, style: .default, handler: { [weak self] _ in
                self?.album.value = album
            }))
        }
        present(ac, animated: true)
    }
    
    @IBAction func addClicked(_ sender: Any) {
        guard let text = self.titleTextField.text else { return }
        let genres = self.genres.value
        let artists = self.artists.value
        let album = self.album.value
        if !text.isEmpty && genres.count != 0 && artists.count != 0 && album != nil {
            Task { [weak self] in
                await self?.gateway.addTrack(text, genres.map({ $0.id }), artists.map({ $0.id }), album!.id)
                await self?.main?.current.fetch()
            }
        }
    }
    
}
