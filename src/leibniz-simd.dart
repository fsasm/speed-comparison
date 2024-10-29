import "dart:io";
import "dart:typed_data";

void main() {
	var file = File("rounds.txt");
	int rounds = int.parse(file.readAsStringSync());
	const unroll = 2;

	var x = Float64x2(-1.0, 1.0);
	var two = Float64x2(2.0, 2.0);
	var minus_one = Float64x2(-1.0, -1.0);
	var psum = Float64x2.zero();
	var ivec = Float64x2(2.0, 3.0);

	rounds += 2;
	int i = 2;
	for (; i < rounds; i += unroll) {
		psum += Float64x2(-1.0, 1.0) / (Float64x2.splat(2.0) * ivec - Float64x2.splat(1.0));
		ivec += two;
	}

	// tail
	var tx = 1.0;
	var tsum = 0.0;
	for (; i < rounds; i++) {
		tx *= -1;
		tsum += tx / (2 * i - 1).toDouble();
	}

	var pi = (1.0 + psum.x + psum.y + tsum) * 4.0;

	print("$pi");
}
