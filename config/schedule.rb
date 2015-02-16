# 事故防止の為RAILS_ENVの指定が無い場合にはdevelopmentを使用する
rails_env = ENV['RAILS_ENV'] || :development

# 実行環境の指定
set :environment, rails_env

# 出力先logの指定
set :output, 'log/crontab.log'

# 1時間毎に実行
every :hour do
  rake 'rake:task1'
end

# 1時間毎に実行
every 1.hour do
  rake 'rake:task2'
end

# production環境のみで設定
if rails_env.to_sym == :production
  # 3分毎に実行(crontabと記述方法を合わせる)
  every '*/3 * * * *' do
    rake 'rake:task3'
  end
end
