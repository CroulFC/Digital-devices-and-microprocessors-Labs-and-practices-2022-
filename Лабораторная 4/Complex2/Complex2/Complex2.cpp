#include <iostream>

using namespace std;

float fun_el(int i, float z) {
	float f;
	f = powl(z, -i) / sin(i * z);
	return f;
}

float SumR(int n, float x) {
	float sum = 0;
	for (unsigned int k = 0; k < n; k++) {
		sum += fun_el(k, x);
	}
	return sum;
}

int main(int argc, char** argv)
{
	int n = 100;
	float x = 0.5;
	float R = SumR(n, x);
	cout << "Result: " << R << endl;
	return 0;
}
