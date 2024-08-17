import SwiftUI

struct AsyncImageProblemView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(asyncImageProblem, id: \.self) { url in
                    /// Wrong Pattern
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                        case .empty:
                            ProgressView()
                        case .failure(let error):
                            Text(error.localizedDescription)
                        @unknown default:
                            ProgressView()
                        }
                    }
                    .frame(width: 200, height: 200)
                    
                    /// Correct Code
//                    ReloadAsyncImageView(imageURL: url)
//                        .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct ReloadAsyncImageView: View {
    let imageURL: URL?
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
            case .empty:
                ProgressView()
            case .failure(let error):
                if error.localizedDescription == "cancelled" {
                    ReloadAsyncImageView(imageURL: imageURL)
                } else {
                    Text(error.localizedDescription)
                }
            @unknown default:
                ProgressView()
            }
        }
    }
}
