# cinemapedia

## Test the app

- To run this project you need to have [Flutter](https://docs.flutter.dev/get-started/install) installed. Since this app is intended to be used in a mobile device i suggest to have an emulator (IOS / ANDROID) to test it, however it can be run as a web app. A tutorial to create an android emulator using android studio can be found at https://youtu.be/GhuiNcOEv1A.
- On the project directory type ```flutter pub get``` to install the dependencies. 
- In [VSCODE](https://code.visualstudio.com) you can select a device to test the project using CTRL + SHIFT + P, then on the main.dart file press F5.


## Dev

1. Copiar el .env.template y renombrarlo a .env
2. Cambiar las variables de entorno (TheMovieDB)
3. Cambios en la entidad, hay que ejecutaar el comando
```flutter pub run build_runner build```
