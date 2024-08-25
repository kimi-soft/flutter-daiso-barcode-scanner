all: run_chrome

clean:
	cd daiso_barcode_scanner && \
	  flutter clean

build_android:
	cd daiso_barcode_scanner && \
	  flutter build appbundle

run_edge:
	cd daiso_barcode_scanner && \
	  flutter run -d edge

run_chrome:
	cd daiso_barcode_scanner && \
	  flutter run -d chrome
