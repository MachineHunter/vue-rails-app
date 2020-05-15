namespace :metrics do
  task :loc do
    sh("rake stats")
    sh('echo', "----- view (erb) loc -----")
    sh('find ./app/views -name "*.erb" | xargs wc -l | grep total')
    sh('echo', "----- view (vue) loc -----")
    sh('find ./app/javascript -name "*.vue" | xargs wc -l | grep total')
    sh('echo', "----- view (js) loc -----")
    sh('find ./app/javascript -name "*.js" | xargs wc -l | grep total')
    sh('echo', "----- rake task loc -----")
    sh('find ./lib/tasks -name "*.rake" | xargs wc -l | grep total')
  end
end
