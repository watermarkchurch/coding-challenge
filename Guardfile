# frozen_string_literal: true

directories %w[app config lib spec]

def watch_async(regexp)
  raise ArgumentError, 'No block given' unless block_given?

  match_queue = Queue.new

  watch(regexp) do |match|
    # Producer - add matches to the match queue
    match_queue << match
    nil
  end

  # Consumer - process matches as a batch
  Thread.new do
    loop do
      matches = []
      matches << match_queue.pop

      loop do
        matches << match_queue.pop(true)
      rescue ThreadError
        break
      end

      begin
        yield matches unless matches.empty?
      rescue StandardError => e
        warn "Error! #{e}"
      end
    end
  end
end

group :red_green_refactor, halt_on_fail: true do
  guard :rspec, cmd: 'bundle exec rspec --order rand', all_on_start: false do
    require 'guard/rspec/dsl'
    dsl = Guard::RSpec::Dsl.new(self)

    # RSpec files
    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }
    watch(rspec.spec_files)

    # Ruby files
    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)

    # Rails files
    rails = dsl.rails(view_extensions: %w[erb haml slim])
    dsl.watch_spec_files_for(rails.app_files)
    dsl.watch_spec_files_for(rails.views)

    watch(rails.controllers) do |m|
      [
        rspec.spec.call("routing/#{m[1]}_routing"),
        rspec.spec.call("controllers/#{m[1]}_controller"),
        rspec.spec.call("acceptance/#{m[1]}")
      ]
    end

    # Rails config changes
    watch(rails.spec_helper)     { rspec.spec_dir }
    watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
    watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

    # Capybara features specs
    watch(rails.view_dirs)     { |m| rspec.spec.call("features/#{m[1]}") }
    watch(rails.layouts)       { |m| rspec.spec.call("features/#{m[1]}") }

    # Migrations
    watch(%r{^db/migrate/(.+).rb}) { |m| rspec.spec.call("migrations/#{m[1]}") }

    # Turnip features and steps
    watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
      Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
    end

    # json api schemas
    watch(%r{^public/docs/schemas/(.+).schema.json$}) { "#{rspec.spec_dir}/controllers/api" }

    # rake tasks
    watch(%r{lib/tasks/(.+).rake}) { |m| rspec.spec.call("tasks/#{m[1]}") }
  end

  guard :shell, all_on_start: false do
    watch_async(%r{^app/assets/javascripts/(?!lib/contentful/generated)(.+)}) do |_match|
      system('yarn test')
    end
    ignore %r{^app/assets/javascripts/(.+)/generated/(.+)}
  end

  guard :rubocop, cli: ['--display-cop-names'] do
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end

  # guard :shell, all_on_start: false do
  #   watch_async(%r{^app/views/(.+\.html.*\.erb)}) do |matches|
  #     system("bundle exec erblint #{matches.map { |m| m[0] }.join(' ')}")
  #   end
  # end
end

group :autofix do
  guard :rubocop, all_on_start: false, cli: ['--auto-correct', '--display-cop-names'] do
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end

  # guard :shell, all_on_start: false do
  #   watch_async(%r{^app/views/(.+\.html.*\.erb)}) do |matches|
  #     system("bundle exec erblint --autocorrect -- #{matches.map { |m| m[0] }.join(' ')}")
  #   end
  # end
end

scope group: :red_green_refactor
