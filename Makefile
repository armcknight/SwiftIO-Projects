build-blink:
	mm build --name Blink --binary-type executable --input ./Blink --output ./build

run-blink: clean build-blink
	mm board --run ./build/swiftio.bin

build-potentiometer:
	mm build --name Potentiometer --binary-type executable --input ./Potentiometer --output ./build

run-potentiometer: clean build-potentiometer
	mm board --run ./build/swiftio.bin

clean:
	rm -r ./build
