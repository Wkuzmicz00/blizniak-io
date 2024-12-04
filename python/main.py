import sys
import os

from PySide6.QtGui import QGuiApplication
from PySide6.QtCore import QUrl, QObject, Slot
from PySide6.QtQml import QQmlApplicationEngine

class PhotoHandler(QObject):
    @Slot(str)
    def process_image(self, file_path):
        print(f"sciezka: {file_path}")


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    MODULE_DIR = os.path.dirname(__file__)
    QML_IMPORT_DIR = os.path.join(MODULE_DIR, "..", "ui")
    APP_PATH = os.path.join(MODULE_DIR, "..", "ui", "Main.qml")

    engine.addImportPath(QML_IMPORT_DIR)

    photo_handler = PhotoHandler()
    engine.rootContext().setContextProperty("photoHandler", photo_handler)

    engine.load(QUrl.fromLocalFile(APP_PATH))

    if not engine.rootObjects():
        sys.exit(-1)

    ex = app.exec()
    del engine
    sys.exit(ex)
