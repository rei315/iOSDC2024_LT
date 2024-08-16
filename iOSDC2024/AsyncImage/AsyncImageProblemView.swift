import SwiftUI

struct AsyncImageProblemView: View {
    let data: [URL] = [
        .init(string: "https://picsum.photos/200")!,
        .init(string: "https://picsum.photos/201")!,
        .init(string: "https://picsum.photos/202")!,
        .init(string: "https://picsum.photos/203")!,
        .init(string: "https://picsum.photos/204")!,
        .init(string: "https://picsum.photos/205")!,
        .init(string: "https://picsum.photos/206")!,
        .init(string: "https://picsum.photos/207")!,
        .init(string: "https://picsum.photos/208")!,
        .init(string: "https://picsum.photos/209")!,
        .init(string: "https://picsum.photos/210")!,
        .init(string: "https://picsum.photos/211")!,
        .init(string: "https://picsum.photos/212")!,
        .init(string: "https://picsum.photos/213")!,
        .init(string: "https://picsum.photos/214")!,
        .init(string: "https://picsum.photos/215")!,
        .init(string: "https://picsum.photos/216")!,
        .init(string: "https://picsum.photos/217")!,
        .init(string: "https://picsum.photos/218")!,
        .init(string: "https://picsum.photos/219")!,
        .init(string: "https://picsum.photos/220")!,
    ]
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(data, id: \.self) { url in
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
                Text("empty")
            case .failure(let error):
                ReloadAsyncImageView(imageURL: imageURL)
            @unknown default:
                ProgressView()
            }
        }
    }
}
