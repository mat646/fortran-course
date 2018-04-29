DIR = kind8

.PHONY: build

build:
	$(MAKE) -C $(DIR) build

build-all:
	make build DIR=kind4
	make build DIR=kind8
	make build DIR=kind16

run:
	$(MAKE) -C $(DIR) run

run-all:
	make run DIR=kind4
	make run DIR=kind8
	make run DIR=kind16

verbose-run:
	$(MAKE) -C $(DIR) verbose-run

clean-all:
	$(MAKE) -C kind4 clean
	$(MAKE) -C kind8 clean
	$(MAKE) -C kind16 clean
