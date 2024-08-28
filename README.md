# Aider GitHub Action

This action runs [Aider](https://github.com/paul-gauthier/aider) in a container given a set of arguments, let's Aider apply changes, then it pushes the changes to the repository on the branch you pass to it.

## Usage

### Using Aider GitHub Workflows

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
          model: ${{ inputs.model }}
          aider_args: '--yes --message "${{ steps.create_prompt.outputs.result }}"'
```

#### Action Inputs

When using the action directly, you can pass the following inputs to it:

| Field Name      | Description                                                    | Required  | Type    | Default                  |
|------------------|---------------------------------------------------------------|-----------|---------|--------------------------|
| `aider_args`       | Space-delimited args to pass to aider (Example: `"--yes --message 'Make the dashboard sidebar purple'"`) | **true** | string       | -                        |
| `branch`           | Branch to run Aider on                                      | **false** | string  | main                     |
| `model`            | Model to run Aider with. Find available models on [this page](https://aider.chat/docs/llms.html)                                     | **false** | string  | `gpt-4-1106-preview`                        |
| `openai_api_key`   | OpenAI API Key                                              | **false** | string  | -                        |
| `anthropic_api_key`| Anthropic API Key                                           | **false** | string  | -                        |
| `gemini_api_key`   | Gemini API Key                                              | **false** | string  | -                        |
| `groq_api_key`     | Groq API Key                                                | **false** | string  | -                        |
| `cohere_api_key`   | Cohere API Key                                              | **false** | string  | -                        |
| `deepseek_api_key` | Deepseek API Key                                            | **false** | string  | -                        |
| `openrouter_api_key`| OpenRouter API Key                                         | **false** | string  | -                        |

## Roadmap

- [x] Put it out there
- [ ] Get it to a point where tagging it as `v1` makes sense.
- [ ] Investigate the possibilities of turning this into a GitHub App.

## Credits

This project uses [Paul Gauthier's Aider](https://github.com/paul-gauthier/aider). It's a great tool, and you should check it out! You can also use it as your local coding assistant.
