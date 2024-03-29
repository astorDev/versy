# Marketplacing a Shell GitHub Action

## Goal

## Inputs

- You can have multiplace actions per repository. **But** you can't marketplace such repository. In a marketplaced repository you need to have exactly one action.
- You can't have workflows in a marketplaced repository.

## Steps

- [x] Start a branch `marketplacing_suffix` 
- [x] Create `.sh`
- [x] Test with `test.sh`
- [x] Test with `.github/workflows/suffix-marketplacing.yaml` with `remote_call` job
- [x] Test with `.github/workflows/suffix-marketplacing.yaml` with `action_call` job
    - [x] Create the action based on `remote_call`
        - [x] Wrap the remote call and output in to GITHUB_OUTPUT
            - [x] provide id (for output)
            - [x] add shell
            - [x] use `script_branch`
        - [x] Meta information
            - [x] Input `script_branch`
            - [x] Output `suffix`
    - [x] Create `local_action` workflow step with current `marketplacing_suffix` suffix
- [x] Merge the code in `main` (don't delete the existing branch)

Snapshot of `.github/workflows/suffix-marketplacing.yaml`:

```yaml
on:
  push:
    paths:
      - '.github/workflows/suffix-marketplacing.yaml'
      - 'suffix/marketplacing/**'
jobs:
  remote_call:
    runs-on: ubuntu-latest
    steps:
      - run: curl -sSL https://raw.githubusercontent.com/astorDev/versy/$BRANCH/suffix/marketplacing/.sh | sh
        env:
          BRANCH: ${{ github.ref_name }}
  local_action:
    runs-on: ubuntu-latest
    steps:
      - id: suffix 
        uses: astorDev/versy/suffix/marketplacing@marketplacing_suffix
        with:
          script_branch: ${{ github.ref_name }}
      - run: echo "Suffix is '${{ steps.suffix.outputs.suffix }}'"
```

- [x] Create branch `suffix-marketplaced`
- [x] Test workflow with `main` branch
- [x] Create repository `suffix` with default README.md
- [x] Start `init` branch in `suffix` repo
- [x] Create a wrapper action in the repository
- [x] Test the repository action via versy workflow `marketplace_action`
- [x] Merge `init`.
- [x] Test the action from main
- [x] Merge `suffix-marketplaced`
- [x] Add a tag to remote release

```
git tag v1.0
git push origin v1.0
```

- [x] Publish the `suffix` to GitHub marketplace.
- [x] Update suffix README

## Wrapping Approach Drawbacks

- Studying marketplaced action itself doesn't provide any information on how the logic actually works.