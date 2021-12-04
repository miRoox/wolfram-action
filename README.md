# wolfram action

[![GitHub Actions Status](https://github.com/miRoox/wolfram-action/workflows/Test%20Action/badge.svg)](https://github.com/miRoox/wolfram-action/actions)

**Deprecated, suggest to use the workflows based on the on-demand license entitlements, see details on [WolframResearch/WL-FunctionCompile-CI-Template](https://github.com/WolframResearch/WL-FunctionCompile-CI-Template).**

GitHub action to run Wolfram language code.

It runs in [a docker image](https://hub.docker.com/repository/docker/miroox/wolfram-engine-docker) with a [Wolfram Engine](https://www.wolfram.com/engine/) installed.

## Inputs

### `file`

**Required** The script file to run.

### `args`

The extra arguments to be passed to the script.

## Authentication

You need `WOLFRAM_ID` and `WOLFRAM_PASS` environment variables to activate the [Wolfram Engine](https://www.wolfram.com/engine/) and authenticate the [Wolfram Cloud](https://www.wolframcloud.com/), see [Creating and using encrypted secrets](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets) for using encrypted secrets in your workflow.

### `WOLFRAM_ID`

**Required** Your Wolfram ID.

### `WOLFRAM_PASS`

**Required** Your Wolfram ID password.

## Example usage

```yaml
on: [push]
jobs:
  run_wolfram:
    name: Run Wolfram language code
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v1
    - name: Run Wolfram script
      uses: miRoox/wolfram-action@master
      with:
        file: script.wl
      env:
        WOLFRAM_ID: ${{ secrets.WolframID }}
        WOLFRAM_PASS: ${{ secrets.WolframPW }}
```

