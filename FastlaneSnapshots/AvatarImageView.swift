import SwiftUI

struct AvatarImageView: View {

    struct ViewModel {
        let image: Image
        let playerColor:  Color
    }

    @State var viewModel: ViewModel
    @State private var score = 0

    var body: some View {
        HStack {
            viewForBody
            scoreTextBody
            stepper
        }
    }

    private var viewForBody: some View {
        return
            viewModel.image
            .resizable()
            .mask(Circle())
            .overlay(
                Circle()
                    .stroke(lineWidth: 5)
                    .foregroundColor(viewModel.playerColor)
            )
            .frame(width: 52, height: 52)
    }

    private var scoreTextBody: some View {
        Text("\(score)")
    }

    private var stepper: some View {
        Stepper("", onIncrement: {
            score += 1
        }, onDecrement: {
            score -= 1
        })

    }
}

struct AvatarImageView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImageView(viewModel: .init(image: Image("daisy"), playerColor: .green))
            .previewLayout(.fixed(width: 100, height: 100))
    }
}

