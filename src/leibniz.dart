import "dart:io";

void main() {
	var file = File("rounds.txt");
	int rounds = int.parse(file.readAsStringSync());

	var x = 1.0;
	var pi = 1.0;

	rounds += 2;

	for (int i = 2; i < rounds; i++) {
		x *= -1;
		pi += x / (2 * i - 1).toDouble();
	}

	pi *= 4;
	print("$pi");
}
