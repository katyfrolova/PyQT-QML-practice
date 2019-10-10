from datetime import datetime

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot, QTimer, pyqtProperty


class CurrentTime(QObject):

    changeDateTime = pyqtSignal()

    def __init__(self, parent=None):
        super().__init__(parent)
        self._time = datetime.now().time().strftime('%H:%M:%S')
        self._date = datetime.now().date().strftime('%d.%m.%y')

    @pyqtProperty(str, notify=changeDateTime)
    def date(self):
        return self._date

    @pyqtProperty(str, notify=changeDateTime)
    def time(self):
        return self._time

    def change_today(self):
        _time = datetime.now().time()
        _date = datetime.now().date()
        self._time = _time.strftime('%H:%M:%S')
        self._date = _date.strftime('%d.%m.%y')
        self.changeDateTime.emit()


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
        self._count = ' 00:00:00'
        self._open = ''

        timer = QTimer(self)
        timer.timeout.connect(self.counting)
        timer.setInterval(1000)
        timer.start()

    user_profile = pyqtSignal(str, str, str, str, str, arguments=['name', 'surname', 'age', 'avatar', 'info'])
    counter = pyqtSignal()
    open_changed = pyqtSignal()

    @pyqtSlot(str, str, str, str, str)
    def create(self, name, surname, age, avatar, info):
        self.user_profile.emit(name, surname, age, avatar, info)

    @pyqtProperty(str, notify=counter)
    def count(self):
        return self._count

    @pyqtProperty(str, notify=open_changed)
    def open(self):
        return self._open

    @open.setter
    def open(self, open):
        self._open = open
        self.open_changed.emit()

    @pyqtSlot()
    def set_open(self):
        self._open = datetime.now()
        self.open_changed.emit()

    def counting(self):
        try:
            self._count = datetime.now() - self._open
            self._count = str(self._count).split('.')[0]
        except TypeError:
            self._count = self._count
        self.counter.emit()
        print(self._count)





if __name__ == "__main__":
    import sys

    # создаём экземпляр приложения
    app = QGuiApplication(sys.argv)
    # создаём QML движок
    engine = QQmlApplicationEngine()
    # создаём объект калькулятора
    profile = Profile()
    today = CurrentTime()
    timer = QTimer()
    timer.timeout.connect(today.change_today)
    timer.setInterval(1000)
    timer.start()
    # и регистрируем его в контексте QML
    engine.rootContext().setContextProperty('change_date', today)
    engine.rootContext().setContextProperty("user_profile", profile)
    # загружаем файл qml в движок
    engine.load("main.qml")

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())
