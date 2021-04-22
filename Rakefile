require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  system %Q{cp "$PWD/litestream.plist" "~/Library/LaunchAgents/"}
  puts "please run: launchctl load ~/Library/LaunchAgents/litestream.plist"
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc litestream.plist].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file}")
        puts "identical ~/.#{file}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

task :default => :install

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end