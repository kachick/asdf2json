# asdf2json

[![CI](https://github.com/kachick/asdf2json/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/kachick/asdf2json/actions/workflows/ci.yml?query=branch%3Amain++)

Parse asdf .tool-versions and outputs with JSON

## Usage

Assume, in your GitHub Actions workflow.

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Install asdf parser
        run: wget https://github.com/kachick/asdf2json/releases/download/v1/asdf2json && chmod 755 asdf2json
      - id: asdf-parser
        run: cat .tool-versions | ./asdf2json | echo "json=$(</dev/stdin)" | tee -a $GITHUB_OUTPUT
      - uses: actions/setup-node@v3
        with:
          node-version: "${{ fromJson(steps.asdf-parser.outputs.json).nodejs }}"
```

## License

MIT License

Originally imported from [kachick/action-parse-asdf-tool-versions@v2.0.1](https://github.com/kachick/action-parse-asdf-tool-versions/tree/v2.0.1).
