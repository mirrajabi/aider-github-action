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
        uses: mirrajabi/aider-github-action@1.1.0
        timeout-minutes: 10 # So that you won't accidentally burn your LLM provider credits!
        with:
          api_key_env_name: OPENAI_API_KEY
          api_key_env_value: ${{ secrets.openai_api_key }}
          branch: ${{ fromJson(steps.create_branch.outputs.result).ref }}
          model: ${{ inputs.model }}
          aider_args: '--yes --message "Do this and that"'
```

#### Action Inputs

When using the action directly, you can pass the following inputs to it:

| Field Name      | Description                                                    | Required  | Type    | Default                  |
|------------------|---------------------------------------------------------------|-----------|---------|--------------------------|
| `aider_args`       | Space-delimited args to pass to aider (Example: `"--yes --message 'Make the dashboard sidebar purple'"`) | **true** | string       | -                        |
| `branch`           | Branch to run Aider on                                      | **false** | string  | main                     |
| `model`            | Model to run Aider with. Find available models on [this page](https://aider.chat/docs/llms.html)                                     | **true** | string  | -                        |
| `api_key_env_name`   | "The name of the environment variable. For example, OPENAI_API_KEY, ANTHROPIC_API_KEY, etc. See more info [here](https://aider.chat/docs/llms.html)       | **false** | string  | -                        |
| `api_key_env_value` | The API Key to use as the value of the `api_key_env_name`   | **false** | string  | -                        |

## Credits

This project uses [Paul Gauthier's Aider](https://github.com/paul-gauthier/aider). It's a great tool, and you should check it out! You can also use it as your local coding assistant.
