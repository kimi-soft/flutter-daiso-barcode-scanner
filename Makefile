target = daiso_barcode_scanner

all: build_android

clean:
	cd $(target) && \
	  flutter clean

build_android:
	cd $(target) && \
	  flutter build appbundle

run-%:
	cd $(target) && \
	  flutter run -d ${@:run-%=%}
