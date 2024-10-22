%.x: %.cu
	nvcc $< -o $@

clean:
	rm *.x
