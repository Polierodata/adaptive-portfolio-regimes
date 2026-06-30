.PHONY: venv install clean run-master reproduce

PYTHON := ./venv/bin/python

venv:
	python3 -m venv venv

install: venv
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r requirements.txt

clean:
	rm -rf output

run-master:
	$(PYTHON) -m jupyter nbconvert --to notebook --execute FINAL_THESIS.ipynb --inplace

reproduce: clean run-master