
test: test.vala
	valac -g --save-temps --Xcc='-w' --pkg gee-0.8 test.vala

clean:
	rm test test.c

