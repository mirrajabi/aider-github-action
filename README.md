# Aider GitHub Action

This action runs [Aider](https://github.com/paul-gauthier/aider) in a container given a set of arguments, let's Aider apply changes, then it pushes the changes to the repository on the branch you pass to it.

## Usage

### Using Aider Github Workflows

The easiest and recommended way to use this action is to use the [aider-github-workflows](https://github.com/mirrajabi/aider-github-workflows).

See [Issue to PR workflow](https://github.com/mirrajabi/aider-github-workflows/blob/main/docs/issue-to-pr.md) which is a great place to start.

### Using the action by itself

In your workflow file, add the following step to your job:

```yaml
jobs:
  my_job:
    steps:
      - name: Apply changes with Aider
        uses: mirrajabi/aider-github-action@main
        timeout-minutes: 10 # So that you won't accidentally burn your OpenAI credits!
        with:
          openai_api_key: ${{ secrets.openai_api_key }}
          branch: ${{ fromJson(steps.create_branch.outputs.result).ref }}
          aider_args: '--model ${{ inputs.model }} --yes --message "${{ steps.create_prompt.outputs.result }}"'
```

#### Action Inputs

When using the action directly, you can pass the following inputs to it:

| Field Name      | Description                                                   | Required | Type    | Default                  |
|------------------|---------------------------------------------------------------|----------|---------|--------------------------|
| `aider_args`       | Space-delimited args to pass to aider (Example: `"--yes --message 'Make the dashboard sidebar purple'"`) | **true** | string       | -                        |
| `branch`           | Branch to run Aider on                                         | **true**     | string       | -                        |
| `openai_api_key`   | OpenAI API Key                                                | **true**     | string       | -                        |

## Roadmap

- [x] Put it out there
- [ ] Get it to a point where tagging it as `v1` makes sense.
- [ ] Investigate the possibilities of turning this into a Github App.

## Credits

This project uses [Paul Gauthier's Aider](https://github.com/paul-gauthier/aider). It's a great tool, and you should check it out! You can also use it as your local coding assistant.
