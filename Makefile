
TEST_PATH=./online_test.py

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	find . -name '__pycache__' -exec rm -rf {} +

clean-build:
	rm --force --recursive build/
	rm --force --recursive dist/
	rm --force --recursive *.egg-info

clean: clean-pyc clean-build

doc:
	cd docs;make pre;make html;cd ..

lint:
	flake8 --filename = ./pygsheets/*.py

test: clean-pyc
	cd test;py.test -vs --cov ../pygsheets $(TEST_PATH);cd ..

install:
	python setup.py install

publish: clean
	python setup.py publish

.PHONY: clean-pyc clean-build
