import UIKit


class TracklistViewController: UIViewController {

    @IBOutlet weak var artistButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    private let albumsGateway = AlbumsGateway()
    private let playlistsGateway = PlaylistsGateway()
    
    private var tracks: Observable<[Track]> = Observable<[Track]>(value: [])
    
    var album: Album?
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let album = self.album {
            Task { [weak self] in
                await self?.albumsGateway.fetchTracksForAlbum(album.id, { [weak self] tracks in
                    Task {
                        self?.tracks.value = tracks
                        self?.tableView.reloadData()
                    }
                })
            }
            self.title = album.title
            self.artistButton.setTitle(album.artist, for: .normal)
            self.addButton.isHidden = UsersGateway.shared.user?.Permission ?? 0 < 2
        }
        if let playlist = self.playlist {
            Task { [weak self] in
                await self?.playlistsGateway.fetchTracksForPlaylist(playlist.id, { [weak self] tracks in
                    Task {
                        self?.tracks.value = tracks
                        self?.tableView.reloadData()
                    }
                })
            }
            self.title = playlist.title
            self.artistButton.setTitle(playlist.owner, for: .normal)
            self.addButton.isHidden = UsersGateway.shared.user!.Login == playlist.owner
        }
        self.tracks.bind { [weak self] _ in
            Task {
                self?.tableView.reloadData()
            }
        }
        self.tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let album = self.album {
            Task { [weak self] in
                await self?.albumsGateway.fetchTracksForAlbum(album.id, { [weak self] tracks in
                    Task {
                        self?.tracks.value = tracks
                        self?.tableView.reloadData()
                    }
                })
            }
            self.title = album.title
            self.artistButton.setTitle(album.artist, for: .normal)
        }
        self.tracks.bind { [weak self] _ in
            Task {
                self?.tableView.reloadData()
            }
        }
        self.tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addClicked(_ sender: Any) {
        
    }
    
}

extension TracklistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tracks.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let config = self.tracks.value[indexPath.row].cellConfiguration()
        cell.setup(config.title, config.details, TracksGateway().associatedImage())
        return cell
    }
    
}

extension TracklistViewController: UITableViewDelegate {
    
}
