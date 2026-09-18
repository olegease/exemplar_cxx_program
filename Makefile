.PHONY: usage cmake ninja build debug flash presets clean wipe-tmp
# commands
usage:
	@cat Makefile.usage.txt

cmake:
	@echo "configuring project as default preset into build"
	@cmake --preset default

ninja:
	@echo "generating project as default preset into build"
	@cmake --build --preset default

build:
	@echo "configuring and generating project as default preset into build"
	@cmake --preset default
	@cmake --build --preset default

debug:
	@echo "configuring and generating project as debug preset into temp"
	@cmake --preset debug
	@cmake --build --preset debug

flash:
	@echo "configuring and generating project as release preset into temp"
	@cmake --preset flash
	@cmake --build --preset flash

presets:
	@echo "copy user presets example if not exists"
	@cp -n CMakeUserPresets.example.json CMakeUserPresets.json

clean:
	@echo "cleaning build directory"
	@rm -fr build/
	@git restore build/.gitignore

wipe-tmp:
	@echo "cleaning temp presets_ directory"
	@rm -fr temp/presets_/
