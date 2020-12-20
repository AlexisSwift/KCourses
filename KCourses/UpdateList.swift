//
//  UpdateList.swift
//  KCourses
//
//  Created by Sasha Kondratjeva on 20.12.2020.
//

import SwiftUI

struct UpdateList: View {

   var updates = updateData
   @ObservedObject var store = UpdateStore(updates: updateData)

   func addUpdate() {
      store.updates.append(Update(image: "Certificate1", title: "New Title", text: "New Text", date: "JUL 1"))
   }

   func move(from source: IndexSet, to destination: Int) {
      store.updates.swapAt(source.first!, destination)
   }

   var body: some View {
      NavigationView {
         List {
            ForEach(store.updates) { item in
               NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                  HStack(spacing: 12.0) {
                     Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .background(Color("background"))
                        .cornerRadius(20)

                     VStack(alignment: .leading) {
                        Text(item.title)
                           .font(.headline)

                        Text(item.text)
                           .lineLimit(2)
                           .lineSpacing(4)
                           .font(.subheadline)
                           .frame(height: 50.0)

                        Text(item.date)
                           .font(.caption)
                           .fontWeight(.bold)
                           .foregroundColor(.gray)
                     }
                  }
               }
               .padding(.vertical, 8.0)
            }
            .onDelete { index in
               self.store.updates.remove(at: index.first!)
            }
            .onMove(perform: move)
         }
         .navigationBarTitle(Text("Обновления"))
//         .navigationBarItems(
//            leading: Button(action: addUpdate) { Text("Add Update") },
//            trailing: EditButton()
//         )
      }
   }
}

#if DEBUG
struct UpdateList_Previews: PreviewProvider {
   static var previews: some View {
      UpdateList()
   }
}
#endif

struct Update: Identifiable {
   var id = UUID()
   var image: String
   var title: String
   var text: String
   var date: String
}

let updateData = [
   Update(image: "Illustration1", title: "SwiftUI", text: "Узнайте, как строить пользовательские представления и элементы управления в SwiftUI с расширенной композицией, макетированием, графикой и анимацией. Посмотрите демо-версию высокопроизводительного анимационного элемента управления и посмотрите, как он шаг за шагом выполняется в коде. Получите более глубокое представление о системе компоновки в SwiftUI.", date: "26 Июня"),
   Update(image: "Illustration2", title: "Framer X", text: "Узнайте, как строить пользовательские представления и элементы управления в SwiftUI с расширенной композицией, макетированием, графикой и анимацией. Посмотрите демо-версию высокопроизводительного анимационного элемента управления и посмотрите, как он шаг за шагом выполняется в коде. Получите более глубокое представление о системе компоновки в SwiftUI.", date: "11 Июня"),
   Update(image: "Illustration3", title: "CSS Layout", text: "Узнайте, как совместить CSS сетку, Flexbox, анимацию и отзывчивый дизайн для создания красивого прототипа в CodePen.", date: "26 Мая"),
   Update(image: "Illustration4", title: "React Native Part 2", text: "Узнайте, как реализовать жесты, анимацию Lottie и вход в Firebase.", date: "15 Мая"),
   Update(image: "Certificate1", title: "Unity", text: "Курс Unity преподает основы C#, assets, level design и геймплей.", date: "19 Март"),
   Update(image: "Certificate2", title: "React Native for Designers", text: "Создайте собственное приложение для iOS и Android с анимацией, Redux и API.", date: "14 Февраля"),
   Update(image: "Certificate3", title: "Vue.js", text: "Сделайте инструментальное веб-приложение с полной системой входа в систему, темной темой и анимированными диаграммами для ваших данных.", date: "23 Января")
]

