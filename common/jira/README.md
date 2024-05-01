# Setup jira-cli

### JIRA CLI Configuration Steps

1. **Generate a Personal Access Token (PAT)**:
   - Click your profile picture in Jira, then navigate to **Profile** -> **Personal Access Tokens**.
   - Click on "Create Token", name it, and save the generated token.

2. **Configure Environment Variables**:
   - Set `JIRA_AUTH_TYPE` to `bearer`.
   - Set `JIRA_API_TOKEN` to your newly generated token.

3. **Initialize JIRA CLI**:
   - Execute `jira init` and enter your email or username when prompted.
   - select local
   - select bearer
   - type your jira url
   - type your jira email
   - done.


### Example

add these keys to your .zshrc config:

```sh
export JIRA_AUTH="bearer"
export JIRA_API_TOKEN="private_token_copy_pasted_from_your_jira_profile"
```

for my config:

-  create a file called "jira" under custom/zsh/private/jira and paste keys

