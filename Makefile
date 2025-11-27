.PHONY: install
install:
	uv sync


.PHONY: lint
lint:
	uv run ruff check .

.PHONY: fmt
fmt:
	uv run ruff format .

.PHONY: mypy
mypy:
	uv run mypy .

.PHONY: bandit
bandit:
	uv run bandit -c bandit.yaml -r .

.PHONY: radon
radon:
	uv run radon cc -s -a src

# ==== FULL QUALITY CHECK ====

.PHONY: qa
qa: fmt lint mypy bandit radon


.PHONY: run
run:
	uv run uvicorn src.app.main:app --reload

# ==== PRE-COMMIT ====

.PHONY: pre-commit-install
pre-commit-install:
	uv run pre-commit install

.PHONY: pre-commit-run
pre-commit-run:
	uv run pre-commit run --all-files
