.PHONY: serve audit run run-yes test

# Start the mock client API on http://127.0.0.1:8099
serve:
	python -m uvicorn mock_api.server:app --host 127.0.0.1 --port 8099 --reload

# Peek at the side effects your skill has produced against a running server
audit:
	@curl -s http://127.0.0.1:8099/_audit | python -m json.tool

# Run the triage agent (interactive y/n approver)
run:
	python -m src.triage_skill

# Run the triage agent and auto-approve every action (useful for demos)
run-yes:
	python -m src.triage_skill --yes

# Run the test suite (no API key required)
test:
	python -m pytest tests/ -v
