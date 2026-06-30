.PHONY: install clean run-master

install:
	python -m pip install -r requirements.txt

clean:
	rm -rf output
	mkdir -p output

run-master:
	python -m jupyter nbconvert --to notebook --execute FINAL_THESIS.ipynb --inplace
