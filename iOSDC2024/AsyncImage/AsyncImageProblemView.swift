import SwiftUI

struct AsyncImageProblemView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(asyncImageProblem, id: \.self) { url in
                    /// Wrong Pattern
//                    AsyncImage(url: $0) { result in
//                        result.resizable()
//                    } placeholder: {
//                        ProgressView()
//                    }
//                    .frame(width: 200, height: 200)
                    
                    /// Correct Code
                    ReloadAsyncImageView(imageURL: url)
                        .frame(width: 200, height: 200)
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
            case .failure(_):
                ReloadAsyncImageView(imageURL: imageURL)
            @unknown default:
                ProgressView()
            }
        }
    }
}
