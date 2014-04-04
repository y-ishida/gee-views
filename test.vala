using Gee;

class Hoge.Vector : Object {
	public int x;
	public int y;

	public Vector(int x, int y) {
		this.x = x;
		this.y = y;
	}
}

void al_test() {
	var al = new ArrayList<int>();
	for(int i = 0; i < 5; i++)
		al.add(10 * (i + 1));

	message("element type = %s", al.element_type.name());

	foreach(var e in al)
		message("%d", e);
}

void hs_test() {
	var hs = new HashSet<int>();

	for(int i = 0; i < 10; i++)
		hs.add(100 * (i + 1));

	message("element type = %s", hs.element_type.name());

	foreach(var e in hs)
		message("%d", e);
}

void al_test2() {
	var al = new ArrayList<Hoge.Vector>();
	for(int i = 0; i < 5; i++)
		al.add(new Hoge.Vector(i, 5 - i));

	message("element type = %s", al.element_type.name());

	foreach(var e in al)
		message("(%d, %d)", e.x, e.y);
}

int main(string[] args) {
	al_test();
	hs_test();
	al_test2();
	return 0;
}


