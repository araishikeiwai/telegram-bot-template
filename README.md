# Telegram Bot Template
## Using Ruby

How to create your own Telegram bot:
- Make sure your machine is Ruby ready
- Clone the project (tip: clone into your project name folder, i.e. `git clone git@github.com:araishikeiwai/telegram-bot-template.git project-name`)
- Modify the git remote url in case you want to push it to your own repository
- Run `cd project-name`
- Run `cp config/inits/init.rb.sample config/inits/init.rb`
- Edit `config/inits/init.rb` and fill in your bot token and project name
- Modify `Gemfile` to your needs
- Run `bundle install`
- Run `bundle exec rake [namespace]:init` (namespace is what you defined in `config/inits/init.rb`)
- Add your bot logic to the InputProcessor class located in `lib/[namespace]/input_processor.rb`
- Run your bot with `bundle exec rake [namespace]:start`
