.PHONY: install clean run-master

install:
	pip install -r requirements.txt

clean:
	rm -rf output
	mkdir -p output

run-master:
	jupyter nbconvert --to notebook --execute FINAL_THESIS.ipynb --inplace
