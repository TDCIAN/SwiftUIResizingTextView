//
//  ContentView.swift
//  SwiftUIResizingTextView
//
//  Created by 김정민 on 2021/08/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var obj: Observed
    var body: some View {
        VStack {
            MultiTextField()
                .frame(height: self.obj.size < 150 ? self.obj.size : 150) // 최대 높이 150으로 제한
                .padding(10)
                .background(Color.yellow)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MultiTextField: UIViewRepresentable {
    
    @EnvironmentObject var obj: Observed
    
    func makeCoordinator() -> MultiTextField.Coordinator {
        return MultiTextField.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultiTextField>) -> UITextView {
        let view = UITextView()
        view.font = .systemFont(ofSize: 16)
        view.text = "Type Something"
        view.textColor = UIColor.black.withAlphaComponent(0.35)
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        self.obj.size = view.contentSize.height
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.isScrollEnabled = true
        
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiTextField>) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultiTextField
        init(parent1: MultiTextField) {
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.obj.size = textView.contentSize.height
        }
    }
}

class Observed: ObservableObject {
    @Published var size: CGFloat = 0
}
