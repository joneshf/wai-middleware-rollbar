# yesod-example

## Requirements

- Install [stack][stack]
- Install [dotenv][dotenv]

## Getting Started

Compile the application:

```
stack build
```

Copy project [access token][access-token] with `post_server_item` scope to
`.env` file:

```
cp .env.example .env
```

Start the server:

```
dotenv "stack build --exec yesod-example"
```

[access-token]: https://docs.rollbar.com/reference#section-project-access-tokens
[dotenv]: https://github.com/stackbuilders/dotenv-hs
[stack]: https://docs.haskellstack.org/en/stable/README/#how-to-install
