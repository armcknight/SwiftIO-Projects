build-blink:
	mm build --name Blink --binary-type executable --input ./Blink --output ./build

run-blink: clean build-blink
	mm board --run ./build/swiftio.bin

clean:
	rm -r ./build
