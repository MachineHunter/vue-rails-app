namespace :metrics do
  verbose(false)

  task :loc do
    output = ""

    output += `rake stats`
    output += "\n"
    output += `echo "----- view (erb) loc -----"`
    output += `find ./app/views -name "*.erb" | xargs wc -l | grep total`
    output += "\n"
    output += `echo "----- view (vue) loc -----"`
    output += `find ./app/javascript -name "*.vue" | xargs wc -l | grep total`
    output += "\n"
    output += `echo "----- view (js) loc -----"`
    output += `find ./app/javascript -name "*.js" | xargs wc -l | grep total`
    output += "\n"

    puts output

    notifier = Slack::Notifier.new(
      ENV['WEBHOOK_URL'],
      channel: '#' + ENV['CHANNEL']
    )
    notifier.ping output
  end
end
