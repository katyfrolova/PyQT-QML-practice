from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot


class User:
    def __init__(self):
        self.first_name = None
        self.last_name = None
        self.info = None
        self.avatar = None
        self.age = None
        self.user_data = {}

    def create_data(self, **kwargs):
        self.user_data = {**kwargs}
        self.first_name = self.user_data.get('name')
        self.last_name = self.user_data.get('surname')
        self.info = self.user_data.get('info')
        self.age = self.user_data.get('age')
        self.avatar = self.user_data.get('avatar')



class Profile(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)

    user_profile = pyqtSignal(str, str, str, str, str, arguments=['name', 'surname', 'age', 'avatar', 'info'])
    # слот для суммирования двух чисел
    @pyqtSlot(str, str, str, str, str)
    def create(self, name, surname, age, avatar, info):
        self.user_profile.emit(name, surname, age, avatar, info)


if __name__ == "__main__":
    import sys

    # создаём экземпляр приложения
    app = QGuiApplication(sys.argv)
    # создаём QML движок
    engine = QQmlApplicationEngine()
    # создаём объект калькулятора
    profile = Profile()
    # и регистрируем его в контексте QML
    engine.rootContext().setContextProperty("user_profile", profile)
    # загружаем файл qml в движок
    engine.load("main.qml")

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())

