# Thesis Replication Repository

This repository contains the reproducible empirical pipeline of the MSc thesis on portfolio optimization and adaptive regime-aware portfolio management.

The project reproduces the full workflow from raw price data to market regime identification, covariance estimation, portfolio optimization, adaptive portfolio construction, performance evaluation, and final reproducibility checks.

The repository is intended to provide an executable replication package for the empirical analysis of the thesis. In particular, the master notebook includes the full pipeline leading to the final analysis dataset and the baseline evaluation tables of the thesis.

## Repository Structure

adaptive-portfolio-regimes/

* .gitignore
* FDATA.xlsx
* FINAL_THESIS.ipynb
* Makefile
* MSc_Thesis_Adaptive_Portfolio_Regimes.pdf
* README.md
* requirements.txt

## Main Files

* FDATA.xlsx: Input dataset used in the thesis replication.
* FINAL_THESIS.ipynb: Master notebook containing the full empirical pipeline.
* Makefile: Automation file used on macOS/Linux systems to create the local virtual environment, install dependencies, clean generated outputs, and execute the master notebook from the command line.
* MSc_Thesis_Adaptive_Portfolio_Regimes.pdf: Full MSc thesis document describing the theoretical background, methodological framework, empirical analysis, and interpretation of results.
* README.md: Repository documentation and reproducibility instructions.
* requirements.txt: Frozen Python environment used for the successful execution of the master notebook.
* output/: Generated folder created automatically during notebook execution. It stores Excel outputs and intermediate results and is not tracked in Git.

## Thesis Document

The full MSc thesis document is included in this repository as:

```text
MSc_Thesis_Adaptive_Portfolio_Regimes.pdf
```

The thesis provides the theoretical background, literature context, methodological design, empirical results, and interpretation of the portfolio optimization and market regime analysis.

The notebook, dataset, requirements file, and Makefile provide the reproducible computational implementation of the empirical pipeline described in the thesis.

## Empirical Pipeline

The master notebook includes the following stages:

1. Data loading and preprocessing
2. Market environment analysis
3. Covariance estimators and covariance matrices
4. Markowitz mean-variance optimization variants
5. Risk Parity portfolio optimization variants
6. CVaR portfolio optimization variants
7. Final analysis dataset and baseline evaluation
8. Adaptive portfolio simulation
9. Adaptive portfolio versus static strategies
10. Extended performance analysis
11. Final outputs and reproducibility checks

The final analysis dataset and baseline evaluation are produced in Section 7 of the notebook. This section includes the reproduction of the core baseline evaluation tables used in the thesis.

## Reproducibility Instructions

The repository is designed to be executable from a clean local copy.

The Python virtual environment is not included in the repository and must be created locally. Generated outputs are also not included in the repository. They are recreated by running the master notebook.

## macOS / Linux

On macOS/Linux systems where `make` is available, create the virtual environment and install the required packages using:

```bash
python3 -m venv venv
make install
```

The full reproduction can then be executed with:

```bash
make reproduce
```

The command `make reproduce` performs the following steps:

```text
make clean
make run-master
```

It removes previous generated outputs and executes the master notebook from the command line.

A successful execution recreates the `output/` folder and writes the generated Excel outputs inside it.

Alternatively, the master notebook can be executed directly from Jupyter or VS Code using:

```text
Restart Kernel -> Run All Cells
```

## Windows PowerShell

On Windows PowerShell, `make` may not be available by default. The equivalent tested workflow is the following.

Create a virtual environment:

```powershell
py -m venv venv
```

If the `py` launcher is not available, use:

```powershell
python -m venv venv
```

Install the required packages using the Python interpreter inside the virtual environment:

```powershell
.\venv\Scripts\python.exe -m pip install -r requirements.txt
```

Optional clean step: remove previous generated outputs:

```powershell
Remove-Item -Recurse -Force output -ErrorAction SilentlyContinue
```

Execute the master notebook from the command line:

```powershell
.\venv\Scripts\python.exe -m jupyter nbconvert --to notebook --execute FINAL_THESIS.ipynb --inplace
```

A successful execution recreates the `output/` folder and writes the generated Excel outputs inside it.

On Windows, a RuntimeWarning related to the Proactor event loop may appear during notebook execution. This warning does not indicate failure if `nbconvert` completes and writes the executed notebook successfully.

A successful command-line execution should end with a message similar to:

```text
[NbConvertApp] Writing ... bytes to FINAL_THESIS.ipynb
```

## Expected Validation Output

A successful run should complete the final section of the notebook:

```text
Final Outputs and Reproducibility Checks
```

The expected validation output includes:

```text
All required final objects are available.

Number of rolling windows: 22

analysis_df rows: 22

Core reproducibility checks passed successfully.
```

## Outputs

The notebook generates output files in the `output/` folder, including covariance matrices, optimization results, market regime outputs, final analysis workbooks, and adaptive portfolio results.

The `output/` folder is not part of the tracked repository. It is created automatically during execution.

Generated outputs are not the source of the analysis. They are reproducible results produced by running the notebook from the raw input dataset and code.

## Reproducibility Note

The repository is intended to allow full replication of the thesis pipeline from:

```text
FDATA.xlsx + FINAL_THESIS.ipynb + requirements.txt
```

For macOS/Linux users, the shortest reproducible command-line workflow is:

```bash
python3 -m venv venv
make install
make reproduce
```

For Windows PowerShell users, the tested command-line workflow is:

```powershell
py -m venv venv
.\venv\Scripts\python.exe -m pip install -r requirements.txt
.\venv\Scripts\python.exe -m jupyter nbconvert --to notebook --execute FINAL_THESIS.ipynb --inplace
```

The final validation section of the notebook confirms the consistency of the main objects and the expected number of rolling windows.