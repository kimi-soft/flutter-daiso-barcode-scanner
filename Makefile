target = daiso_barcode_scanner

all: build_android

clean:
	cd $(target) && \
	  flutter clean

build_android:
	cd $(target) && \
	  flutter build appbundle

run_%:
	cd $(target) && \
	  flutter run -d ${@:run_%=%}

update_app_icon:
	cd $(target) && \
	  flutter pub run flutter_launcher_icons:main
