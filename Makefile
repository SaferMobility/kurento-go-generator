.PHONY: all

all: clean prep build format

clean:
	rm -rf kurento
	rm kms-core-valid-json/*.json
	rm kms-elements-valid-json/*.json

prep:
	mkdir kurento

build:
	cd fix-kurento-json && ./gradlew run
	go run main.go

format:
	goimports -w ./kurento

test:
	cd kurento && go test -v

install: all
	cp -r kurento ..
