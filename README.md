# technical_challenge_02

## Setup

- Configure host: https://github.com/juniormesquitadandao/gerlessver

```sh
cd github
  docker compose config
  docker compose build
  docker compose up -d
  docker compose exec app bash
    ruby app/question_01.rb
    ruby app/question_02.rb
    ruby app/question_03.rb
    exit
  docker compose down
```
