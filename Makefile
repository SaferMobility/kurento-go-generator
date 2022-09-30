.PHONY: all

all: clean prep build format

clean:
	rm -rf kurento

prep:
	mkdir kurento

build:
	go run main.go

format:
	goimports -w ./kurento

test:
	cd kurento && go test -v

install: all
	cp -r kurento ..
